% 1 zadanie
% insert([1,2,1,5,3],1,[0,7,9],[]).

insert([], _, [], []) :- !.

insert([], X, Sub, Res) :- !.

insert([H|T], X, Sub, Res) :-
   not(Res = []),
   H = X,
   insert(T, X, Sub, [Res|[H|Sub]]).

insert([H|T], X, Sub, Res) :-
   Res = [],
   H = X,
   insert(T, X, Sub, [H|Sub]).

insert([H|T], X, Sub, Res) :-
   Res = [],
   member(X,T),
   insert(T, X, Sub, H).

insert([H|T], X, Sub, Res) :-
   member(X,T),
   insert(T, X, Sub, [Res|[H]]).

insert(List, X, Sub, Res) :-
   append(Res, List, Z),
   flatten(Z, Result),
   writeln(Result).

% 2 zadanie
% В текстовом файле, состоящем из нескольких строк, удалите все пробелы и
% занесите полученную последовательность символов в новый файл по 20
% элементов в строке.

split_line(Line, List) :-
   split_string(Line, '', '\t\n', List).
   
remove_spaces(Codes, NCodes) :-
   select(' ', Codes, NewCodes),
   !, remove_spaces(NewCodes, NCodes).

remove_spaces(Codes, NCodes) :-
   NCodes = Codes.

write_to_file(Str, Stream, Counter) :-
   not(Str = []),
   NewCounter is Counter + 1,
   NewCounter = 20,
    write(Stream, "\n"),
    write_to_file(Str, Stream, 0).

write_to_file([H|T], Stream, Counter) :-
   not(H = []),
   NewCounter is Counter + 1,
   not(NewCounter = 20),
    write(Stream, H),
    write_to_file(T, Stream, NewCounter).

write_to_file(List, Stream, Counter) :- !.

task2 :-
   open('C:\\Users\\hello\\OneDrive\\Рабочий стол\\in.txt', read, RStream),
   open('C:\\Users\\hello\\OneDrive\\Рабочий стол\\out.txt', write, WStream),
   read_string(RStream, 1000, Str),
   string_chars(Str, Codes),
   remove_spaces(Codes, NewCodes),
   string_chars(NewStr, NewCodes),
   split_string(NewStr, "\n", "", List),
   atomics_to_string(List, RStr),
   string_chars(RStr, Chars),
   Counter = 0,
   close(RStream),
   write_to_file(Chars, WStream, Counter),
   close(WStream).
   
% 3 задание
% 3.20. Создайте базу данных о металлах: наименование, удельная проводимость.
% Определите все металлы с максимальной проводимостью.
:- dynamic item/3.

task3 :-
   consult('C:\\Users\\hello\\OneDrive\\Рабочий стол\\.txt'),
   listing(item/3),
   menu.
   
menu :-
   repeat,
   writeln(' '),
   writeln('1. Просмотр содержимого БД'),
   writeln('2. Добавление записи'),
   writeln('3. Удаление записи'),
   writeln('4. Вывести максимальную проводимость'),
   writeln('5. Сохранение в файл'),
   writeln('6. Выход'),
   writeln(' '),
   writeln('Введите цифру от 1 до 6 для взаимодействия с меню'),
   read(N),
   N < 7,
   process(N), N = 6, !.
   
process(1) :- view_content.

process(2) :- add_content, !.

process(3) :- delete_content, !.

process(4) :- max_value, !.

process(5) :- save_file, !.

process(6) :- retractall(item), !.
   
view_content :-
   item(Name, Value),
   write('Название Металла:'), writeln(Name),
   write('Проводимость:'), writeln(Value).

add_content :-
   writeln('Добавление записи:'),
   repeat,
   write('Название Металла:'), read(Name),
   write('Проводимость:'), read(Value),
   assertz(item(Name, Value)),
   quest, !.
   
quest :-
   write('Ввести еще раз? y/n'),
   read(A),
   answer(A).

answer(_) :- fail.

answer(y) :- fail.

answer(n).
   
delete_content :-
   repeat,
   writeln('Удаление записи'),
   writeln('Введите название металла, который хотите удалить:'),
   read(Name),
   retract(item(Name, _)),
   writeln('--- Запись удалена ---').

max_el([H|T], Res) :-
   max_el(T, Res),
   Res > H, !.

max_el([H|_], H).

max_value :-
   findall(Value, item(Name, Value), N),
   max_el(N, Res),
   item(Name, Value),
   Value = Res,
   write('Название металла:'), writeln(Name),
   write('Проводимость:'), writeln(Value),
   fail.
   
save_file :-
   tell('C:\\Users\\hello\\OneDrive\\Рабочий стол\\.txt'),
   listing(item),
   told,
   writeln('Completed').