#lang racket

(require test-engine/racket-tests)

(check-expect (fact 5) 120)
(define (fact n)
  (cond
    [(= n 0) 1]
    [(= n 1) 1]
    [else (* n (fact (- n 1)))]))

(check-expect (+ x y) 32) ;; Check failure
(define x 16)
(define y 12)

(test)
