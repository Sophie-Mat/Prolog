pateras(kostas,anna).
pateras(kostas,aris).
antras(kostas,soula).
filo_aren(kostas).
filo_aren(aris).
filo_thiliko(soula).
filo_thiliko(anna).

ginaika(Y,X) :- antras(X,Y).                  /*  1  */
paidi(Y,X) :- pateras(X,Y).                   /*  2  */
mitera(Z,Y) :- pateras(X,Y), ginaika(Z,X).    /*  3  */
paidi(Y,X) :- mitera(X,Y).                    /*  4  */
adelfos(Y,Z) :- ((pateras(X,Y), pateras(X,Z));(mitera(X,Y), mitera(X,Z))), filo_aren(Y), \+(Y=Z).     /*  5  */
adelfi(Y,Z) :- ((pateras(X,Y), pateras(X,Z));(mitera(X,Y), mitera(X,Z))), filo_thiliko(Y), \+(Y=Z).   /*  6  



1. if antras(X,Y) 
	   then ginaika(Y,X);
2. if pateras(X,Y)
	   then paidi(Y,X);
3. if pateras(X,Y) and ginaika(Z,X)
	   then mitera(Z,Y);
4. if mitera(X,Y)
	   then paidi(Y,X);
5. if (pateras(X,Y) and pateras(X,Z)) or (mitera(X,Y) and mitera(X,Z))) and filo_aren(Y) and (Y!=Z)
	   then adelfos(Y,Z);
6. if (pateras(X,Y) and pateras(X,Z)) or (mitera(X,Y) and mitera(X,Z))) and filo_thiliko(Y) and (Y!=Z)
	   then adelfi(Y,Z);

	   
	   
STOXOI
pateras(X,Y).
ginaika(X,Y).
adelfos(X,Y).
adelfi(X,Y).
mitera(X,anna).
pateras(X,aris).
ginaika(X,kostas).
adelfos(X,anna).
adelfi(X, aris).

*/