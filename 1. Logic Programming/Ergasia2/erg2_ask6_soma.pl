maxElement([H|T], Max) :- 
	maxElement_1([H|T], Max, H). 

maxElement_1([], Max, M) :- 
	Max = M.

maxElement_1([H|T], Max, Max2) :- 
	H >= Max2, 
	Max3 is H, 
	maxElement_1(T, Max, Max3).

maxElement_1([H|T], Max, Max2) :-
	H < Max2, 
	maxElement_1(T, Max, Max2).


/*STOXOI
maxElement([3,2,8,-5,4], M).    ---> M = 8
maxElement([3,2,8,-5,4], 8).    ---> yes
maxElement([3,2,8,-5,4], 4).    ---> no
*/