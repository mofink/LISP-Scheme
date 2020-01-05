;; Let a function f(n) = n for n < 3, else f(n) = f(n-1) + 2f(n-2) + 3f(n-3)
;;Write procedures that compute f by means of recursive and iterative processes

(define (f-recur n) 
    (if (< n 3)
        n
        (+ (f-recur (- n 1)) (* 2 (f-recur (- n 2))) (* 3 (f-recur (- n 3)))) 
    )
)

(define (f-iter n)
    (f-iter-aux 2 1 0 n)
)

(define (f-iter-aux a b c count)
    (if (= count 0)
    c
    (f-iter-aux (+ a (* 2 b) (* 3 c)) a b (- count 1)) 
    )
)

(f-recur 8)
(f-iter 8)
 
