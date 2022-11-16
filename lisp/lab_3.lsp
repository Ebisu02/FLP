; Задание #3
(defun is-subset (a b)
  (cond ((null a) t)
        ((member (car a) b) (is-subset (cdr a) b))
        (t nil)))

; Должно быть 'T'
(print (is-subset '(x y) '(a c v x z y)))
; Должно быть 'NIL'
(print (is-subset '(x y) '(a c v z y)))


; Задание #2
(defun intersect (s1 s2)
(remove-if-not (lambda (x) (member x s2)) s1))

; Должно быть 3 4 5
(print(intersect '(1 2 3 4 5) '(3 4 5 6)))


; Задание #3
(defun chng* (func lst) 
    (cond ((null lst) nil)
        ((funcall func (car lst)) 
         (cons '* (chng* func (cdr lst))))
        (t (cons (car lst) (chng* func (cdr lst))))))

; Должно быть * * * * * * a b
(print (chng* #'numberp '(1 2 3 4 5 6 a b)))
; Должно быть * 2 3 * * * 1
(print (chng* #'(lambda (x) (< x 0)) '(-1 2 3 -6 -7 -7 1)))

