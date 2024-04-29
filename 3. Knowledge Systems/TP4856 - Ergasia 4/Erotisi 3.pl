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
  reply_html_page(title('Erotisi 3'), %titlos selidas
  [ h2("Simplirose ta parakato:"), %heading
  form( [ action='/result', method='POST' ],
  [ p( [ ], [ 
  label([for=covid],'Pithanotita o asthenis na exei koronoio: '),
  input([id=covid, name=covid, type=number, value='0.35']) ] ),
  p( [ ], [ 
  label([for=agefsiaCovid],'Pithanotita o asthenis na exei agefsia kai na gnorizei oti exei koronoio: '),
  input([id=agefsiaCovid, name=agefsiaCovid, type=number, value='0.7']) ] ),
  p( [ ], [ 
  label([for=agefsiaNotCovid],'Pithanotita o asthenis na exei agefsia kai na gnorizei oti den exei koronoio: '),
  input([id=agefsiaNotCovid, name=agefsiaNotCovid, type=number, value='0.05']) ] ),
  p( [ ],
  input([name=submit, type=submit, value='Submit'], [ ] )) ] ) ] ).

/*To parakato katigorima dimiourgei tin selida pou tha emfanisei to apotelesma pou eksagoume apo ta dedomena pou dothikan 
stin arxiki forma. Me to katigorima atom_number/2 metatrepoume ta dedomena pou exei dosei o xristis se arithmous oste na ta
xrisimopoiisoume gia tous katallilous ipologismous.*/
landing_pad(Request):-
  member(method(post), Request),!,
  http_read_data(Request, Data, []),
  atom_number(Data.covid, Covid),
  atom_number(Data.agefsiaCovid, AgefsiaCovid),
  atom_number(Data.agefsiaNotCovid, AgefsiaNotCovid),
  p(Covid,AgefsiaCovid,AgefsiaNotCovid,Ans),
  reply_html_page(
  title('Result - Erotisi 3'), [ ] ),
  format('<p><h1>', []),
  result(Ans),
  format("<br><br><a href='http://localhost:8000/'>Piso stin forma</a>", []).

/*O ipologismos tis pithanotitas kapoios asthenis me agefsia na exei koronoio ginetai me ton parakato tipo:
P(koronoio|agefsia) = (P(agefsia|koronoio)*P(koronoio))/(P(agefsia|koronoio)*P(koronoio))+(P(agefsia|!koronoio)*P(!koronoio))*/
p(Covid,AgefsiaCovid,AgefsiaNotCovid,Ans):-
  NotCovid is 1-Covid, %i pithanotita o asthenis na min exei koronoio einai isi me tin diafora tou 1 apo tin pithanotita o asthenis na exei koronoio.
  Ans is ((AgefsiaCovid*Covid)/((AgefsiaCovid*Covid)+(AgefsiaNotCovid*NotCovid)))*100.

/*To katigorima result/2 emfanizei stin selida to apotelesma apo to katigorima p/4.*/
result(Ans):-
  write('I pithanotita kapoios asthenis me agefsia na exei koronoio einai: '),
  write(Ans),write(' %').
