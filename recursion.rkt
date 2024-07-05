#lang racket

(define (fact n)
  (cond
    [(= n 0) 1]
    [(= n 1) 1]
    [else (* n (fact (- n 1)))]))

(fact 5) ; 120
(fact 0) ; 1

(define (fib n)
  (cond
    [(= n 0) 0]
    [(= n 1) 1]
    [else 
        (+ (fib (- n 1))
           (fib (- n 2)))
    ]))

(fib 5) ; 5
(fib 6) ; 8

(define (fact-helper n acc)
  (cond
    [(= n 0) acc]
    [else (fact-helper (- n 1) (* n acc))]))
(define (fact2 n) (fact-helper n 1))

(fact2 10) ; 3628800
(fact2 0) ; 1
