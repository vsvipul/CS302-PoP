# CS302: Paradigms of Programming

## Feb-Jun 2020

Programming Assignment 3: Experimenting with Languages
======================================================

As we have studied in the class, one of the powerful-yet-simple ways of experimenting with the various choices while designing programming languages is to tweak their interpreters.
In this assignment, we experiment with two important features: lexical vs dynamic scoping and eager vs lazy evaluation.

**Plagiarism warning:**

> Note that this assignment is supposed to be done individually.
> Specifically, you should neither show code to each other nor put it up on web.
> We will be using sophisticated plagiarism checkers and any significant detection will lead to heavy penalization.
> You are free to approach the TAs or the instructor for any queries/doubts.
> Discussions on the mailing list are encouraged.

## Part A (7 Marks): Dual Scoping

In this part, you need to extend the provided interpreter kernel to have both lexical and dynamic scoping.
Specifically, a parameter may be declared to be dynamically scoped as:

```scheme
(define (foo
  (lambda (a (dynamic b))
   ( ... ))))
```

Similarly, a parameter may be dynamically referenced as:
```scheme
(define (foo
  (lambda (a (dynamic b))
   (+ a (dynamic-ref b)))))
```

Referencing a variable that wasn't declared as dynamically scoped, and referencing a dynamically scoped variable without `dynamic-ref`, should both default to lexical scoping.

## Part B (7 Marks): Dual Evaluation Orders

In this part, you need to extend the provided interpreter kernel to have both eager and lazy evaluation.
Specifically, a parameter may be declared to be lazily evaluated as:

```scheme
(define (foo
  (lambda (a (lazy b))
   ( ... ))))
```

Now `b` should be evaluated lazily, upon need, and `a` should be evaluated eagerly.

## Part C (1 Mark): Hotch-Potch!

Explain how could you merge parts A and B (in text), along with expected complications, if any.

## Submission

- You need to submit a single zip file named `rollnum-asgn3.zip` (where 'rollnum' is your roll number in small letters) consisting of the following three files:

    1. `rollnum-parta.scm`
    2. `rollnum-partb.scm`
    3. `rollnum-partc.txt`

- Make sure the Scheme files contain `#lang sicp` at the top, and that they don't depend on any other modules.

## Evaluation

We will be using a testcase-based automated evaluation to check various standard as well as corner cases. You will get marks based on how many testcases does your submission pass.

