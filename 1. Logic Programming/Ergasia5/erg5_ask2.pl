pop([H], []).
pop([H|T], [H|Rest]) :- pop(T, Rest).

top([H], H).
top([H|T], Last) :- top(T, Last).
top_first([H|T], H).

push([], Elem, [Elem]).
push([H|T], Elem, [H|Rest]) :- push(T, Elem, Rest).

empty_stack([]).

parenthesis_LR_same(S) :- empty_stack(S).
parenthesis_LR_same(S) :- name(S, NS), check(NS, CS).

check(NS, CS) :- empty_stack(CS), 
                top(NS, H), 
                pop(NS, PoppedNS), 
                push(CS, H, PushedCS), 
                check(PoppedNS, PushedCS).
				
check(NS, CS) :- \+ empty_stack(CS), 
                check2(NS, CS).
				
check2(NS, CS) :- empty_stack(NS), 
                empty_stack(CS).

check2(NS, CS) :- \+ empty_stack(NS), 
                top(NS, H), 
                pop(NS, PoppedNS), 
                top_first(CS, H2), 
                H =:= H2, 
                push(CS, H, PushedCS), 
                check2(PoppedNS, PushedCS).

check2(NS, CS) :- \+ empty_stack(NS), 
                top(NS, H), 
                pop(NS, PoppedNS), 
                top_first(CS, H2), 
                H =\= H2, pop(CS, PoppedCS), 
                check2(PoppedNS, PoppedCS).

/*  ----STOXOI----
parenthesis_LR_same(')))(()((').
parenthesis_LR_same('(((())').
*/