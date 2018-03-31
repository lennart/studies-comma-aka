require 'fileutils'

def addtolib(filename, root, threshold = 0.99)
  silencet = -1 * [70 - (threshold * 100).to_i, 36].max
  libid = "#{(threshold * 100).to_i}s#{silencet.abs}"
  lib = File.join(root, libid)
  puts "cut: #{threshold}/#{silencet}"
  dir = cutfile(File.expand_path(filename), libid, threshold, silencet)
  parsedir(dir)
  Dir["#{dir}/000*.wav"]
    .map { |f| File.basename(f).split '-' }
    .group_by { |k| "#{k[0][4..5]}-#{k[1]}" }
    .map do |grp, samples|
    FileUtils.mkdir_p(File.join(lib,grp))
    samples.map { |f| f.join '-' }.map do |f|
      File.rename "#{dir}/#{f}", File.expand_path(File.join(lib, grp, File.basename(f)))
    end
    samples.size
  end
end

def cutfile(filename, libid, threshold, silencet)
  dir = File.join(File.dirname(filename), "#{File.basename(filename, File.extname(filename))}-#{libid}")
  `aubio cut -t #{threshold} -s #{silencet} -o #{dir} #{filename}` unless File.exist?(dir)
  dir
end

def parsedir(dir)
  # don't reparse!
  return unless Dir["#{dir}/*.wav"].select {|f| /\A[0-9]{6}-[0-9]{2}-[0-9]{3}.*/ =~ File.basename(f) }.size.zero?
  progress = 0
  slice_size = 100
  files = Dir["#{dir}/*.wav"]
  files.each_slice(slice_size) do |slice|
    children = slice.map do |file|
      fork do
        scape = parsescape file
        
        unless scape.nil?
          time = parsetime(file)
          pitch = scape.first
          if time < 100.0
            File.rename file, File.join(File.dirname(file), scapename(file, time, pitch))
          else
            puts "#{File.basename file} is too long, omitting"
          end
        end
      end
    end
    progress += slice.size
    puts "scape parsing: #{progress}/#{files.size}"
    children.map { |c| Process.wait c }
  end
end

# pitch detect highpass filtered wav
def parsescape(filename)
  `/bin/bash -c "aubio notes -T ms <(sox #{filename} -t wav - highpass 1k) 2>&1"`.split(/\n/).map { |s| s.split(/\t/) }
    .select { |w| w.size == 3 }.first # Detected pitches appear as <pitch>\t<begin-ms>\t<end-ms>
end

def scapename(filename, secondsf, pitch)
  seconds = secondsf.to_i
  ms = ((secondsf - seconds) * 10).round
  "#{'%06d' % seconds}-#{'%02d' % ms}-#{'%03d' % pitch.to_i}-#{File.basename filename}"
end

# as seconds (floating)
def parsetime(filename)
  parts = `ffprobe #{filename} 2>&1`.split(/\n/).select { |l| l.match(/Duration/) }
            .first.strip.split(/,/).first.split(/ /).last.split(/:/)
  (parts[0].to_i * 60 * 60) + (parts[1].to_i * 60) + parts[2].to_f
end

file = ARGV[0]
libroot = ARGV[1]
thresholds = ARGV[2].split(',').map(&:to_f)

files = if File.directory?(file)
          [Dir["#{file}/*.wav"], Dir["#{file}/*.WAV"]].flatten
        else
          [file]
        end

puts thresholds.map {|t| files.map {|f| addtolib(f, libroot, t) } }
