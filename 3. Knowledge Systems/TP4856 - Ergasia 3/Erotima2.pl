/*

Sofia Matthaiaki - TP4856

Gia to programma:
Kanoume consult to arxeio kai anoigoume ston browser ton sindesmo: "http://127.0.0.1:7000/"

STOXOI:
1. ((()))((()()((())(        ---> not the same
2. (()))(                    ---> the same
3. (()))))((())(())((        ---> the same
4. ((((())()))(((()(((((     ---> not the same

*/

:- use_module(library(http/thread_httpd)).  %gia orismo kai rithmisi enos vasikou http server
:- use_module(library(http/http_dispatch)). %gia tin apostoli aitimatos sto diakomisti
:- use_module(library(http/http_error)).    %gia xeirismo sfalmatwn
:- use_module(library(http/html_write)).    %gia tin dimiourgia html kai alla
:- use_module(library(http/http_client)).   %gia na kanoume http requests
:- http_handler('/', ask2, []).             %dilosi tou handler tis arxikis selidas (ask2)

server(Port):- http_server(http_dispatch, [port(Port)]). %dimiourgia tou server

:- server(7000). %dimiourgei mia forma stin thira 7000

ask2(_Request) :- 
reply_html_page(    %dimiourgia html selidas
title('Erotima 2'), %titlos selidas
/*Parakato exoume tin forma tou html pou tha emfanistei sto browser.
Sto keno pedio tou input diavazei mia grammi eisodou me parentheseis.*/
[form( [ action='/result', method='POST' ],
[ p( [ ], [label([for=inp],'Type some parentheses here : '),input([name=inp, type=textarea]) ] ),
p( [ ],input([name=submit, type=submit, value='Submit'], [ ] )) ] ) ] ).

:- http_handler('/result', ask2_result, []).  %dilosi tou handler tis defterevousas selidas (ask2_result)

ask2_result(Request):-
reply_html_page(                    %dimiourgia html selidas (to Body to afinoume keno)
title('Result - Erotima 2'),[]),    %titlos selidas
member(method(post), Request), !,   %elenxos an to method tou request einai post kai an exei pragmatopiithei
http_read_data(Request, Data, []),  %diavasma dedomenwn apo to request kai kataxorisi tous sto Data
format('<p><h1>', []),              %orismos tag pou tha xrisimopoiithoun gia tin morfopiisi ton apotelesmaton
parenthesis_LR_same(Data.inp).

/*Parakato exoume tis ilopoiiseis ton prakseon stoivas*/
pop([_], []).
pop([H|T], [H|Rest]) :- pop(T, Rest).  %afairesi stoixeiou apo stoiva

top([H], H).
top([_|T], Last) :- top(T, Last).  %korifi stoivas

push([], Elem, [Elem]).
push([H|T], Elem, [H|Rest]) :- push(T, Elem, Rest). %kataxorisi stoixeiou stin stoiva

empty_stack([]). %adeia stoiva

/*Metatrepoume to sinolo me tis parenthesis pou exoume se mia lista pou periexei ton kodiko xaraktira kathe parenthesis, diladi:
( --> 40
) --> 41
kai stin sinexeia kaloume tin check me tin lista pou exoume kai mia keni lista (tha einai i stoiva mas) pou tha periexei tis parenthesis 
pou tha exoume (an exoume) sto telos.
Analoga me to apotelesma, stin epomeni selida tha emfanistei katallilo minima ston xristi.*/
parenthesis_LR_same(S) :- name(S, NS), check(NS, _), write('The number of right and left parentheses is the same.'). 
parenthesis_LR_same(S) :- name(S, NS), \+check(NS, _), write('The number of right and left parentheses is NOT the same.'). 


/*Sto parakato katigorima, elegxoume an einai adeia i arxiki mas lista kai i stoiva. An isxiei afto tote o aritmos ton parentheseon pou dothikan einai idios,
ara kai to arxiko katigorima parenthesis_LR_same einai alithes*/
check(NS, Stack) :- empty_stack(NS), 
                empty_stack(Stack).

/*To parakato katigorima ekxorei to proto stoixeio stin stoiva kathe fora pou afti einai adeia.
To stoixeio pou prostithetai stin stoiva afaireitai apo tin korifi tis listas.*/
check(NS, Stack):- \+ empty_stack(NS),       %elegxoume oti i stoiva den einai adeia
                empty_stack(Stack),          %elegxoume oti i stoiva einai adeia
                top(NS, H),                  %anaktisi korifis tis listas
                pop(NS, PoppedNS),           %afairoume to proto stoixeio apo tin lista
                push(Stack, H, PushedStack), %eisagoume stin stoiva to stoixeio pou afairesame apo tin lista
                check(PoppedNS, PushedStack).

/*Ta parakato 2 katigorimata elegxoun kathe fora tin korifi tis listas kai tin korifi tis stoivas an einai o idios xaraktiras i oxi.
An oi 2 korifes einai idies tote afairoume tin korifi apo tin lista kai tin prosthetoume stin stoiva
An oi dio korifes einai diaforetikes tote tis afairoume kai tis 2 (apo tin lista kai apo tin stoiva antistoixa)*/
check(NS, Stack) :- \+ empty_stack(NS),      %elegxoume oti i stoiva den einai adeia
                \+empty_stack(Stack),        %elegxoume oti i stoiva den einai adeia
                top(NS, H),                  %anaktisi korifis tis listas (H)
                pop(NS, PoppedNS),           %afairoume to stoixeio pou einai stin korifi tis listas
                top(Stack, H2),              %anaktisi korifis tis stoivas (H2)
                H =:= H2,                    %elegxoume an ta 2 stoixeia einai idia
                push(Stack, H, PushedStack), %eisagoume stin stoiva to stoixeio pou afairesame apo tin lista
                check(PoppedNS, PushedStack).

check(NS, Stack) :- \+ empty_stack(NS),      %elegxoume oti i stoiva den einai adeia
                \+empty_stack(Stack),        %elegxoume oti i stoiva den einai adeia
                top(NS, H),                  %anaktisi korifis tis listas (H)
                pop(NS, PoppedNS),           %afairoume to stoixeio pou vrisketai stin korifi tis listas
                top(Stack, H2),              %anaktisi korifis tis stoivas (H2)
                H =\= H2,                    %elegxoume an ta 2 stoixeia einai diaforetika
                pop(Stack, PoppedStack),     %afairoume to stoixeio pou einai stin korifi tis stoivas
                check(PoppedNS, PoppedStack).

