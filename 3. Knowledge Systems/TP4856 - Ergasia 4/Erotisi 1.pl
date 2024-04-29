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

:-http_handler('/', web_form, []).
:-http_handler('/result', landing_pad, []).

server(Port):- http_server(http_dispatch, [port(Port)]). %dimiourgia tou server

:-server(8000). %dimiourgei mia forma stin thira 8000

/*To parakato katigorima dimiourgei tin arxiki selida i opoia periexei enan titlo, ena heading kai mia forma stin opoia prepei
o xristis na dosei ta aparaitita dedomena gia tin eksagogi tou apotelesmatos.*/
web_form(_Request):-
    reply_html_page(title('Erotisi 1'), %titlos selidas
    [ h2("Simplirose ta parakato:"), %heading
    form( [ action='/result', method='POST' ],
    [ p( [ ], [ % To p/2 orizei mia neo paragrafo
    label([for=category],'Katigoria Ergazomenon: '),
    input([id=category, name=category, type=text, value='Tourismos']) ] ),
    p( [ ], [ 
    label([for=a1],'Posostiaia katanomi plithismou - Irakleio: '),
    input([id=a1, name=a1, type=number, value='0.50']) ] ),
    p( [ ], [ 
    label([for=a2],'Posostiaia katanomi plithismou - Lasithi: '),
    input([id=a2, name=a2, type=number, value='0.12']) ] ),
    p( [ ], [ 
    label([for=a3],'Posostiaia katanomi plithismou - Rethimno: '),
    input([id=a3, name=a3, type=number, value='0.13']) ] ),
    p( [ ], [ 
    label([for=a4],'Posostiaia katanomi plithismou - Chania: '),
    input([id=a4, name=a4, type=number, value='0.25']) ] ),
    p( [ ], [ 
    label([for=ba1],'Pososto politon pou afora tin katigoria pou dothike - Irakleio: '),
    input([id=ba1, name=ba1, type=number, value='0.22']) ] ),
    p( [ ], [ 
    label([for=ba2],'Pososto politon pou afora tin katigoria pou dothike - Lasithi: '),
    input([id=ba2, name=ba2, type=number, value='0.28']) ] ),
    p( [ ], [ 
    label([for=ba3],'Pososto politon pou afora tin katigoria pou dothike - Rethimno: '),
    input([id=ba3, name=ba3, type=number, value='0.25']) ] ),
    p( [ ], [ 
    label([for=ba4],'Pososto politon pou afora tin katigoria pou dothike - Chania: '),
    input([id=ba4, name=ba4, type=number, value='0.20']) ] ),
    p( [ ],
    input([name=submit, type=submit, value='Submit'], [ ] )) ] ) ] ).

/*To parakato katigorima dimiourgei tin selida pou emfanizetai otan o xristis patisei to koumpi submit tis proigoumenis selidas.
Arxika me to katigorima atom_number/2 metatrepoume ta dedomena pou exei dosei o xristis se arithmous kai meta ipologizei to apotelesma me 
to katigorima p/9. Telos, emfanizei to apotelesma stin selida kai ena link pou epistrefei ton xristi stin arxiki forma.*/
landing_pad(Request):-
    member(method(post), Request),!,
    http_read_data(Request, Data, []),
    atom_number(Data.a1, A1),
    atom_number(Data.a2, A2),
    atom_number(Data.a3, A3),
    atom_number(Data.a4, A4),
    atom_number(Data.ba1, BA1),
    atom_number(Data.ba2, BA2),
    atom_number(Data.ba3, BA3),
    atom_number(Data.ba4, BA4),
    p(A1,A2,A3,A4,BA1,BA2,BA3,BA4,Ans),
    reply_html_page(
    title('Resutl - Erotisi 1'), %titlos selidas
    [ ] ), 
    format('<p><h1>', []),
    result(Data.category,Ans),
    format("<br><br><a href='http://localhost:8000/'>Piso stin forma</a>", []).

/*Ipologismos tou posostou ton ergazomenon pou aforoun mia sigkekrimeni katigoria, se oli tin Kriti.
P(B) = P(A1)*P(B|A1)+P(A2)*P(B|A2)+P(A3)*P(B|A3)+P(A4)*P(B|A4)*/
p(A1,A2,A3,A4,BA1,BA2,BA3,BA4,Ans):-
    Ans is ((A1*BA1)+(A2*BA2)+(A3*BA3)+(A4*BA4))*100.

/*To katigorima result/2 emfanizei stin selida to apotelesma apo to katigorima p/9.*/
result(Category,Ans):-
    write('Gia tin katigoria: '),
    write(Category),
    format('<br>'),
    write('To pososto ton ergazomenon se oli tin Kriti einai: '),
    write(Ans),write(' %').
