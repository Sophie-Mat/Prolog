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
    reply_html_page(title('Erotisi 2'), %titlos selidas
    [ h2("Simplirose ta parakato:"), %heading
    form( [ action='/result', method='POST' ],
    [ p( [ ], [ 
    label([for=mathima],'Mathima: '),
    input([id=mathima, name=mathima, type=text, value='Texniti Noimosini']) ] ),
    p( [ ], [ 
    label([for=a1],'Pososto foititon pou eggrafontai: '),
    input([id=a1, name=a1, type=number, value='0.6']) ] ),
    p( [ ], [ 
    label([for=a2],'Pososto foititrion pou eggrafontai: '),
    input([id=a2, name=a2, type=number, value='0.4']) ] ),
    p( [ ], [ 
    label([for=ba1],'Pososto foititon pou pernane to mathima: '),
    input([id=ba1, name=ba1, type=number, value='0.62']) ] ),
    p( [ ], [ 
    label([for=ba2],'Pososto foititrion pou pernane to mathima: '),
    input([id=ba2, name=ba2, type=number, value='0.68']) ] ),
    p( [ ],
    input([name=submit, type=submit, value='Submit'], [ ] )) ] ) ] ).


/*To parakato katigorima dimiourgei tin selida pou tha emfanisei to apotelesma pou eksagoume apo ta dedomena pou dothikan 
stin arxiki forma. Me to katigorima atom_number/2 metatrepoume ta dedomena pou exei dosei o xristis se arithmous oste na ta
xrisimopoiisoume gia tous katallilous ipologismous.*/
landing_pad(Request):-
    member(method(post), Request),!,
    http_read_data(Request, Data, []),
    atom_number(Data.a1, A1),
    atom_number(Data.a2, A2),
    atom_number(Data.ba1, BA1),
    atom_number(Data.ba2, BA2),
    p(A1,A2,BA1,BA2,AnsBA1,AnsBA2),
    reply_html_page(
    title('Result - Erotisi 2'), [ ] ), 
    format('<p><h1>', []),
    result(Data.mathima,AnsBA1,AnsBA2),
    format("<br><br><a href='http://localhost:8000/'>Piso stin forma</a>", []).


/*Ipologismos pithanotiton
a) Gia tin pithanotita na einai foititis exoume: P(A1|B) = (P(A1)*P(B|A1))/((P(A1)*P(B|A1))+(P(A2)*P(B|A2)))
b) Gia tin pithanotita na einai foititria exoume: P(A2|B) = (P(A2)*P(B|A2))/((P(A1)*P(B|A1))+(P(A2)*P(B|A2)))*/
p(A1,A2,BA1,BA2,AnsBA1,AnsBA2):-
    AnsBA1 is ((A1*BA1)/((A1*BA1)+(A2*BA2)))*100, %gia foititi
    AnsBA2 is ((A2*BA2)/((A1*BA1)+(A2*BA2)))*100. %gia foititria

/*To katigorima result/2 emfanizei stin selida to apotelesma apo to katigorima p/6.*/
result(Mathima,AnsBA1,AnsBA2):-
    write('Gia to mathima: '),
    write(Mathima),
    format('<br>'),
    write('I pithanotita na to perase foititis einai: '),
    write(AnsBA1),write(' %'),
    format('<br>'),
    write('I pithanotita na to perase foititria einai: '),
    write(AnsBA2),write(' %').
