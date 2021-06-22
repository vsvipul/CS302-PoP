# CS302: Paradigms of Programming

## Feb-Jun 2020

Programming Assignment 1: Functional Programming with Lists
===========================================================

A list is the only data structure in all Lisp-like languages, including our SICP-flavoured Scheme. Whether it be a complicated data structure, or a sophisticated compiler, everything can be implemented using lists. Having programmed and practiced with numbers and lambdas in the labs, this take-home assignment is aimed at making you acquainted with using lists for implementing simple Unix utilities that involve processing strings. You will basically be implementing two Unix utilities: `lgrep` and a crude form of `diff`.

**Plagiarism warning:**
> Note that this assignment is supposed to be done individually; groups and discussions are only for the labs.
> Specifically, you should neither show code to each other nor put it up on web.
> We will be using sophisticated plagiarism checkers and any significant detection will lead to heavy penalization.
> You are free to approach the TAs or the instructor for any queries/doubts.
> Discussions on the mailing list are encouraged and not dis-allowed.

### Problem 1
You are to write a simple pattern-matching program in Scheme. Your initial solution should consist of a `sublist` function that takes two lists as arguments. It should return true (#t) if the first list appears as a contiguous sublist somewhere within the second list, and false (#f) otherwise:
```
(sublist '(c d e) '(a b c d e f g))
    ==> #t
(sublist '(a c e) '(a b c d e f g))
    ==> #f
(sublist '(f) '(a b c d e f g))
    ==> #t
```

Once you have this working, use it to build an `lgrep` function that returns the “lines” within a list that contain a given sublist:
```
(lgrep '(c d e) '((a b c d e f g)
                  (c d c d e)
                  (a b c d)
                  (h i c d e k)
                  (x y z)))
    ==> ((a b c d e f g) (c d c d e) (h i c d e k))
```

You may assume that the argument lists will not contain further nested lists.

### Problem 2
You are to write a Scheme function `lcs` to compute the longest common sublists of two given lists. For example:
```
(lcs '(a b c b d a b) '(b d c a b a))
    ==> ((b c b a) (b d a b) (b c a b))
```

The order in which the subsequences are printed is not important; we will take care of the same in our scripts.

This is essentially the problem solved by the Unix program `diff`, except that `diff` uses whole lines instead of symbols as list elements, and instead of printing a longest common sublist, it prints the lines that are not in that sublist -- the elements that must be inserted, deleted, or changed to transform the first list into the second.

NB: Don't feel compelled to achieve the lowest possible time bound (though that's always nice). Diff uses a couple of data structures, including a hash table, that you may have difficulty building in Scheme, so for now we won't worry about efficiency.

### Submission

You need to submit a single file named `rollnum-asgn1.scm`, where `roll-num` should be your roll number in small letters. This file must have the functions `sublist`, `lgrep` and `lcs` defined. Any other utility functions that you use should be modularized and invisible to the outside world.

### Evaluation

We will be using a testcase-based autmated evaluation to check various standard as well as corner cases. The assignment carries a total of 8 marks, and the testcases will be distributed equally over the same. You will get marks based on how many testcases does your submission pass.

*Note:* You are required to use only the functional features of Scheme; functions with an exclamation point in their names (e.g. set!) are not allowed.

