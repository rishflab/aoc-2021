#lang racket

(define (num_incr3 lst)
    (if (>= (length lst) 4)
        (if (> (sum3 (cdr lst)) (sum3 lst))
            (+ 1 (num_incr3 (cdr lst)))
            (+ 0 (num_incr3 (cdr lst))))
        0))

(define (sum3 lst)
    (+ (list-ref lst 0) (list-ref lst 1) (list-ref lst 2)))

(define (sweep3 filename)
    (num_incr3(map (lambda (line) (string->number line)) (file->lines filename))))

(define (data)
    `(199 200 208 210 200 207 240 269 260 263))