# CS302: Paradigms of Programming

## Feb-Jun 2020

Programming Assignment 4: Escape Analysis using Logic
=====================================================

For programming languages that support dynamic memory allocation on the heap, an important analysis that decides the fate of several optimizations is "escape analysis".
In an object-oriented language like C++ or Java, at a statement `a = new A();`, a new object is allocated on the heap and its reference is stored into the variable `a`; another way to express this relationship is by saying "a points to o", where `o` represents the newly allocated object.
Escape analysis determines if an object allocated on the heap escapes the method (or function) in which it was allocated. An example optimization that could be enabled for non-escaping objects is that they can be allocated on the stack frame of a method (as they cannot be accessed by other methods), thus avoiding the need to be garbage collected from the heap later.

Consider a programming language that supports the following five kinds of statements:
- alloc(a, o) allocates an object `o` on the heap and stores its reference into the variable `a`
- copy(a, b) copies the object pointed-to by `b` to `a`
- load(a, b, f) loads the object pointed-to by `b.f` and copies it to `a`
- store(a, f, b) stores the object pointed-to by `b` into `a.f`
- invoke(m, l) passes the variables in the list `l` to the method `m`

In this language, an object escapes if it is reachable from any of the arguments passed to `m`.
For example, consider this program:


```
alloc(a, o1)
alloc(b, o2)
alloc(c, o3)
store(a, f, c)
load(d, a, f)
invoke(m1, [a])
```

Here, `a` points to `o1`, `b` points to `o2`, `c` points to `o3`, `a.f` points to `o3`, and `d` points to `o3`. As `a` is passed to `m1`, objects `o1` and `o3` escape, and `o2` does not escape.

In this assignment, we have to implement an escape analysis in Prolog.
In particular, we should be able to answer the following queries:
- escapes(o) should return `true` or `false`, indicating whether the object `o` escapes or not.
- escapesthrough(o, m) should return `true` or `false`, indicating whether the object `o` escapes through method `m`.
- allescapes(m, L) should return a list of `L` of all the objects that escape through the method `m`.

The input to the assignment will be programs represented as Prolog facts of the above form (alloc, copy, load, store and invoke).

**Plagiarism warning:**

> Note that this assignment is supposed to be done individually.
> Specifically, you should neither show code to each other nor put it up on web.
> We will be using sophisticated plagiarism checkers and any significant detection will lead to heavy penalization.
> You are free to approach the instructor for any queries/doubts.
> Discussions on the mailing list are encouraged.

## Submission

- You need to submit a single file named `rollnum-asgn4.pl` (where 'rollnum' is your roll number in small letters) consisting of your Prolog program.

## Evaluation

We will be using a testcase-based automated evaluation to check various standard as well as corner cases. You will get marks based on how many testcases does your submission pass.

