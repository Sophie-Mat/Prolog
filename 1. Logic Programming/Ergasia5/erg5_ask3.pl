dequeue(X, [X|T], T).

enqueue(X, [], [X]).
enqueue(X, [H1|T1], [H1|T2]) :- enqueue(X, T1, T2).

queue_element_cardinality(Q1, Q2):-new_queue(Q1,_,Q2).

new_queue([],Q2,Q2).
new_queue(Q1,Q2,Q3):-
	dequeue(H,Q1,T),
	add_elem(H,Q2,Q2new),
	new_queue(T,Q2new,Q3).

add_elem((_,0),Q,Q).
add_elem((Elem,C),Q,Qnew):-
	C1 is C-1,
	enqueue(Elem,Q,Q1new),
	add_elem((Elem,C1),Q1new,Qnew).
	
	
/*  ----STOXOS----
queue_element_cardinality([(5,4),(-8,3),(0,2)],Q2).
*/