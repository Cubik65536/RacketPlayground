#lang racket

; Comparing numbers
(= 2 2) ; #t
(= 2 3) ; #f

; Comparing numbers when nested statements are used
(define x 24)
(define y 42)
(= x y) ; #f
(= (sqrt 4) 2) ; #t

; Comparing more than two numbers
(= 2 2 2) ; #t
(= 2 2 3) ; #f

; Comparing strings
; (= "hello" "hello")
#|
=: contract violation
  expected: number?
  given: "hello"
  context...:
   body of "/Users/cubik65536/Software Development/RacketPlayground/conditional.rkt"
|#
(string=? "hello" "hello") ; #t
(string=? "hello" "world") ; #f

; Comparing other relations
(< 2 3) ; #t
(> 2 3) ; #f
(<= 2 3) ; #t
(>= 2 3) ; #f
(string<=? "hawk" "handsaw") ; #f

(even? 42) ; #t，if the number is even
(exact? (sqrt 4)) ; #t, if the number can be represented exactly
(exact? (sqrt 5)) ; #f
(boolean? (= 3 5)) ; #t, if the value is a boolean
(number? (+ 3 5)) ; #t, if the value is a number
(string? "hello") ; #t, if the value is a string

; equal? to compare values of any type
(equal? 3 3) ; #t
(equal? "hello" "hello") ; #t
(equal? "hello" 3) ; #f

; if expression
(define z -2)
(if (> z (sqrt 5)) "greater" "not greater") ; "not greater"
(if (positive? z) z (- z)) ; 2
; Note that the test subexpression need not produce a Boolean value
(if null "yes" "no") ; "yes"

; cond expression
(define (sign-or-zero x)
    (cond
        [(> x 0) 1]
        [(< x 0) -1]
        [else    0]))
(sign-or-zero 3) ; 1
(sign-or-zero -3) ; -1
(sign-or-zero 0) ; 0

; and
(define (f x) (if (positive? x) x #f))
(and (> 3 4) (< 3 4)) ; #f, as the first subexpression is #f
(and (f 3) (f 4)) ; 4, as no subexpression is #f, and the last subexpression has a value of 4
(and (f 3) (f -4)) ; #f, as the second subexpression is #f

; or
(or (f -2) (f 3) (f 4)) ; 3, as the second subexpression has a value of 3
(or (f -2) (f -3) (f -4)) ; #f, as no subexpression has a value other than #f
