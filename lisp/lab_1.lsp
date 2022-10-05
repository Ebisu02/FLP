;gnu clisp  2.49.60

; Задача 1

(write 
 (car (cdr (car (cdr (car (cdr (car'((1 (2 (3 *))))) ) ) ) ) ) )
)
(terpri)

; Задача 2
;LIST возвращает список, элементами которого являются аргументы функции
;в данном примере аргументами выступают '(+ 1 2) и '( )
;Функция QUOTE или ее сокращенная запись " ' " применяется для того, чтобы
;выражение в скобках воспринималось как список и не производилось вычисление значения
;после выполнения этой строки мы получим список из двух списков, второй пустой
; ( (+ 1 2) ( ) )

(write 
 (list '(+ 1 2) '() )
)
(terpri)

; Задача 3
;нужно получить (1 ((2)) (3)) из атомов 1, 2, 3, nil при помощи CONS и LIST
;При помощи CONS:

(write
 (cons 1 (cons (cons (cons 2 nil) nil) (cons (cons 3 nil) nil)))
)
(terpri)
;При помощи List:
(write
 (list 1 (list (list 2)) (list 3))
)
(terpri)

; Задача 4
(defun swap(list)
    (append
        (last(reverse list))
        (last(butlast(reverse list)))
        (last(butlast list))
        (cdddr(butlast(butlast list)))
        (last(butlast(butlast(reverse list))))
        (last list)
    )
)
(print(swap '(A B C D E F G H)))