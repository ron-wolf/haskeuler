# Project Euler in Haskell
Hello there, surfer of the interwebs! This is a log of my progress learning the programming language Haskell by solving the theoretical programming challenges found on [Project Euler](https://projecteuler.net). I’m still working on making my code more legible and efficient, the latter of which is not Haskell’s _greatest_ strength, though it’s astoundingly efficient for its level of abstraction (praise be to Simon Peyton Jones & Jan-Willem Maessen et al.).

Have fun reading! 😊

## Goals

### Major
- Get comfortable with standard library. Pretty much the first step when learning any language.
- Get used to [Hindley–Milner type system](https://en.wikipedia.org/wiki/Hindley–Milner_type_system), especially the [type class hierarchy](https://www.haskell.org/tutorial/classes.html) (which is nearly as contrived as the object hierarchy in OO languages, IMO, though I might change my mind once I get used to it).
- Try to avoid the accumulator pattern, at least where I don’t specifically need it for tail recursion. Having two versions of every function makes code much less readable, and I don’t really feel like using a `where` clause to inline a multi-line function definition.

### Minor
- Move utility functions to external modules. I’ve begun reusing certain functions throughout Project Euler, so this would reduce duplications and make code more readable (if spread out).
- Remove commented sections. I started work on some pretty cool functions before realizing I didn’t actually need them for the task at hand. However, I’m sure they’d be useful for _some_ use cases, and I couldn’t find anything similar on [Hoogle](https://www.haskell.org/hoogle/). These will remain available in the commit log.

## Progress
ID | Name | Efficient? | Simple?
---|------|------------|--------
1 | “Multiples of 3 and 5” | Runs in about .02 seconds, according to the Unix `time` utility. That’s pretty efficient as far as I’m concerned. | Just two lines of definitions, taking advantage of list comprehensions and `any :: (a -> Bool) -> [a] -> Bool`. I probably couldn’t get better than this without pulling out the only function definition in the entire program.
