# Project Euler in Haskell
Hello there, surfer of the interwebs! This is a log of my progress learning the programming language Haskell by solving the theoretical programming challenges found on [Project Euler](https://projecteuler.net). I’m still working on making my code more legible and efficient, the latter of which is not Haskell’s _greatest_ strength, though it’s astoundingly efficient for its level of abstraction (praise be to Simon Peyton Jones & Jan-Willem Maessen et al.).

Have fun reading! :blush:

## Goals

### Major
- Get comfortable with standard library. Pretty much the first step when learning any language is getting used to the nitty-gritty; learning the principles and idioms follows.
- Get used to [Hindley–Milner type system](https://en.wikipedia.org/wiki/Hindley–Milner_type_system), especially the [type class hierarchy](https://www.haskell.org/tutorial/classes.html) (which is nearly as contrived as the class hierarchy in OO languages, IMO, though I might change my mind once I get used to it).
- Try to avoid the accumulator pattern, at least where I don’t specifically need it for tail recursion. Having two versions of every function makes code much less readable, and I don’t really feel like using a `where` clause to inline a multi-line function definition.

### Minor
- Move utility functions to external modules. I’ve begun reusing certain functions (such as `divBy` and `prime`) throughout Project Euler, so this would reduce duplications and make code more readable (if spread out).
- Remove commented sections. I started work on some pretty cool functions before realizing I didn’t actually need them for the task at hand. However, I’m sure they’d be useful for _some_ use cases, and I couldn’t find anything similar on [Hoogle](https://www.haskell.org/hoogle/). These will remain available in the commit log.

### At some point
- Try out Vim/Emacs. I’ve been using Sublime Text with the SublimeHaskell and Hoogle plugins, but I could probably benefit from a tighter and more consistent set of keyboard shortcuts, a simpler API, and the comfort of knowing I’m supporting open source. Might try Evil Mode, Spacemacs, or some other bastard child of the two major CLI editors.

## Progress
1. [“Multiples of 3 and 5”](https://projecteuler.net/problem=1)
  - **Efficient?** Runs in about .02 seconds, according to the Unix `time` utility. That’s pretty efficient as far as I’m concerned. (And yes, I watched out for running the same program a few times in a row. Haskell is surprisingly well-optimized by the CPU cache, from what I can tell.)
  - **Simple?** Just two lines of definitions, taking advantage of list comprehensions and `any :: (a -> Bool) -> [a] -> Bool`. I probably couldn’t get better than this without pulling out the only function definition in the entire program.
  - **Learned?** Not all that much. Mainly got used to the type system—specifically, the nature of `mod :: Integral a => a -> a -> a`.

2. [“Even Fibonacci numbers”](https://projecteuler.net/problem=2)
  - **Efficient?** .03 seconds.
  - **Simple?** Pretty simple at this point, though I wish there were some way to collapse the two function definitions required to make use of an accumulator parameter into one more compact definition.
  - **Notes:** Started out as somewhat of a cheat, where I found out how many even Fibonacci numbers were less than four million and hard-coded that value into the program by feeding it to `take :: Int -> [a] -> [a]`. This was because `filter :: (a -> Bool) -> [a] -> [a]` has no facilities to avoid enumerating the entire list, even when the given function is `(< 4000000)`, since the type system can’t prove that the sequence is ever-increasing and therefore can never assume that the rest of the infinite list need not be checked.
  - **Learned?** I made `stop :: (a -> Bool) -> [a] -> [a]` in response; it works recursively to move items over one by one until an item matches the stop-test. Fairly proud of this solution, though I wonder whether I could’ve used a function that was already somewhere in the standard library. On another note, this was the only problem for which I consulted the Internet, but this taught me about `zipWith :: (a -> b -> c) -> [a] -> [b] -> [c]` as it can be used to define `fibs`. Not sure whether I could rewrite that definition off the top of my head; I should probably get used to defining lists in terms of initial items and how the following terms relate to them, as I don’t want to move past this without ensuring that I know what I did.
