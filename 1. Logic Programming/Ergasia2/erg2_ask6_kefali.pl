maxElement([H], Max) :- 
	Max = H. 

maxElement([H|T], Max) :- 
	maxElement(T, Max2), 
    H >= Max2,          
    Max = H.            

maxElement([H|T], Max) :- 
	maxElement(T, Max2),
    H < Max2,          
    Max = Max2.

/*STOXOI
maxElement([3,2,8,-5,4], M).    ---> M = 8
maxElement([3,2,8,-5,4], 8).    ---> yes
maxElement([3,2,8,-5,4], 4).    ---> no
*/