#lang sicp

; 1A
(define (sublist x y)
  (define (sublhelp x y)
    (cond
      ((null? x) #t)
      ((null? y) #f)
      ((equal? (car x) (car y)) (sublhelp (cdr x) (cdr y)))
      (else #f)
    ))
  (cond
      ((null? x) #t)
      ((null? y) #f)
      ((equal? (car x) (car y)) (if (sublhelp (cdr x) (cdr y)) #t (sublist x (cdr y))))
      (else (sublist x (cdr y)))
   )
)

; 1B
(define (lgrep x y)
  (cond
    ((null? x) y)
    ((null? y) '())
    ((sublist x (car y)) (cons (car y) (lgrep x (cdr y))))
    (else (lgrep x (cdr y)))
  )
)

; 1C

(define (subset x y)
  (cond
     ((null? x) #t)
     ((null? y) #f)
     ((equal? (car x) (car y)) (subset (cdr x) (cdr y)))
     (else (subset x (cdr y)))
  )
)

(define (power-set set)
  (if (null? set) '(())
    (let ((power-set-of-rest (power-set (cdr set))))
    (append power-set-of-rest
    (map (lambda (subset) (cons (car set) subset)) power-set-of-rest)))
  )
)

(define (lcshelp pset y)
  (cond ((null? pset) '())
        ((subset (car pset) y) (cons (car pset) (lcshelp (cdr pset) y)))
        (else (lcshelp (cdr pset) y))
  )
)

(define (find-len len cmnset)
    (cond ((null? cmnset) len)
          ((> (length (car cmnset)) len) (find-len (length (car cmnset)) (cdr cmnset)))
          (else (find-len len (cdr cmnset)))
    )
)

(define (find-max cmnset len)
    (cond ((null? cmnset) '())
          ((= len (length (car cmnset))) (cons (car cmnset) (find-max (cdr cmnset) len)))
          (else (find-max (cdr cmnset) len))
    )
)

(define (lcs x y)
  (define cmnset (lcshelp (power-set x) y))
  (find-max cmnset (find-len 1 cmnset))
)


;(sublist '(3 4 5) '(1 2 3 4 5 6 7))
;(sublist '(1 3 5) '(1 2 3 4 5 6 7))
;(sublist '(6) '(1 2 3 4 5 6 7))
;(lgrep '(3 4 5) '((1 2 3 4 5 6)
;                  (3 4 3 4 5)
;                  (1 2 3 4)
;                  (10 9 3 4 5 7)
;                  (8 9 10)))
;(lcs '(a b c b d a b) '(b d c a b a))