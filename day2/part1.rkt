#lang racket

(define (calc-file filename)
    (calc-lines (file->lines filename)))

(define (calc-lines lines)
    (foldl add-pair `(0 0) (map calc-line lines)))

(define (add-pair p1 p2)
    (list (+ (car p1) (car p2)) (+ (cadr p1) (cadr p2))))

(define (calc-line line)
    (match (parse-dir line)
    ["forward"  (list (parse-val line) 0)]
    ["up"       (list 0 (* -1 (parse-val line)))]
    ["down"     (list 0 (parse-val line))]))


(define (parse-dir str)
    (car(string-split str " ")))

(define (parse-val str)
    (string->number(cadr(string-split str " "))))

