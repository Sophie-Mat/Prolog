kb('Giannis',likes,maths).
kb('Giannis',likes,physics).
kb('Giannis',plays,voleyball).
kb('Giannis',plays,chess).
kb('Giannis',plays,backetball).
kb('Maria',likes,maths).
kb('Maria',likes,geography).
kb('Maria',plays,chess).
kb('Maria',plays,tennis).
kb('Eleni',likes,physics).
kb('Eleni',likes,informatics).
kb('Eleni',plays,voleyball).
kb('Eleni',plays,tennis).


collect_results:-                        
		write('Menu'),nl,
		write('Option 1:Read Name.'),nl,
		write('Option 2:Read Lesson.'),nl,
		write('Option 3:Read Game.'),nl,
		write('Option 4:Read Action.'),nl,
		write('Option 5:Exit.'),nl,
		read(Choice),
		choice(Choice),
		collect_results.



choice(1):-write('Give Name with ''''.'),nl,
		read(Name),ch1(Name), collect_results.
choice(2):-write('Give Lesson.'),nl,
		read(Subject),ch2(Subject), collect_results.
choice(3):-write('Give Game.'),nl,
		read(Game),ch3(Game), collect_results.
choice(4):-write('Give action: ( likes or plays).'),nl,
		read(Verb),ch4(Verb), collect_results.
choice(5):-write('exit'),false.



ch1(Name):-
		findall(Z,kb(Name,_,Z),L),
		write('This is a list with the subjects he/she likes and the games he/she plays.'),nl,
		write(L),nl.

ch2(Subject):-
		findall(X,kb(X,likes,Subject),L),
		write('The following students like '), write(Subject),nl,
		write(L),nl.

ch3(Game):-	
		findall(X,kb(X,plays,Game),L),
		write('The following students play '), write(Game),nl,
		write(L), nl.

ch4(Verb):-
		findall((X,Z),kb(X,Verb,Z),L),
		wr(Verb),nl,
		write(L), nl.

wr(likes):- write('This is a list with the names of the students and the subjects they like').
wr(plays):- write('This is a list with the names of the students and the games they play').