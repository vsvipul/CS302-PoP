#lang sicp

(define (make-accumulator acc)
  (lambda (x)
    (set! acc (+ acc x))
    acc))

;(define A (make-accumulator 5))
;(define B (make-accumulator 10))
;(A 10)
;(B 10)
;(A 10)
  