#lang racket
; Rock 1 Paper 2 Scissors 3
(define harry `() )
(define voldemort `() )

(define (play stratHarry stratVoldemort startHarry rounds)
  (define (stream-car s) (car s))
  (define (stream-cdr s) (force (cdr s)))
  (define-syntax cons-stream
    (syntax-rules ()
      ((cons-stream a b) (cons a (delay b)))))

  (define (strat1 stream)
    (cons-stream (stream-car stream) (strat1 (stream-cdr stream))))

  (define (strat2-help r p s)
    (cond ((and (> r p) (> r s)) 2)
          ((and (> s r) (> s p)) 1)
          ((and (> p r) (> p s)) 3)
          (else 1)))
    
  (define (strat2 stream r p s)
    (cond ((= (stream-car stream) 1) (cons-stream (strat2-help (+ r 1) p s) (strat2 (stream-cdr stream) (+ r 1) p s)))
          ((= (stream-car stream) 2) (cons-stream (strat2-help r (+ p 1) s) (strat2 (stream-cdr stream) r (+ p 1) s)))
          (else (cons-stream (strat2-help r p (+ s 1)) (strat2 (stream-cdr stream) r p (+ s 1))))))
  
  (define vStream
    (cond ((= stratVoldemort 1) (cons-stream 1 (strat1 hStream)))
          ((= stratVoldemort 2) (cons-stream 1 (strat2 hStream 0 0 0)))))
  
  (define hStream
    (cond ((= stratHarry 1) (cons-stream startHarry (strat1 vStream)))
          ((= stratHarry 2) (cons-stream startHarry (strat2 vStream 0 0 0)))))

  ;Set global variables
  (set! harry hStream)
  (set! voldemort vStream)

  (define (play-help hStream vStream h v n)
    (cond ((= n 0) (cond ((> h v) 1)
                         ((< h v) 2)
                         (else 0)))
          ((= (stream-car hStream) (stream-car vStream)) (play-help (stream-cdr hStream) (stream-cdr vStream) h v (- n 1)))
          ((> (stream-car hStream) (stream-car vStream))
           (cond ((and (= (stream-car vStream) 1) (= (stream-car hStream) 3)) (play-help (stream-cdr hStream) (stream-cdr vStream) h (+ v 1) (- n 1)))
                 (else (play-help (stream-cdr hStream) (stream-cdr vStream) (+ h 1) v (- n 1)))))
          (else (cond ((and (= (stream-car hStream) 1) (= (stream-car vStream) 3)) (play-help (stream-cdr hStream) (stream-cdr vStream) (+ h 1) v (- n 1)))
                      (else (play-help (stream-cdr hStream) (stream-cdr vStream) h (+ v 1) (- n 1)))))))
                   
  (play-help hStream vStream 0 0 rounds)
)