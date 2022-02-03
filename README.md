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
