member1(X, L) :- append(_L1, [X|_T], L). /*Το έγραψα ως member1 για να αποφύγω το permission error*/

adjacent(X, Y, L) :- append(_L1, [X, Y|_T], L) ; append(_L1, [Y, X|_T], L).

last(X, L) :- append(_L1, [X], L).


/*STOXOI
member1(4, [1,2,4,7]).    ---> yes
member1(4, [1,2,3,5]).    ---> no

adjacent(4, 5, [3,4,5,8]).    ---> yes
adjacent(4, 5, [3,4,6,5]).    ---> no

last(5, [2,5,7,5]).      ---> yes
last(3, [1,3,5,6]).      ---> no
*/