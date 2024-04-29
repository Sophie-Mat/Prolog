empty_seq([]).
head([H|_],H).
tail([_|T],T).
seq_cons(Q, X, [X|Q]).

merge_sort(S, Q) :-
	empty_seq(S),
	empty_seq(Q).

merge_sort(S, Q) :-
	\+ empty_seq(S),
	head(S, E),
	tail(S, S1),
	merge_sort(S1, Q1),
	ins_elem(E,Q1, Q).
    
ins_elem(E,Q1, Q):- 
    empty_seq(Q1), 
    seq_cons(Q1,E, Q). 

ins_elem(E,Q1, Q):-
    head(Q1, V1), 
    E @=< V1, 
    seq_cons(Q1, E, Q). 

ins_elem(E,Q1, Q):-
    head(Q1,V),
    E @> V, 
    tail(Q1,Q1a),
    ins_elem(E,Q1a, Qa), 
    seq_cons(Qa,V, Q). 
	
/* Endiktikoi Stoxoi
merge_sort([2,4,1,3], Q).   ----> Q = [1,2,3,4]
merge_sort([2,4,1,3], [1,2,3,4]).  ----> yes
*/