taxinomemene(L):-
	selectionSort(L, Output),
	same(L, Output).

selectionSort([], []).

selectionSort([H|InputTail], Output) :-
	selection( InputTail, H, MinEl, InputRest ),
	selectionSort(InputRest, OutputRest),
	append([MinEl], OutputRest, Output).
	
selection([], El, El, []).

selection([X|Xs], TestEl, El, [X|RestEl]) :-
	TestEl =< X, selection(Xs, TestEl, El, RestEl).
	
selection([X|Xs], TestEl, El, [TestEl|RestEl]) :- 
	selection(Xs, X, El, RestEl).
	
same([], []).

same([H1|T1], [H2|T2]):-
    H1 = H2,
    same(T1, T2).
	
/*STOXOI
taxinomemene([1,2,3,4,5]).        ---> yes
taxinomemene([6,4,8,2,5]).        ---> no
*/