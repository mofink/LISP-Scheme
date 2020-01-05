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
