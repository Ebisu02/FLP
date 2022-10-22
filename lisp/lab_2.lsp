(write-line "Задача 10")
(write-line "Вывод: ")
(defun del-negs (lst)
(cond ((null lst) nil)
((and (numberp (car lst)) (> 0 (car lst))) (del-negs (cdr lst)))
(t (cons (car lst) (del-negs (cdr lst)))))
)

(write (del-negs'(-2 6 s -1 4 f 0)))

(terpri)
(write-line "Задача 20")
(write-line "Вывод: ")
(defun count-even (list)
(if (null list) 0
(+ (if (and (numberp (car list)) (evenp (car list))) 1 0) (count-even (cdr list)))))

(print(count-even '(1 2 5 7 9 b 12 6)))

(terpri)
(write-line "Задача 30")
(write-line "Вывод: ")

(defun F (L M)
(cond
((null L) M)
((null M) (F (cdr L) (list (car l))))
((F (cdr L) (List M (car l)) ))))

(print (F '(a s d f g) '()))