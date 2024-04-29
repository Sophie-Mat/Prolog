/*

Sofia Matthaiaki - TP4856

Gia to programma:
Kanoume consult to arxeio kai anoigoume ston browser ton sindesmo: "http://127.0.0.1:8000/"

Stin arxiki selida tha emfanistoun oi epiloges pou exoume A-F se morfi koumpion.
Me tis epiloges aftes mporoume na kanoume ta eksis:
A) Fortosi iparxontos arxeiou rdf me metriseis i dimiourgia neou arxeiou, analoga me tin epilogi mas stin epomeni selida
B) Eisagogi neas ergastiriakis metrisis
C) Emfanisi olon ton metriseon pou exoume katagrapsei
D) Emfanisi metriseon me provlima (Timi Spirometrisis < 5)
E) Diagrafi olon ton metriseon enos atomou i diagrafi sigkekrimenis metrisis, analoga me tin epilogi mas stin epomeni selida
F) Apothikefsi arxeiou rdf me oles tis metriseis pou exoume katagrapsei
*/

:- use_module(library(http/thread_httpd)). %gia orismo kai rithmisi enos vasikou http server
:- use_module(library(http/http_dispatch)). %gia tin apostoli aitimatos sto diakomisti
:- use_module(library(http/http_error)). %gia xeirismo sfalmatwn
:- use_module(library(http/html_write)). %gia tin dimiourgia html kai alla
:- use_module(library(http/http_client)). %gia na kanoume http requests

%gia tin dimiourgia tou grafou
:-use_module(library(semweb/rdf_db)). %periexei ola ta katigorimata pou xreiazomaste
:-use_module(library(semweb/rdf_http_plugin)). %mas dinei prosvasi se rdf mesa apo to web
:-use_module(library(semweb/turtle)).  %mas epitrepei na diavazoume turtle morfi arxeion rdf

:-http_handler('/', ergasia5, []). %arxiki selida
:-http_handler('/selectionA', selA, []). %epilogi A
:-http_handler('/selectionA1', selA1, []). %fortosi iparxontos arxeiou
:-http_handler('/selectionA2', selA2, []). %dimiourgia neou arxeiou
:-http_handler('/selectionB', selB, []). %epilogi B
:-http_handler('/selectionB1', selB1, []). %eisagogi neas ergastiriakis metrisis
:-http_handler('/selectionC', selC, []). %epilogi C, emfanisi olon ton metriseon
:-http_handler('/selectionD', selD, []). %epilogi D, emfanisi metriseon me provlima
:-http_handler('/selectionE', selE, []). %epilogi E
:-http_handler('/selectionE1', selE1, []). %diagrafi olon ton metriseon enos atomou
:-http_handler('/selectionE2', selE2, []). %diagrafi sigkekrimenis metrisis
:-http_handler('/selectionF', selF, []). %epilogi F
:-http_handler('/selectionF1', selF1, []). %apothikefsi arxeiou rdf

server(Port):- http_server(http_dispatch, [port(Port)]). %dimiourgia tou server

:-server(8000). %dimiourgei ton server ston port 8000


/*                                          - - - - KATIGORIMATA POU THA XRISIMOPOIITHOUN PARAKATO - - - -    


Otan apothikeva me to rdf_save/1 ton grafo, opou eixa keno sto onoma tou arxeiou (anamesa sto onoma kai to eponimo) to apothikeve kanonika, alla otan ekana rdf_load/1 antikathistouse to keno me %20.
Etsi otan apothikeva kapoio sigkekrimeno arxeio defteri fora mou xalouse ta onomata.

Elisa afto to provlima me ta katigorimata: 
replaceChar/2 gia na antikatastiso to %20 me keno.
replaceChar1/2  gia na antikatastiso to keno me %20.
Ta katigorimata replace/4 kai replace1/4 einai paromoia, ta xrisimopoio mesa sta replaceChar/2 kai replaceChar1/2 antistoixa. Antikathistoun kapoio stoixeio mias listas me kapoio allo.
 */

replace(_, _, [], []). %an i lista einai adeia to katigorima einai alithes kai teleionei tin ektelesi tou katigorimatos.
/*an to stoixeio pou psaxnoume na antikathistisoume (O) einai to proto stoixeio tis listas, tote to antikathistoume me to stoixeio pou theloume (R) kai kaloume ksana 
tin replace/4 gia tin ipoloipi lista.*/
replace(O, [R], [O|T], [R|T2]) :- replace(O, [R], T, T2). 
/*an to stoixeio pou psaxnoume na antikathistisoume (O) den einai to proto stoixeio tis listas, tote den allazoume kati, aplos kaloume ksana tin replace/4 gia tin ipoloipi lista.*/
replace(O, [R], [H|T], [H|T2]) :- H \= O, replace(O, [R], T, T2).

replaceChar(String,NewString):-
    atom_codes("%20", ToReplace1),   %dimiourgei tin lista ToReplace1 me tous kodikous ton xaraktiron tou string "%20"
    atom_codes(String, List),        %dimiourgei tin lista List me tous kodikous ton xaraktiron tou String
    ToReplace1=[M|_],                %pairnei to proto stoixeio tis listas ToReplace1, pou einai o kodikos tou xaraktira "%"
    \+member(M, List),               %elegxei an o kodikos tou xaraktira "%" den iparxei stin lista List, diladi an den iparxei o xaraktiras "%" sto arxiko string
    NewString = String,!.            %efoson den iparxei o xaraktiras "%" sto arxiko string, tote to neo string einai iso me to arxiko string

replaceChar(String,NewString):-
    atom_codes("%20", ToReplace1),   %dimiourgei tin lista ToReplace1 me tous kodikous ton xaraktiron tou string "%20"
    atom_codes(" ", ToReplace2),     %dimiourgei tin lista ToReplace2 i opoia periexei monaxa kodiko tou xaraktira " " (keno)
    atom_codes(String, List),!,      %dimiourgei tin lista List me tous kodikous ton xaraktiron tou string String
    ToReplace1=[M|ToReplace11],      %pairnei to proto stoixeio tis listas ToReplace1, pou einai o kodikos tou xaraktira "%"
    member(M, List),                 %elegxei an o kodikos tou xaraktira "%" iparxei stin lista List, diladi an iparxei o xaraktiras "%" sto arxiko string
    replace(M, ToReplace2, List, NewList),  %antikatastasi tou xaraktira "%" me to keno " " stin lista List, kai apothikefsi tis neas listas stin NewList
    /*afou i lista ToReplace11 periexei mono 2 stoixeia tora, xorizoume tin lista ToReplace11 se 2 stoixeia, to N pou einai o kodikos tou xaraktira "2" 
    kai to ToReplace12 pou einai mia lista, pou ousiastika periexei monaxa ton kodiko tou xaraktira "0"*/
    ToReplace11=[N|[ToReplace12]],   
    delete(NewList,N,NewList1),      %diagrafi tou stoixeiou N (kodikos tou xaraktira "2") apo tin lista NewList, kai apothikefsi tis neas listas stin NewList1
    delete(NewList1,ToReplace12,NewList2),   %diagrafi tou stoixeiou ToReplace12 (kodikos tou xaraktira "0") apo tin lista NewList1, kai apothikefsi tis neas listas stin NewList2
    atom_codes(NewString,NewList2),!.        %dimiourgei to neo string NewString metatrepontas ttin lista me tous kodikous ton xaraktiron NewList2 se string (atom pio sosta)

replaceChar(_,_).  %dilonoume oti to replaceChar/2 einai alithes (aneksertita ta stoixeia pou perixexei), meta tin ektelesi ton parapano, opote teleionei i ektelesi tou.

/*
Ta katigorimata replace1/4 kai replaceChar1/2 einai paromoia opos eipa opote den xreiazetai na sas kourazo me peritta sxolia

I diafora sto replace1/4 einai oti otan antikathista to stoixeio sti thesi O, vazei stin thesi tou tria stoixeia (R1,R2,R3).
*/

replace1(_, _, [], []).
replace1(O, [R1,R2,R3], [O|T], [R1,R2,R3|T2]) :- replace1(O, [R1,R2,R3], T, T2).
replace1(O, [R1,R2,R3], [H|T], [H|T2]) :- H \= O, replace1(O, [R1,R2,R3], T, T2).

replaceChar1(String,NewString):-
    atom_codes("%20", ToReplace1),
    atom_codes(" ", [ToReplace2]),
    atom_codes(String, List),
    member(ToReplace2, List),
    replace1(ToReplace2, ToReplace1, List, NewList),
    atom_codes(NewString,NewList),!.

replaceChar1(String,NewString):-
    atom_codes(" ", [ToReplace2]),
    atom_codes(String, List),
    \+member(ToReplace2, List),
    NewString = String,!.


/*                                          - - - - GIA TIN EPILOGI C - - - -    

Ta parakato dio katigorimata kalounte gia na ginei i emfanisi olon ton metriseon kathe astheni stin epilogi C.
Tha mporousan na ginoun pio aploika, omos etsi exoume ena kalitero apotelesma, afou gia kathe xristi emfanizei mia fora to onoma tou kai apo kato to sinolo ton metriseon tou(imerominia kai timi).
To katigorima results/1 pairnei os orisma mia lista i opoia periexei onomata Name kai listes L, pou periexoun tis imerominies kai tis times spirometrisis.
Mesa sto katigorima results/1, kaleite to katigorima r/1, pou pairnei os orisma mia lista L me tis imerominies kai tis times spirometrisis.
*/
results([(Name,L)|List]):-           %apo tin lista pou exoume dosei os orisma, pairnoume to proto stoixeio, to opoio periexei ena onoma kai mia lista L
    replaceChar(Name,Name1),         %kaloume to katigorima replaceChar/2 gia na ginei i antikathistisi ton xaraktiron "%20" me keno " "
    write('Onoma: '), write(Name1),  %emfanizoume to onoma
    format('<br>'),                  %pame stin epomeni grammi
    r(L),                            %kaleitai to katigorima r/1 gia tin lista L
    format('<br>'),
    results(List).                   %kaleitai to katigorima results/1 gia tin ipoloipi lista List
    
results([]).   %otan adeiasei i lista, teleionei i ektelesi tou katigorimatos results/1.

r([(Date,Value)|List1]):-           %apo tin lista pou exoume dosei os orisma, pairnoume to proto stoixeio, to opoio periexei tin imerominia kai tin timi spirometrisis
    write('Imerominia Spirometrisis: '), write(Date),  %emfanizoume tin imerominia
    write(' | '),                                      %xorizoume tin imerominia kai tin timi me to simvolo " | "
    write('Timi Spirometrisis: '), write(Value),       %emfanizoume tin timi spirometrisis
    format('<br>'),
    r(List1).                        %kaleitai to katigorima r/1 gia tin ipoloipi lista List1

r([]).    %otan adeiasei i lista, teleionei i ektelesi tou katigorimatos r/1.



/*                                          - - - - GIA TIN EPILOGI D - - - -  


To parakato katigorima results1/1 doulevei paromoia me to parapano (results/1), me tin diafora oti emfanizei mono ta onomata, tis imerominies kai times times spirometrisis 
oson exoun timi spirometrisis mikroteri apo 5.


Gia times spirometrisis mikroteres apo 5 trexoume afto to katigorima, molis kai an vrethei to onoma sto opoio exei katagrafei i PROTI timi spirometrisis mikroteri tou 5, 
emfanizoume ta stoixeia tis metrisis(onoma, imerominia, timi) kai kaloume to katigorima r1/1 gia na vroume an iparxoun ki alles tetoies metriseis gia to sigkekrimeno atomo.
Otan teleiosei i ektelesi tou r1/1 ekteleitai ksana to results1/1 gia na vrethei to epomeno atomo, me timi spirometrisis mikroteri tou 5 efoson iparxei.*/
results1([(Name,[(Date,Value)|L])|List1]):-
    atom_number(Value,Value1),   %metatrepoume tin timi spirometrisis apo atom se number
    Value1<5,                    %elegxoume an i timi spirometrisis einai mikroteri tou 5
    replaceChar(Name,Name1),     %kaloume to katigorima replaceChar/2 gia na ginei i antikathistisi ton xaraktiron "%20" me keno " "
    /*Emfanisi ton stoixeion tis metrisis*/
    write('Onoma: '), write(Name1),format('<br>'),
    write('Imerominia Spirometrisis: '), write(Date),
    write(' | '),
    write('Timi Spirometrisis: '), write(Value1),
    format('<br>'),
    r1(L),
    format('<br>'),
    results1(List1).    %kaleitai to katigorima results1/1 gia tin ipoloipi lista

/*Gia times spirometrisis megaliteres i ises tou 5 trexoume ta 2 parakato katigorimata,ta opoia den emfanizoun kati, aplos elegxoun tin timi spirometrisis kai 
kaloun to katigorima results1/1 gia tin ipoloipi lista

SIMANTIKO: Giati einai 2 katigorimata gia elegxo tis timis>5?
Einai 2 katigorimata ki oxi ena giati:
-stin periptosi pou itan mono to proto,an i proti timi tis listas metriseon enos onomatos itan megaliteri i isi tou 5 tote 
tha pigaine sto epomeno onoma xoris na elegksei tis ipoloipes times
-stin periptosi pou itan mono to deutero,an ena onoma eixe mono mia metrisi (diladi i lista L itan keni) tote tha evgaze error i selida
*/
results1([(_,[(_,Value)|L])|List1]):-
    atom_number(Value,Value1),
    Value1>=5,
    L==[],
    results1(List1).

results1([(Name,[(_,Value)|L])|List1]):-
    atom_number(Value,Value1),
    Value1>=5,
    L\==[],
    results1([(Name,L)|List1]).

results1([]).  %otan adeiasei i lista, teleionei i ektelesi tou katigorimatos results1/1.

/*Efoson exoume ena atomo pou exei mia toulaxiston timi spirometrisis mikroteri tou 5, kaleitai to katigorima r1/1 to opoio elegxei kathe fora to proto stoixeio tis listas 
me tis metriseis pou exoun katagrafei sto sigkekrimeno onoma kai emfanizei ta stoixeia tis metrisis (imerominia, timi), otan i timi spirometrisis einai mikroteri tou 5.*/
%Ekteleitai otan i timi spirometrisis einai mikroteri tou 5
r1([(Date,Value)|List1]):-
    atom_number(Value,Value1),
    Value1<5,
    write('Imerominia Spirometrisis: '), write(Date),
    write(' | '),
    write('Timi Spirometrisis: '), write(Value1),
    format('<br>'),
    r1(List1).

%Ekteleitai otan i timi spirometrisis einai megaliteri i isi tou 5
r1([(_,Value)|List1]):-
    atom_number(Value,Value1),
    Value1>=5,
    r1(List1).

r1([]).  %otan adeiasei i lista, teleionei i ektelesi tou katigorimatos r1/1.


/*                        - - - - APO EDO ARXIZEI I DIEPAFI - - - -                          */


/*To parakato katigorima dimiourgei tin arxiki selida me to menu.*/
ergasia5(_Request):-
    reply_html_page(title('Ergasia 5'), %titlos selidas
    [ h2("Menu"), %heading
    h4("Epelekse ena apo ta parakato:"), %secondary heading
    p( [ ], [button([onclick="window.location.href='http://localhost:8000/selectionA'"], "A. Fortosi i dimiourgia arxeiou RDF")]), %button gia tin epilogi A
    p( [ ], [button([onclick="window.location.href='http://localhost:8000/selectionB'"], "B. Eisagogi neas ergastiriakis metrisis")]), %button gia tin epilogi B
    p( [ ], [button([onclick="window.location.href='http://localhost:8000/selectionC'"], "C. Emfanisi olon ton ergastiriakon metriseon")]), %button gia tin epilogi C
    p( [ ], [button([onclick="window.location.href='http://localhost:8000/selectionD'"], "D. Emfanisi ton ergastiriakon metriseon me provlima")]), %button gia tin epilogi D
    p( [ ], [button([onclick="window.location.href='http://localhost:8000/selectionE'"], "E. Diagrafi stoixeion apo to grafo")]), %button gia tin epilogi E
    p( [ ], [button([onclick="window.location.href='http://localhost:8000/selectionF'"], "F. Eksodos kai apothikefsi grafou")]) %button gia tin epilogi F
    ] ).


/*To katigorima selA/1 einai to katigorima pou dimiourgei tis 2 formes pou tha xrisimopoihthoun gia tin epilogi A.
O xristis simplironei tin mia analoga me to an thelei na diavasei dedomena apo ena iparxon arxeio rdf i an thelei na dimiourgisei ena kainourgio.*/
selA(_Request):-
    reply_html_page(title('Selection A'), %titlos selidas
    [form( [ action='/selectionA1', method='POST' ],
    [ p( [ ], [ 
    label([for=file],"Dose to path me to onoma enos iparxontos arxeiou RDF ( Example: C:/User/example.rdf ): "),
    input([id=file, name=file, type=text], [ ]),
    input([name=submit, type=submit, value='Fortosi arxeiou RDF >'], [ ] ) ] ) ] ),
    h4("Diaforetika: "),
    form( [ action='/selectionA2', method='POST'],
    [ p( [ ], [ 
    label([for=file],"Dose to path me to onoma tou arxeiou RDF pou tha dimiourgithei ( Example: C:/User/example.rdf ): "),
    input([id=file, name=file, type=text], [ ]),
    input([name=submit, type=submit, value='Dimiourgia neou arxeiou RDF >'], [ ] ) ] ) ] )]).

/*To katigorima selA1/1 diavazei dedomena apo ena iparxon arxeio rdf kai to fortonei sto grafo.*/
selA1(Request):-
    member(method(post), Request), !,
    http_read_data(Request, Data, []),
    atom_string(A, Data.file),
    /*SIMANTIKO gia to rdf_load: 
    To sigkekrimeno option(base_uri('')) einai gia na min xrisimopoihthei to base_uri tou arxeiou pou diavazetai.
    An xrisimopoiithei kai pame na apothikefsoume defteri fora kapoio arxeio tha xalasoun ta onomata (Name) tou arxeiou.*/
    rdf_load(A,[base_uri('')]),  
    reply_html_page(title('Selection A1'), %titlos selidas
    [ h2("To arxeio RDF fortothike me epitixia!"),
    button([onclick="window.location.href='http://localhost:8000/'"], "< Piso sto kirios menu")]).

/*To katigorima selA2/1 dimiourgei ena kainourgio arxeio rdf kai to fortonei sto grafo.*/
selA2(Request):-
    member(method(post), Request), !,
    http_read_data(Request, Data, []),
    atom_string(A, Data.file),
    rdf_save(A),
    rdf_load(A,[base_uri('')]), 
    reply_html_page(title('Selection A2'), %titlos selidas
    [ h2("To arxeio RDF dimiourgithike me epitixia!"),
    button([onclick="window.location.href='http://localhost:8000/'"], "< Piso sto kirios menu")]).


/*To katigorima selB/1 dimiourgei tin forma pou tha xrisimopoihthei gia tin epilogi B, gia tin eisagogi ton stoixeion mias neas metrisis*/
selB(_Request):-
    reply_html_page(title('Selection B'), %titlos selidas
    [form( [ action='/selectionB1', method='POST' ],
    [ p( [ ], [ 
    label([for=name],"Onomateponimo: "),
    input([id=name, name=name, type=text, value='Charis Kondilakis'], [ ])]),
    p( [ ], [ 
    label([for=date],"Imerominia Spirometrisis: "),
    input([id=date, name=date, type=text, value='21-12-2022'], [ ])]),
    p( [ ], [ 
    label([for=value],"Timi Spirometrisis: "),
    input([id=value, name=value, type=text, value='6'], [ ])]),
    p( [ ], [
    input([name=submit, type=submit, value='Eisagogi ergastiriakis metrisis >'], [ ] ) ] ) ] )]).

/*To katigorima selB1/1 eisagei tis times apo tin parapano forma, ston grafo.*/
selB1(Request):-
    member(method(post), Request), !,
    http_read_data(Request, Data, []),
    atom_string(Name, Data.name),
    atom_string(Date, Data.date),
    atom_string(Value, Data.value),
    replaceChar1(Name,Name1),  %allagi tou kenou (anamesa se onoma kai eponimo) me tous xaraktires "%20"
    rdf_assert(Name1, rdf:type, 'person'), 
    rdf_assert(Name1, Date, literal(Value),'person'), 
    reply_html_page(title('Selection B1'), %titlos selidas
    [ h2("I eisagogi tis ergastiriakis metrisis egine me epitixia!"),
    button([onclick="window.location.href='http://localhost:8000/'"], "< Piso sto kirios menu")]).

/*To katigorima selC/1 dimiourgei tin selida pou emfanizetai stin epilogi C, gia tin emfanisi olon ton metriseon*/
selC(_Request):-
    reply_html_page(title('Selection C'), [button([onclick="window.location.href='http://localhost:8000/'"], "< Piso sto kirios menu")]), %titlos selidas
    format('<p><h4>', []),
    /*Afou me to katigorima rdf/3 mporoume na exoume to sinolo ton metriseon, me to bagof/3 mporoume na tis xorisoume, diladi se kathe onoma na antistoixei mia lista
    me oles tis metriseis(imerominia kai timi) pou exei kanei. Stin sinexeia me to findall/3 pairnoume mia lista me ola ta apotelesmata pou pairnoume apo to bagof/3.
    Etsi petixenoume mia pio sosti anaparastasi ton dedomenon pou exoume.*/
    findall((A,D),bagof((B,C),rdf(A,B,literal(C)),D),List),
    results(List).    %emfanisi olon ton metriseon

/*To katigorima selD/1 dimiourgei tin selida pou emfanizetai stin epilogi D, gia tin emfanisi mono ton metriseon me timi spirometrisis mikroteri tou 5*/
selD(_Request):-
    reply_html_page(title('Selection C'), [button([onclick="window.location.href='http://localhost:8000/'"], "< Piso sto kirios menu")]), %titlos selidas
    format('<p><h4>', []),
    findall((A,D),bagof((B,C),rdf(A,B,literal(C)),D),List),
    results1(List).    %emfanisi mono ton metriseon me timi spirometrisis mikroteri tou 5

/*To katigorima selE/1 dimiourgei tis formes pou tha xrisimopoiithoun gia tin epilogi E, gia tin diagrafi metriseon.
O xristis simplironei tin forma pou epithimei analoga me to an thelei na diagrapsei mia sigkekrimeni metrisi (imerominia kai timi), i to sinolo ton dedomenon kapoiou, dinontas mono to onoma.*/
selE(_Request):-
    reply_html_page(title('Selection E'), %titlos selidas
    [h4('Dose to onomateponimo tou astheni tou opoiou epithimeis na ginei diagrafi OLON ton katagrafon tou:'),
    form( [ action='/selectionE1', method='POST' ],
    [ p( [ ], [ 
    label([for=name],"Onomateponimo: "),
    input([id=name, name=name, type=text, value='Charis Kondilakis'], [ ])]),
    p( [ ], [
    input([name=submit, type=submit, value='Diagrafi >'], [ ] ) ] ) ] ),
    h4("Diaforetika, gia na diagrafei monaxa mia sigkekrimeni katagrafi, dose ta parakato stoixeia:"),
    form( [ action='/selectionE2', method='POST' ],
    [ p( [ ], [ 
    label([for=name],"Onomateponimo: "),
    input([id=name, name=name, type=text, value='Charis Kondilakis'], [ ])]),
    p( [ ], [ 
    label([for=date],"Imerominia Spirometrisis: "),
    input([id=date, name=date, type=text, value='21-12-2022'], [ ])]),
    p( [ ], [ 
    label([for=value],"Timi Spirometrisis: "),
    input([id=value, name=value, type=text, value='6'], [ ])]),
    p( [ ], [
    input([name=submit, type=submit, value='Diagrafi >'], [ ] ) ] ) ] )]).

/*To katigorima selE1/1 diagrafei ola ta dedomena pou exoun katagrafei gia ena sigkekrimeno onoma, pou dothike stin forma.*/
selE1(Request):-
    member(method(post), Request), !,
    http_read_data(Request, Data, []),
    atom_string(Name, Data.name),
    replaceChar1(Name,Name1), %an iparxei keno sto onoma pou dothike apo tin forma to antikathista me "%20"
    ((rdf(Name,_,_),rdf_retractall(Name, _, _));rdf_retractall(Name1, _, _)), %diagrafi olon ton metriseon me to sigkekrimeno onoma, eite exoun keno sto onoma, eite "%20", eite tipota apo ta dio
    reply_html_page(title('Selection E1'), %titlos selidas
    [ h2("I diagrafi tou sinolou ton katagrafon tou astheni egine me epitixia!"),
    button([onclick="window.location.href='http://localhost:8000/'"], "< Piso sto kirios menu")]).

/*To katigorima selE2/1 diagrafei mia sigkekrimeni metrisi, analoga me to onoma, tin imerominia kai tin timi pou dothikan apo tin forma.*/
selE2(Request):-
    member(method(post), Request), !,
    http_read_data(Request, Data, []),
    atom_string(Name, Data.name),
    atom_string(Date, Data.date),
    atom_string(Value, Data.value),
    replaceChar1(Name,Name1),
    ((rdf(Name,Date, literal(Value)),rdf_retractall(Name, Date, literal(Value)));rdf_retractall(Name1, Date, literal(Value))), %diagrafi sigkekrimenis metrisis, eite iparxei keno sto onoma, eite "%20", eite tipota apo ta dio
    reply_html_page(title('Selection E1'), %titlos selidas
    [ h2("I diagrafi tis sigkekrimenis katagrafis egine me epitixia!"),
    button([onclick="window.location.href='http://localhost:8000/'"], "< Piso sto kirios menu")]).

/*To katigorima selF/1 dimiourgei tin forma pou tha xrisimopoiithei gia tin epilogi F, gia tin apothikefsi dedomenon se arxeio RDF.*/
selF(_Request):-
    reply_html_page(title('Selection F'), %titlos selidas
    [form( [ action='/selectionF1', method='POST' ],
    [ p( [ ], [ 
    label([for=savedfile],"Dose to path me to onoma tou arxeiou RDF sto opoio theleis na apothikeftoun ta nea dedomena( Example: C:/User/example.rdf ): "),
    input([id=savedfile, name=savedfile, type=text], [ ]),
    input([name=submit, type=submit, value='Apothikefsi arxeiou RDF >'], [ ] ) ] ) ] )]).

/*To katigorima selF1/1 apothikeuei ta dedomena pou exoun katagrafei se ena arxeio RDF, analoga me to path pou dothike apo tin forma.*/
selF1(Request):-
    member(method(post), Request), !,
    http_read_data(Request, Data, []),
    atom_string(A, Data.savedfile),
    rdf_save(A),
    reply_html_page(title('Selection F1'), %titlos selidas
    [ h2("To arxeio RDF apothikeftike me epitixia!")]).


