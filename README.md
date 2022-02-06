# Wordle in POSIX shell

Implementation of wordle in POSIX shell (at least I think it is POSIX
compliant). Inspired by
[this bash implementation](https://gist.github.com/huytd/6a1a6a7b34a0d0abcac00b47e3d01513)
of the game.

## Dictionary

I got the one in the repo from
[here](https://github.com/charlesreid1/five-letter-words/blob/master/sgb-words.txt).

You can use any dictionary you want (dict file). You can include any words of
any size in this dictionary, but the game will only use words of length 5.

## Problem

This implementation has the common problem of the "repeated characters":

- The word is **times**;
- The guess is **abyss**;
- The last **s** would be green (correct guess in correct place);
- The first **s** would be yellow (correct guess in wrong place) which isn't
  accurate => there is only 1 **s** in the target word.
