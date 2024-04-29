/*
Stoxoi:

!!!To programma ksekinaei me ?-menu.

Stoxos 1 gia allagi:  clause2(monopati1(X, X, Monopati, Monopati), true).    -->   clause2(monopati1(X, X, Monopati, Teliko_monopati), Monopati=Teliko_monopati).
Stoxos 2 gia diagrafi:  clause2(akme(c, a), true).
Stoxos 3 gia eisagogi:  clause2(akme(e, a), true).
Stoxoi 4 gia ton meta-dierminea:  monopati(a,f,Path).
								  monopati(a,Y,Path).
								  monopati(b,f,Path).
								  monopati(b,Y,Path).

*/


:- dynamic clause2/2.
:- op(900, fy, [not]).


/* Διερμηνέας (μεταπρόγραμμα) */
solve(true):-!.
solve((A,B)):-!, 
	solve(A),
	solve(B).
solve(Goal):-
	\+ predicate_property(Goal,built_in),
	clause2(Goal,Body),
	solve(Body).
solve(Goal):-
	predicate_property(Goal,built_in),
	call(Goal).
	

/* Πρόγραμμα-αντικείμενο */
clause2(monopati(X, Y, Monopati), monopati1(X, Y, [X], Monopati)).
clause2(monopati1(X, X, Monopati, Monopati), true).
clause2(monopati1(X, Z, Monopati, Teliko_monopati), (akme(X, Y), (not member(Y, Monopati)), append(Monopati, [Y], Neo_monopati), monopati1(Y, Z, Neo_monopati, Teliko_monopati))).
clause2(member(X,[H|_]), X=H).
clause2(member(X,[H|T]), (X \= H, member(X,T))).
clause2(append([],L2,L2),true).
clause2(append([H1|T1], L2, [H1|T3]), append(T1, L2, T3)).
clause2(akme(a, c), true).
clause2(akme(c, a), true).
clause2(akme(c, e), true).
clause2(akme(c, f), true).
clause2(akme(b, c), true).
clause2(akme(b, d), true).
clause2(akme(d, f), true).
clause2(akme(d, g), true).
	
menu:- 
	nl,
	write('Choose a number from the ones below:'),nl,
	nl,
	write('1.Update program-object.'),nl,
	write('2.Meta-interpreter call.'),nl,
	write('3.Exit.'),nl,
	read(Choice),
	choice(Choice),
	menu.
	
choice(1):-menu1.
choice(2):-menu2.
choice(3):-write('exit!'),false.


menu1 :-
	nl,
	write('Choose a letter from the ones below:'),nl,
	nl,
	write('a.Change a clause.'),nl,
	write('b.Insert a new clause.'),nl,
	write('c.Delete a clause.'),nl,
	write('d.Back to the main menu.'),nl,
	read(Choice1),
	choice1(Choice1),
	menu1.
	
choice1('a'):-
	write('Give the clause you want to change:'),
	read(Cl),
	retract(Cl),
	write('Type the new clause:'),
	read(Cl2),
	assert(Cl2),
	write('Clause changed successfully').
choice1('b'):-
	write('Give the clause you want to add:'),
	read(Cl),
	assert(Cl),
	write('Clause added successfully ').
choice1('c'):-
	write('Give the clause you want to delete:'),
	read(Cl),
	/*retract(clause2(Cl,true)),*/
	retract(Cl),
	write('Clause deleted successfully').
choice1('d'):-menu,false.


menu2 :-
	nl,
	write('Choose a letter from the ones below:'),nl,
	nl,
	write('a.Give a goal for the meta-interpreter to run.'),nl,
	write('b.Back to the main menu.'),nl,
	read(Choice2),
	choice2(Choice2),
	menu2.

choice2('a'):-
	write('Type the goal:'),nl,
	read(G),
	solve(G),nl,
	write(G),nl,
	false.
choice2('a').
choice2('b'):-menu,false.


	