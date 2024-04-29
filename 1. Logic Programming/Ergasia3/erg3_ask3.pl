mkd(X,Y,Z):-
	X=:=Y,!,Z is X.  
mkd(X,Y,Z):-
	X<Y,!,mkd(X,Y-X,Z).	
mkd(X,Y,Z):-
	mkd(X-Y,Y,Z). 
