evenNumbers(L1, L2) :-
	evenNumbers_1(L1, L2, []). 

evenNumbers_1([], L2, L3) :-
	L2 = L3.

evenNumbers_1([H|T1], L2, L3) :- 
	(abs(H) rem 2) =:= 0,    
	append(L3, [H], L4),
	evenNumbers_1(T1, L2, L4).

evenNumbers_1([H|T1], L2, L3) :- 
	(abs(H) rem 2) =:= 1, 
	evenNumbers_1(T1, L2, L3).
								   
							
/*STOXOI
evenNumbers([2,1,-3,6,8,9], L2).      ---> L2 = [2,6,8]
*/
