#lang racket

"Hello, World!"

(require "helper.rkt")

hello ;; "Hello, World!"
num1 ;; 3
num2 ;; 4.2

(define x (sum-of-cube num1 2))
x ;; 35
