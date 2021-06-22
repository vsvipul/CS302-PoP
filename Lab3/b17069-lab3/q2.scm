#lang sicp

(define (make-monitored f)
  (define times 0)
  (define (mf x)
    (if (eq? x 'how-many-calls?) times
          (begin (set! times (+ times 1))
                 (f x))))
  mf)

;(define s (make-monitored sqrt))
;(s 100)
;(s 10)
;(s 5)
;(define p (make-monitored sqrt))
;(p 100)
;(p 10)
;(p 'how-many-calls?)

    