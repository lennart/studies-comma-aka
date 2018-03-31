# studies, aka

Within the livecoding pattern language [tidalcycles][tidal], there exists an implementation of the so called [bjorklund algorithm][bjorklund] (closely related to the euclidian algorithm) creating patterns of a given amount of hits distributed across a certain metric.

While this allows to create complex rhythmic patterns by entering a tuple of whole numbers in a text editor, some of the creatable rhythms can be retraced back to early persian, caribbean or—as used in these studies—african origins.

In short: two numbers in a text editor represent hundreds of years of cultural heritage.

In order to understand the relation between this heritage and plain numbers and to overcome my hesitance to work with this algorithm in performances, I started by picking one of the number pairs, a rhythm necklace used in dances of the aka pygmies in central africa and planned on dissecting this rhythm and field recordings of dances ([Musique Pour La Danse Lombe: Bobangi][bobangi]) possibly containing this rhythm.

My interest in the aka pygmy music is somehow comprised of the prominent use of repetition, polyrhythm and the use of voices without too much focus on textual content within the singing.

Initially I asked myself: "_When_ does cultural identity appear or vanish when livecoding?" or "_How_ does the reduction or addition of elements of the dances create or break the link between a computerized, mechanic, algorithmic version of the rhythm and the acoustically performed one?"

## method

The following five studies were produced by livecoding in tidalcycles for approximately one hour each. After each recording I wrote a poem for it and extracted a representative portion of five minutes from the video.

These studies however document how my perception changes during their conception and may or may not answer the above or any other questions at all.

I thought about different parameters that could be altered in each study—like speed—in order to document their effects on the material  
and started with the first study, trying to beat match the pure `(11,24,14)` rhythm with a field recording.
 
### study one
[![study one](https://img.youtube.com/vi/mYptyc4FmFE/0.jpg)](https://www.youtube.com/watch?v=mYptyc4FmFE "study one")

> how to find a loop  
if you can neither find a beginning  
or an end
>
> how to find the right tempo  
if you do not know  
what the _beat_ is
>
> how to isolate a rhythm  
if it is interwoven  
and falls apart when found
>
> how to know what is artifical  
and what is original  
if all you do is stare onto
>
> a computer screen  
with text

After the first study I lost interest in trying to find other technical parameters that I could investigate in.   
The material appeared much more dense and much more complex than expected  
which led me to alter the direction of my studies onto different perspectives:  
first technical followed by ethnographical. 

The subject of my second study livecodes the same sample as used in the first study.  
In other words: I observed myself while programmatically weeding through the field recording with algorithms.  
Occasionally I talk to myself  
in written form.

### study two
[![study two](https://img.youtube.com/vi/dsfUOTskMqk/0.jpg)](https://www.youtube.com/watch?v=dsfUOTskMqk "study two")

> there is no hurry
>
> once things pass  
you will revolve
>
> revisiting, revising
>
> look at loop from a different angle:
>
> constructing loop  
listen to loop
>
> changing loop  
removing loop marks
>
> discovering loop  
in a stream  

The second study ended with a loop which could not distinguish anymore (not part of the above video).  
I did not know whether I was listening to the unedited recording,  
or a sampled loop I programmed.  
I lost control and could not get it back.

While it was interesting to observe the result of the program,  
losing control but not getting lost within coding felt like something was missing.

I wanted to play with the elements of the music, not _just_ with my perception.  
So I chose to create a dub version of the aka pygmy dance.


### study three
[![study three](https://img.youtube.com/vi/ba2pHWpXeXg/0.jpg)](https://www.youtube.com/watch?v=ba2pHWpXeXg "study three")

> there may be a _to_  
in _through_.
>
> lead
>
> a keyboard to unlock
>
> oh how we bounce

After this one. I had to take a break of a least two weeks before being able to do another study.  
It felt like I exhausted the material, only to realize I was the one being exhausted.

One day I stopped looking for a new idea to make another study and instead used an old one.  
I [algorithmically cut](scape.rb) the field recording into onset detected samples  
and organized them by length into groups. Each sample group was sorted by pitch, ascending.

The idea is to play with the material—the sample library—one time and without knowing which samples were where  
i.e. I did not know beforehand what samples appear in the `00-00` (shorter than 100ms) group.

### study four
[![study four](https://img.youtube.com/vi/BL5GbwYgkTo/0.jpg)](https://www.youtube.com/watch?v=BL5GbwYgkTo "study four")

> with every repetition  
the cuts in human voices  
go deeper
>
> with less rests  
how can we hear more?
>
> what does it mean: to capture?

It turned out to be a kind of kitsch.

After these four studies I got interested in seeing how much of the rhythmic structure of a common aka pygmy dance is necessary to perceive it as one of their dances. Which led me to the last study: synthesis

In contrast to the former four, this study does not use samples sound but rather sampled rhythms, that is:  
I not only used the bjorklund algorithm for this one, but also copied other rhythmic phrases from the [mò.kóndí formula][arom] and applied them to synthesised drums.
 
### study five
[![study five](https://img.youtube.com/vi/KUJVbkp2gMQ/0.jpg)](https://www.youtube.com/watch?v=KUJVbkp2gMQ "study five")
> constructing, reconstructing  
resemblance, assemblance
>
> irreducible patterns;  
non-refactorable;
>
> the core and  
the interlocking regions


[tidal]: https://tidalcycles.org "A language for livecoding patterns"
[bjorklund]: https://tidalcycles.org/patterns.html#bjorklund "Euclidian Sequences"
[bobangi]: https://www.discogs.com/Aka-Centrafrique-Central-Africa-Anthologie-De-La-Musique-Des-Pygm%C3%A9es-Aka-Musical-Anthology-Of-The-A/release/2244894 "Centrafrique : Central Africa - Anthologie De La Musique Des Pygmées Aka - Musical Anthology Of The Aka Pygmies, Ocora, 2002"
[arom]: https://www.cambridge.org/core/books/african-polyphony-and-polyrhythm/831AF8A34F15E39DC8E8F42104B46EB3 "African Polyphony and Polyrhythm, Simha Arom, Centre National de la Recherche Scientifique (CNRS), Paris, 1991, p. 305"
