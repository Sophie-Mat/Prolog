member1(H, [H|_Tail]).
member1(H, [_X|_Tail]):- member1(H,_Tail).

one_occurrence(L1, L2) :-
	one_occurrence_1(L1, L2, []). 

one_occurrence_1([], L2, L3) :-  
	L2 = L3.

one_occurrence_1([H1|T1], L2, L3) :- 
	\+member(H1, L3),
	append(L3, [H1], L4), 
	one_occurrence_1(T1, L2, L4).

one_occurrence_1([H1|T1], L2, L3) :- 
	member(H1, L3),  
	one_occurrence_1(T1, L2, L3).
									   

/* STOXOI
one_occurrence([a,b,a,a,b,c,d,c], [a,b,c,d]). ----> yes	
one_occurrence([a,b,a,a,b,c,d,c], L2).        ----> L = [a,b,c,d]
*/