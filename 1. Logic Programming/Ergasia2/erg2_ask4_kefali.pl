occurrences([], _X, 0). 

occurrences([H|T], _X, N) :- 
	H=_X,
	occurrences(T, _X, N1),
	N is N1+1.            

occurrences([H|T], _X, N) :- 
	\+(H=_X), 
	occurrences(T, _X, N). 


								  
/*STOXOI
occurrences([6,5,8,4,5,7], 5, 2).       ---> yes
occurrences([6,5,8,4,5,7], 5, N).		---> N = 2						  
*/
