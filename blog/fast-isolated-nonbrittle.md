# I don't like the name *unit tests*.
#meta datetime 2020-07-10
#meta tags[] testing

## Summary

I think it leads to arguing along the lines of _hey this isn't a unit test_.

I prefer to focus on three qualities of good automated tests

* Fast (or non-slow)
* Sturdy (or non-brittle)
* Isolated (or non-coupled)

## Article

I think it leads to arguing along the lines of _hey this isn't a unit test_.

Some of tests are very _un-unit_ tests.  I will write automated tests that ...

* Talk to a database
* Call other modules
* Might even call an external services

Of course, I will also write more _unit-like_ automation including ...

* Testing against an interface
* Using mock objects
* Writing test doubles

Finally, I also write tests that are very _production_ oriented to verify the liveness of a running system including **Canary** and **Smoke** tests.

Dave Thomas said recently ([in a podcast with Elixir Wizards](https://podcasts.apple.com/ca/podcast/elixir-wizards/id1454287242?i=1000478551902)) that

```
If it has a name, it's probably wrong.
- Dave Thomas
```

Names are important, very important, but somethings they can be distracting.

### Qualities of Good Automated Tests

I prefer to focus on three qualities of good automated tests

* Fast (or non-slow)
* Sturdy (or non-brittle)
* Isolated (or non-coupled)

My insights into Testing are largely based on Kent Beck (see [Qualities of a Good Tests](https://www.infoq.com/news/2008/10/qualities_good_test/) and [Programmer Test Principles](https://medium.com/@kentbeck_7670/programmer-test-principles-d01c064d7934))

#### Faster is Better Than Slower

Fast is relative.

It's hard to argue (unless you are trolling) against having fast tests.  Speed it definitely relative, but the general thinking is that the faster your tests run, the faster you can get feedback from those tests.  Slow tests will be run less often, by fewer people and you will not provide the timely feedback that you need.

![Fast is better than slow](https://user-images.githubusercontent.com/48086/86265716-221a7500-bb92-11ea-9d93-811fe62e11a8.jpeg)

As your code base grows, even with the best intentions some of your test might *need to be slow* (as the test is more important than its speed) or you simply might have too many (high value and very fast) tests that now running the entire testsuite is way too (relatively) slow.

![Eventually you might have to start splitting up your tests](https://user-images.githubusercontent.com/48086/86266397-28f5b780-bb93-11ea-8199-8c34c33cb4f4.jpeg)

At this point, you offload those slow tests and no longer run them all the time.  Just never let it excuse you from always trying to make your tests run fast.

#### Sturdy is Better Than Brittle

Some examples of brittleness in tests might include

* A sleep to *wait* on something to finish
* A hard-coded year (or some other fixed date or reliance on timezones)
* Timezone brittleness where depending on when you run your code affects the perception of today versus tomorrow
* Relying on data to exist somewhere that is not explicitly managed by your tests
* Relying on the side effects of other tests that must be run before or after your test
* Trying to test randomness in a quasi predictable way

![image](https://user-images.githubusercontent.com/48086/86268320-01541e80-bb96-11ea-8595-9b349605377a.jpeg)

A sturdy test is one that rarely (ideally never) fails with a false negative (i.e. the test failed but the code is just fine).  With experience you will get better at knowing *before hand* what may (or may not) make a test brittle, but even if you don't, your brittle tests will eventually tell you how brittle they are.

#### Isolated is Better Than Coupled

As you make changes to your code base tests will eventually start to fail, and that's a good thing.  The test suite can act as a great tool to show you possible regressions based on changes.  But, if can also highlight spots where your test suite has unnecessarily coupling to assumed behaviour.

Imagine that you are writing in invoicing app.  You have tests that calculate the sales tax based on the shipping address.  The accounting team lets you know that digital products calculate tax a bit differently.  You write a new test to demonstrate the desired behaviour and then you run a your test suite a bunch of (what you thought were unrelated) tests start failing.  Your tests about payment transactions, your tests about PDF generation, and your tests about overdue notices all start failing.

![image](https://user-images.githubusercontent.com/48086/86268810-c0103e80-bb96-11ea-870f-558951e198be.jpeg)

Turns out a lot of your tests were duplicating knowledge of the tax calculation and when things changed that assumptions were no longer true and now those tests starting blowing up.  You cannot fully isolate yourself from this scenario, and different testing frameworks give you different tools to deal with coupled tests, but it is something to be aware of something to work to minimize.  I am not advocating any particular solution to dealing with coupled tests and there is no one solution for every scenario.

### Go Forth and Automate

Almost always having tests is better than not having tests.

Try not to argue too much about whether a test is a unit test, an integration, a system test and instead focus on if the test is fast, sturdy and isolated.  Defer complexity in your build pipeline until it's a must, as it's always easier to change a simple process than a complex one.

### Resources

* [Kent Beck Qualities of Good Tests (2008)](https://www.infoq.com/news/2008/10/qualities_good_test/)
* [Programmer Test Principles by Kent Beck (2019)](https://medium.com/@kentbeck_7670/programmer-test-principles-d01c064d7934)
* [Dave Thomas on Learning How Things Work (Elixir Wizards June 18, 2020)](https://podcasts.apple.com/ca/podcast/elixir-wizards/id1454287242?i=1000478551902)