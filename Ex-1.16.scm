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

