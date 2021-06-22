# CS302: Paradigms of Programming

## Lab 3: Programming with Local State

### March 31st, 2020

*Q1*: An accumulator is a procedure that is called repeatedly with a single
numeric argument and accumulates its arguments into a sum. Each time it is
called, it returns the currently accumulated sum. Write a procedure
`make-accumulator` that generates accumulators, each maintaining an independent
sum. The input to `make-accumulator` should specify the initial value of the
sum; for example:

> (define A (make-accumulator 5))
> (define B (make-accumulator 10))
> (A 10)
> 15
> (B 10)
> 20
> (A 10)
> 25

*Q2*: In software-testing applications, it is useful to be able to count the
number of times a given procedure is called during the course of a computation
(a kind of 'profiling'). Write a procedure `make-monitored` that takes as input
a procedure, `f`, that itself takes one input. The result returned by
`make-monitored` is a third procedure, say `mf`, that keeps track of the number
of times it has been called by maintaining an internal counter. If the input to
`mf` is the special symbol `how-many-calls?`, then `mf` returns the value of
the counter. If the input is the special symbol reset-count, then `mf` resets
the counter to zero. For any other input, `mf` returns the result of calling
`f` on that input and increments the counter. For instance, we could make a
monitored version of the `sqrt` procedure (from the first week of CS302):

> (define s (make-monitored sqrt))
> (s 100)
> 10
> (s 'how-many-calls?)
> 1

*Q3*: Modify the `make-account` procedure (from the March 30 lecture on Zoom)
so that it creates password-protected accounts. That is, `make-account` should
take a symbol as an additional argument, as in:

> (define acc (make-account 100 'secret-password))

The resulting account object should process a request only if it is accompanied
by the password with which the account was created, and should otherwise return
a complaint:

> ((acc 'secret-password 'withdraw) 40)
> 60
> ((acc 'secret-password 'withdraw) 50)
> "Incorrect password"

_This question is the same as the homework given in the class_

*Q4*: Modify the `make-account` procedure of the previous question by adding
another local state variable, such that if an account is accessed more than
five consecutive times with an incorrect password, it invokes the procedure
`call-the-cops` (use your creativity to implement this final procedure).

