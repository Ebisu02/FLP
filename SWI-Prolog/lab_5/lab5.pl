% 1 задание
% Вывести нечетные числа в заданном диапазоне.

is_even(X) :-
   X mod 2 =:= 0.

get_uneven_numbers(X, Y) :-
  not(is_even(Y)),
  write(Y), tab(1), fail.

get_uneven_numbers(X, Y) :-
  Y \== X, Y1 is Y - 1, get_uneven_numbers(X, Y1).

print_uneven_numbers() :- read(X), read(Y), get_uneven_numbers(X, Y).

% 2 задание
% Вывод числа Фибоначчи по индексу
% Ввод с клавы до первого отрицательного числа

get_fibonacci(0, Y) :-
   Y is 1, !.

get_fibonacci(1, Y) :-
   Y is 1, !.

get_fibonacci(X, Y) :-
   X1 is X - 2,
   X2 is X - 1,
   get_fibonacci(X1, Y1),
   get_fibonacci(X2, Y2),
   Y is Y1 + Y2.
   
print_fibonacci() :-
   repeat,
   read(X),
   (X < 0, !; get_fibonacci(X, Y), write(Y), nl, fail).

% Задание 3
% Разбирать список на 2 части по X & Y
% 1 - < X; 2 - > X, but < Y; 3 > Y
% Список и числа - с клавы.

print_splite_ex() :-
   read(List), read(X), read(Y), normallize(X, Y, Min, Max),
   do_split(List, Min, Max, List1, List2, List3),
   write(List1), writeln(List2), writeln(List3).
   
normallize(X, Y, Min, Max) :- X > Y, !, Max = X, Min = Y; Max = Y, Min = X.

do_split([], A, B, [], [], []).

do_split([Head|Tail], A, B, [Head|List1], List2, List3) :-
   Head < A, !, do_split(Tail, A, B, List1, List2, List3).

do_split([Head|Tail], A, B, List1, [Head|List2], List3) :-
   Head =< B, !, do_split(Tail, A, B, List1, List2, List3).

do_split([Head|Tail], A, B, List1, List2, [Head|List3]) :-
   !, do_split(Tail, A, B, List1, List2, List3).

% Задание 4
% Предикат, который выводит наиболее встречающиеся элементы в списке
% Т.е. выводит элементы списка которые встречаются максимальное кол-во раз
% [1,2,3] -> [1,2,3].
% [1,1,2,2,3] -> [1,2].
% [1,1,2,3] -> [1].

do4() :-
   read(List), msort(List, SortedList), counter(SortedList, _, Result), write(Result).

counter([], 0, []).

counter([H|B], K, [H]) :-
   foo([H|B], H, K, List), counter(List, MX, _), K > MX, !.
   
counter([H|B], MX, List1) :-
   foo([H|B], H, K, List), counter(List, MX, List1), K < MX, !.
   
counter([H|B], MX, [H|List1]) :-
   foo([H|B], H, K, List), counter(List, MX, List1), K =:= MX, !.

foo([], _, 0, []) :-
   !.

foo([H|B], X, 0, [H|B]) :-
   H =\= X, !.

foo([H|B], X, K, B1) :-
   H =:= X,  foo(B, X, K1, B1), K is K1 + 1.
