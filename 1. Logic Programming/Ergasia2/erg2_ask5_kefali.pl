evenNumbers([], []).

evenNumbers([H|T1], L2) :- 
	(abs(H) rem 2) =:= 0,  
	evenNumbers(T1, T2),
	L2 = [H|T2].           

evenNumbers([H|T1], L2) :- 
	(abs(H) rem 2) =:= 1, 
	evenNumbers(T1, L2).

/*STOXOI
evenNumbers([2,1,-3,6,8,9], L2).      ---> L2 = [2,6,8]
*/