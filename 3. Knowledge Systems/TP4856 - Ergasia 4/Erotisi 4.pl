/*

Sofia Matthaiaki - TP4856

Gia to programma:
Kanoume consult to arxeio kai anoigoume ston browser ton sindesmo: "http://127.0.0.1:8000/"

*/

:- consult('KB.pl'). %kanoume consult to arxeio me tin vasi gnosis pou periexei tous kanones
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
  reply_html_page(title('Erotisi 4'), %titlos selidas
  [ h2("Simplirose ta parakato:"), %heading
  form( [ action='/result', method='POST' ],
  [ p( [ ], [ 
  label([for=piretos],'Piretos(yes/no): '),
  select([id=piretos,name=piretos],[option(no),option(yes)]) ] ),
  p( [ ], [ 
  label([for=vichas],'Vichas(yes/no): '),
  select([id=vichas,name=vichas],[option(no),option(yes)]) ] ),
  p( [ ], [
  label([for=efidrosi],'Efidrosi(yes/no): '),
  select([id=efidrosi,name=efidrosi],[option(no),option(yes)]) ] ),
  p( [ ], [
  label([for=aimoptisi],'Aimoptisi(yes/no): '),
  select([id=aimoptisi,name=aimoptisi],[option(no),option(yes)]) ] ),
  p( [ ],
  input([name=submit, type=submit, value='Submit'], [ ] )) ] ) ] ).


/*To parakato katigorima dimiourgei tin selida pou tha emfanisei to apotelesma pou eksagoume apo ta dedomena pou dothikan 
stin arxiki forma.*/
landing_pad(Request):-
  member(method(post), Request),!,
  http_read_data(Request, Data, []),
  rules(_,values(Data.piretos,Data.vichas,Data.efidrosi,Data.aimoptisi),Res1,Res2),
  reply_html_page(
  title('Result - Erotisi 4'), [ ] ), 
  format('<p><h1>', []),
  result(Res1,Res2), %eksagogi apotelesmatos apo tin vasi gnosis
  format("<br><br><a href='http://localhost:8000/'>Piso stin forma</a>", []).

/*To katigorima resilt/2 emfanizei ta apotelesmata stin selida*/
result(AnsRes1,AnsRes2):-
  Res1 is AnsRes1*100,
  Res2 is AnsRes2*100,
  write("Pososto gripis "),
  write(Res1),write(' %'),format('<br>'),
  write("Pososto pneumonias "),write(Res2),write(" %").


