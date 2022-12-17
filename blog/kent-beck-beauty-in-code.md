# Kent Beck's "Beauty In Code"
#meta datetime 2018-05-31
#meta tags[] video-summaries testing

## Summary

[![Highlights of Kent Beck's 'Beauty In Code'](https://img.youtube.com/vi/tM1iOJsR7p4/0.jpg){: .w-full}](https://www.youtube.com/watch?feature=player_embedded&v=tM1iOJsR7p4)

We are first teased that the talk was intended to be about "the use of symmetry in coding", as I believe symmetry is a great way to help drive you towards cohesion and aligning the abstractions.

## Article

[![Highlights of Kent Beck's 'Beauty In Code'](https://img.youtube.com/vi/tM1iOJsR7p4/0.jpg){: .w-full}](https://www.youtube.com/watch?feature=player_embedded&v=tM1iOJsR7p4)

We are first teased that the talk was intended to be about "the use of symmetry in coding", as I believe symmetry is a great way to help drive you towards cohesion and aligning the abstractions.

For me, the highlights of the talk include

```
Making big changes can emerge from making little ones
```

Beck uncovered this idea when he was refactoring "running one test" in JUnit and the changes ultimately resulting in the Rules annotation.

```
Pass/Fail is important, but not the most important.
```

Beck talks about how feedback loops in our code are really important. Tests (here referring mostly to unit tests I believe) are one fo them but not necessarily the most important. Some feedback loops need to go through production.

```
The measure of a system is the effects it has on the world;
intended or unintended, and measurable or unmeasurable.
```

Kent dislikes the term requirements, as your system is in production and people are using it so clearly it was not a requirement to have that feature and this is where the term story was born (and then it was ruined when people started saying "user story").

```
Don't estimate, timebox as an exploration. But stupid
when you have __hundreds__ of people working on a stable product.
```

Engineering skills in software development demand for different approaches in different scenarios. Here Kent is discussing the notion of certification and how to measure the engineering-ness of an engineer.

And finally, a few concrete ideas about the act of cleaning up code.

* If it's hard, don't do it.
* It's a bunch of little deals that turn into a big deal.
* Only do obvious stuff.
* Put the intermediate stages into production, immediately.
* Only do this kind of "beauty" work when you are fresh.
* Practice. Try it, learn from it and move on (aka throw out code)