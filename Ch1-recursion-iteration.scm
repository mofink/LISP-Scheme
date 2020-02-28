;;1.11
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
 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;1.12
;; Calculate elements of pascal's triangle by index (where the first element is indexed by 1, MATLAB style)

(define (pascal m n)
    (if (or (= n 1) (= n m))
        1
        (+ (pascal (- m 1) (- n 1)) (pascal (- m 1) n))
    )
)

(pascal 3 1)
(pascal 3 3)
(pascal 5 3)
 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;1.16

; Design a procedure that evolves an iterative exponentiation process in logarithmic time 
;Solution is of the form b^n, a is an invariant that holds ab^n constant

(define (expt-iter b n) 
    (expt-iter-aux b n 1)
)

(define (expt-iter-aux b n a)
  (cond 
    ((= n 1) a)
    ((odd n) (expt-iter-aux b (- n 1) (* a b)))
    (else (expt-iter-aux b (/ n 2) (* a (square b))))
  )
)

(define (square n) 
    (* n n)
)

(define (odd n) 
    (= (remainder n 2) 1)
)

(expt-iter 3 5)

;Design a procedure that implements multiplication in log time. Assume double and half are built into the language

(define (double x) (+ x x))
(define (half x) (/ x 2))

(define (fast-mult a b)
    (cond
        ((= b 1) a)
        ((odd b) (+ a (fast-mult a (- b 1))))
        (else (double (fast-mult a (half b))))
    )
)

(fast-mult 4 9)

;now do it iteratively in terms of adds, halves and doublesa


