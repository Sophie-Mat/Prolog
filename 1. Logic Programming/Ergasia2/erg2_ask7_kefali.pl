insert(X, [], [X]).

insert(X, [Y|T1], [Y|T2]) :-
	X > Y,   
	insert(X, T1, T2).

insert(X, [Y|T], [X,Y|T]) :- 
	X =< Y.  

insertSort([], []).

insertSort([H|T], S) :- 
	insertSort(T, L2), 
	insert(H, L2, S). 

/* STOXOI
insertSort([1,-2,2,0,-1], S).	---> S = [-2,-1,0,1,2]
*/