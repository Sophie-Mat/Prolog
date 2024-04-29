f(Z, 0):-
	Z<0,!. 
f(Z, Z):-	
	Z =<1,!. 
f(_, 1).

p :- write('Dose timi gia to X \n'),
     read(X),
	 f(X,Y),
	 write('f(X) = '), write(Y).