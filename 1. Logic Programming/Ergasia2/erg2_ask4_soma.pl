occurrences(L, _X, N) :- 
	occurrences_1(L, _X, N, 0). 
												   
occurrences_1([], _X, N, N).

occurrences_1([H|T], _X, N, N2) :- 
	H=_X,        
	N3 is N2+1,
	occurrences_1(T, _X, N, N3).

occurrences_1([H|T], _X, N, N2) :- 
	\+(H=_X), 
	occurrences_1(T, _X, N, N2).
								  
/*STOXOI
occurrences([6,5,8,4,5,7], 5, 2).      ---> yes
occurrences([6,5,8,4,5,7], 5, N).	   ---> N = 2	
*/