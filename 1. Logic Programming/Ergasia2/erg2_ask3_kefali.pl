one_occurrence([], []).

one_occurrence([H|T], List2) :- 
	member(H, T),
	one_occurrence(T,List2).
	
one_occurrence([H|T], [H|T1]) :-
	\+member(H, T),
	one_occurrence(T,T1).
 
  
/* STOXOI
one_occurrence([a,b,a,a,b,c,d,c], L).               ----> L = [a,b,d,c]
one_occurrence([a,b,a,a,b,c,d,c], [a,b,d,c]).	    ----> yes			 
*/								
