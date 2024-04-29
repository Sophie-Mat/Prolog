teaches(ioannou,logic). 
teaches(ioannou,statistics). 
teaches(ioannou,algebra).
teaches(andreou,programming).
teaches(andreou,compilers).

print_teaches_courses(X):-
	teaches(X,Y),write(Y),nl,fail.   
	
	
/*STOXOI 
print_teaches_courses(ioannou).
print_teaches_courses(andreou).
*/