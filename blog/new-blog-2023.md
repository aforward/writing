# A new blog for 2023
#meta tags[] blog
#meta datetime 2022-12-23

## Summary

It has been 2 years since I re-worked my personal website
[anunknown.dev](https://anunknown.dev), and the previous
version was on cloud hardware and I have recently
been using [fly.io](https://fly.io) for small
project development, so I decided for a re-work.


## Article

It has been 2 years since I re-worked my personal website
[anunknown.dev](https://anunknown.dev), and the previous
version was on cloud hardware and I have recently
been using [fly.io](https://fly.io) for small
project development, so I decided for a re-work.

The site is built using the following

* [Elixir / Phoenix 1.7 App](https://www.phoenixframework.org)
* [Code generation using Earmark](https://github.com/pragdave/earmark)
* [Github repo with raw writing in markdown](https://github.com/aforward/writing)
* [Deployment via Fly.io](https://hexdocs.pm/phoenix/fly.html)
* [DNS via DigitalOcean](https://www.digitalocean.com)
* [Tailwind CSS](https://tailwindcss.com)
* [Tailwind UI ($$) Design](https://tailwindui.com)

The workflow is

1. Push writing to [writing repo](https://github.com/aforward/writing)
2. Locally regenerate site custom `Gen.run()` code generator
3. Push to blog repo
4. Deploy changes using `fly deploy`

The accomplishes my goal of having the writing (which everyone, including me,
needs to do more of) instead of focussing on formatting in HTML/CSS.

I have experience with site generators, but I have certain elixir code projects
to display (not ported yet) so having an Elixir app running (instead of just
say raw HTML/CSS) is just fine.

Cheers to more writing in 2023.
