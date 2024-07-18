#lang racket

(provide hello num1 num2)
(provide sum-of-cube)

(define hello "Hello, World!")
(define num1 3)
(define num2 4.2)

(define (cube x) (* x x x))

(define (sum-of-cube x y)
  (+ (cube x)
     (cube y)))
