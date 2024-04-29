/*

Sofia Matthaiaki - TP4856

Gia to programma:
Kanoume consult to arxeio kai anoigoume ston browser ton sindesmo: "http://127.0.0.1:8000/"
*/

:- use_module(library(http/thread_httpd)). %gia orismo kai rithmisi enos vasikou http server
:- use_module(library(http/http_dispatch)). %gia tin apostoli aitimatos sto diakomisti
:- use_module(library(http/http_error)). %gia xeirismo sfalmatwn
:- use_module(library(http/html_write)). %gia tin dimiourgia html kai alla
:- use_module(library(http/http_client)). %gia na kanoume http requests
:- http_handler('/', ask1, []). %dilosi tou handler tis arxikis selidas (ask1)

server(Port):- http_server(http_dispatch, [port(Port)]). %dimiourgia tou server

:- server(8000). %dimiourgei mia forma stin thira 8000

ask1(_Request) :- 
reply_html_page( %dimiourgia html selidas
title('Quadratic Formula'), %titlos selidas
/*Parakato exoume tin forma tou html pou tha emfanistei sto browser.
Ta inputs exoun type number gia na mporoume na xrisimopoiisoume mono arithmous.*/
[ h2('For the trinomial ax2 + bx + c = 0, give the values of a, b, c:'),
form( [ action='/results', method='POST' ],
[ p( [ ], [label([for=a],'a = '),input([name=a, type=number]) ] ),
p( [ ], [label([for=b],'b = '), input([name=b, type=number]) ] ),
p( [ ], [label([for=c],'c = '), input([name=c, type=number]) ] ),
p( [ ],input([name=submit, type=submit, value='Submit'], [ ] )) ] ) ] ).

:- http_handler('/results', landing_pad, []).  %dilosi tou handler tis defterevousas selidas (landing_pad)

landing_pad(Request):-
reply_html_page( %dimiourgia html selidas (to Body to afinoume keno)
title('Results - Quadratic Formula'),[]),  %titlos selidas
member(method(post), Request), !, %elenxos an to method tou request einai post kai an exei pragmatopiithei
http_read_data(Request, Data, []), %diavasma dedomenwn apo to request kai kataxorisi tous sto Data
format('<p><h1>', []), %orismos tag pou tha xrisimopoiithoun gia tin morfopiisi ton apotelesmaton
tonumber(Data.a, Data.b, Data.c, A, B, C), %metatropi ton dedomenon apo string se arithmo
calculate(A, B, C). %ipologismos rizon

/*Katigorima to opoio metatrepei ta string ABC se arithmous xrisimopoiontas to etimo katigorima atom_number.*/
tonumber(A, B, C, A1, B1, C1) :-
atom_number(A, A1),
atom_number(B, B1),
atom_number(C, C1).

/* Periptosi 1 - a=0 kai b=0 */
calculate(0, 0, _) :-
write('The trinomial is degenerate.'), !.

/* Periptosi 2 - a=0 kai b!=0 */
calculate(0, B, C) :-
B=\=0,
write('The trinomial is of the form bx + c = 0.'),
X is -C/B,
write('The solution is: '), write(X), !.

/* Periptosi 3 - a!=0 kai c=0 */
calculate(A, B, 0) :-
A=\=0,
write('The trinomial is of the form ax2 + bx = 0.'),
X1 is -B/A,
X2 is 0,
write('The solutions are: '), write(X1), write(' and '), write(X2), !.

/* Periptosi 4 (Diakrinetai se 2 periptoseis me 2 ipoperiptoseis)

Stis parakato 2 kiries periptoseis diakrinoume tin morfi tou trionimou to opoio
emfanizoume me katallilo minima*/
calculate(A, B, C) :-
A=\=0,
B=\=0,
C=\=0,
write('The trinomial is of the form ax2 + bx + c = 0.'),
calculate1(A, B, C).

calculate(A, B, C) :-
A=\=0,
B=:=0,
C=\=0,
write('The trinomial is of the form ax2 + c = 0.'),
calculate1(A, B, C).

/*Stis parakato 2 ipoperiptoseis ipologizetai i diakrinousa kai oi rizes analoga*/
calculate1(A, B, C) :-
D is B*B - 4*A*C,
(D>0 ; D=0),
write('The discriminant is: '), write(D), write('.'),
sqrt(D, D1),
X1 is (-B + D1)/(2*A),
X2 is (-B - D1)/(2*A),
write('The solutions are: '), write(X1), write(' and '), write(X2), !.

calculate1(A, B, C) :-
D is B*B - 4*A*C,
D<0,
write('The discriminant is: '), write(D), write('.'),
write('The trinomial has no real solutions, roots are complex numbers.'), !.

