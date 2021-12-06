#lang racket

(define (num_incr lst)
    (if (> (length lst) 1)
        (if (> (car (cdr lst))(car lst))
            (+ 1 (num_incr (cdr lst)))
            (+ 0 (num_incr (cdr lst))))
        0))

(define (sweep filename)
    (num_incr(map (lambda (line) (string->number line)) (file->lines filename))))
