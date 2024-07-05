#lang racket

; Combination of two values
(cons 3 4) ; '(3 . 4)
(cons #t "true") ; '(#t . "true")

; printed form changes
empty ; '(), empty list, and "empty" is not printed
(cons 1 empty) ; '(1), as this is a "list" with only one element, and "empty" is not printed
(cons #t (cons "true" empty)) ; '(#t "true")
(cons (cons 1 (cons 2 3)) (cons 4 (cons 5 empty))) ; '((1 2 . 3) 4 5)
                                                   ; a bunch of nested cons can be used to create a list

; get the first or second element of a pair
#|
car: Contents of the Address part of the Register, which means the first element of a pair
cdr: Contents of the Decrement part of the Register, which means the second element of a pair
|#
(car (cons 3 4)) ; 3
(cdr (cons 3 4)) ; 4
; or, if the value is a list, first and rest can be used
(first (cons #t (cons "true" empty))) ; #t
(rest (cons (cons 1 (cons 2 3)) (cons 4 (cons 5 empty)))) ; '(4 5)

; the quote notation - list
'(1 2 3) ; '(1 2 3)
(list 1 2 3) ; '(1 2 3)
; second through tenth elements
(define numbers '(1 2 3 4 5 6 7 8 9 10))
(second numbers) ; 2
(third numbers) ; 3
(tenth numbers) ; 10
; append, which combines lists into a single list
(append '(1 2 3) '(4 5 6)) ; '(1 2 3 4 5 6)
(append '(1 2 3) '(4 5 6) '(7 8 9)) ; '(1 2 3 4 5 6 7 8 9)
; list-ref, which gets the nth element of a list, indexed from 0
(list-ref '(1 2 3 4 5) 2) ; 3
; length, which gets the length of a list
(length '(1 2 3 4 5)) ; 5
; reverse, which reverses a list
(reverse '(1 2 3 4 5)) ; '(5 4 3 2 1)
; take, which gets the first n elements of a list
(take '(1 2 3 4 5) 3) ; '(1 2 3)
; drop, which drops (removes) the first n elements of a list
(drop '(1 2 3 4 5) 3) ; '(4 5)

; quote, quasiquote, and unquote
`(1 2 ,(length '(1 2 3)) 4 5)

; recursive code to process a list
(define (sum-list lst)
  (cond
    [(empty? lst) 0]
    [else (+ (first lst) (sum-list (rest lst)))]))
(sum-list '(1 2 3 4 5)) ; 15

(define (square-list lst)
  (cond
    [(empty? lst) empty]
    [else (cons (sqr (first lst)) (square-list (rest lst)))]))
(square-list '(1 2 3 4 5)) ; '(1 4 9 16 25)

; tail-recursive
(define (sum-list-helper lst acc)
  (cond
    [(empty? lst) acc]
    [else (sum-list-helper (rest lst) (+ acc (first lst)))]))
(define (sum-list-tail lst) (sum-list-helper lst 0))
(sum-list-tail '(1 2 3 4 5)) ; 15

; string
(substring "weather" 1 4) ; "eat"
(string-append "hello" ", " "world") ; "hello, world"

; string to list of characters
(string->list "hello") ; '(#\h #\e #\l #\l #\o)
; reverse a string
(list->string (reverse (string->list "hello"))) ; "olleh"

; tree
(struct bt (label left right) #:transparent) ; binary tree
(define tree (bt "root"
                 (bt "left child" "hello" empty)
                 (bt "right child" empty "world")))
(bt? tree) ; #t, is "tree" a bt structure?
(bt-label tree) ; "root"
(bt-left tree) ; (bt "left child" "hello" '())
(bt-label (bt-left tree)) ; "left child"
(bt-left (bt-left tree)) ; "hello"
