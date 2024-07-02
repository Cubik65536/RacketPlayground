#lang racket

(define x 3) ;; A "variable", or, a function without any parameter that will
x ;; 3          just return the value of the expression defined.

(define y (+ x 1)) ;; Another function usage can be used as definition.
y ;; 4

(define (square x) (* x x)) ;; A function with parameter named "x", and an expression as the definition.
(square x) ;; 9

(define (sum-of-square x y) ;; A function with two parameters.
  (+ (square x)             ;; It is always possible to nest expressions and function usages.
     (square y)))
(sum-of-square x y) ;; 25

