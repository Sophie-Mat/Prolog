/*

Sofia Matthaiaki - TP4856

Gia to programma:
Kanoume consult to arxeio kai anoigoume ston browser ton sindesmo: "http://127.0.0.1:7000/"

Se kapoia vimata iparxoun paradeigmata me tin morfi (etc: ....)
Ta exo valei gia na katanoisete se ti morfi prepei na valete to kathe input.
!!Den vazoume ta inputs me '' i . mono oti akolouthei to etc.!!
Mporeite na ta kanete copy-paste gia na deite oti doulevoun.

Eixa thema me to working directory genika, opos kai stin proigoumeni askisi opote evala ksexoristes selides
sto programma, gia na dinete to apolito path tou arxeiou KB.pl.

---------------------------------------------------------------------------------------------

Ta parakato katigorimata tha xreiastoun stin epilogi 2 tou defterevontos menou.

To katigorima trim spaei ta rid1,rid2,rid3,.... se rid kai arithmo kai krataei mono tous arithmous,
tous opoious epistrefei se mia lista.
Stin sinexeia, to katigorima findMax vriskei ton megalitero apo olous tous arithmous tis listas pou
epestrepse to katigorima trim.
*/
trim([],[]).
trim([H|T],NewList):-
  name(H,Rule),
  Rule = [_,_,_|TRule],
  name(HRule,TRule),
  trim(T,NewList1),
  NewList = [HRule|NewList1].

findMax([M],M).
findMax([H|T],H):-
          findMax(T,M),
          H>=M.

findMax([H|T],M):-
          findMax(T,M),
          H<M.
		  
/*
Ta parakato katigorimata tha xreiastoun stin epilogi 3 tou defterevontos menou.

--To katigorima tuple tha to xrisimopoiisoume gia na metatrepsoume tis parentheseis() se agkiles[]
oste na dimiourgisoume tis aparaitites listes.
--To katigorima untuple kanei to antistrofo, metatrepei tis agkiles[] se parentheseis() oste na tis
xrisimopoiisoume parakato.

Stin askisi paratiroume pos ta dedomena pou xreiazomaste gia na exoume kapoio apotelesma einai apo 1 mexri 5.
Ara ta 2 katigorimata (tuple kai untuple) exoun grafei 5 fores, oses kai oi paralages me ton aritho ton 
dedomenon pou xreiazomaste.
*/
tuple((D1,D2,D3,D4,D5),[D1,D2,D3,D4,D5]).
tuple((D1,D2,D3,D4),[D1,D2,D3,D4]).
tuple((D1,D2,D3),[D1,D2,D3]).
tuple((D1,D2),[D1,D2]).
tuple((D1),[D1]).

untuple([D1,D2,D3,D4,D5],(D1,D2,D3,D4,D5)).
untuple([D1,D2,D3,D4],(D1,D2,D3,D4)).
untuple([D1,D2,D3],(D1,D2,D3)).
untuple([D1,D2],(D1,D2)).
untuple([D1],(D1)).

	

:- use_module(library(http/thread_httpd)). %gia orismo kai rithmisi enos vasikou http server
:- use_module(library(http/http_dispatch)). %gia tin apostoli aitimatos sto diakomisti
:- use_module(library(http/http_error)). %gia xeirismo sfalmatwn
:- use_module(library(http/html_write)). %gia tin dimiourgia html kai alla
:- use_module(library(http/http_client)). %gia na kanoume http requests
:- http_handler('/', ask3, []). %dilosi tou handler tis arxikis selidas (ask1)

server(Port):- http_server(http_dispatch, [port(Port)]). %dimiourgia tou server

:- server(7000). %dimiourgei mia forma stin thira 7000

/*Parakato dimiourgoume tin arxiki selida stin opoia zititai to apolito path gia to arxeio KB.pl*/
ask3(_Request) :- 
reply_html_page(    %dimiourgia html selidas
title('Erotima 3'), %titlos selidas
/*Parakato exoume tin forma tou html pou tha emfanistei sto browser.*/
[ h2("Dose to path gia to arxeio KB.pl se morfi C:/.../.../KB.pl"),
h5('Ego gia paradeigma xrisimopoio afto : C:/Users/smatt/Documents/University/7th Semester/Knowledge Systems/lab hw/TP4856 - Ergasia 3/KB.pl'),
form( [ action='/mainmenu', method='POST' ],
[ p( [ ], [label([for=path],'Path : '),input([name=path, type=textarea]) ] ),
p( [ ],input([name=submit, type=submit, value='Submit'], [ ] )) ] ) ] ).

:- http_handler('/mainmenu', landing_pad, []).  %dilosi tou handler tis selidas (landing_pad)

/*Dimiourgoume tin selida pou tha exei to kirios menou*/
landing_pad(Request):-
reply_html_page( %dimiourgia html selidas
title('Main Menu'),  %titlos selidas
/*Parakato exoume tin forma tou html pou tha emfanistei sto browser.*/
[ h1('Epelekse enan arithmo apo tous parakato:'),
form( [ action='/menu2', method='POST' ],
[ h4('Dose 1 gia diagnosi provlimaton apo to perivallontiko sistima gnosis.'),
h4('Dose 2 gia enimerosi tis BG.'),
h4('Dose 3 gia eksodo.'),
p( [ ], [label([for=mmenu],'Epilogi : '),input([name=mmenu, type=number]) ] ),
p( [ ],input([name=submit, type=submit, value='Submit'], [ ] )) ] ) ] ),
member(method(post), Request), !, %elenxos an to method tou request einai post kai an exei pragmatopiithei
http_read_data(Request, Data, []), %diavasma dedomenon apo to request kai kataxorisi tous sto Data
consult(Data.path). %kanoume consult to arxeio pou edose o xristis


:- http_handler('/menu2', landing_pad2, []).  %dilosi tou handler tis selidas (landing_pad2)


landing_pad2(Request):-
member(method(post), Request), !, %elenxos an to method tou request einai post kai an exei pragmatopiithei
http_read_data(Request, Data, []), %diavasma dedomenwn apo to request kai kataxorisi tous sto Data
create(Data.mmenu). %kaloume tin create me orisma to Data.mmenu oste na ektiposoume tin antistoixi selida

/*  -- Epilogi 1 Kirios Menou -- 
Me ta katallila dedomena pou tha dosei o xristis dinei to apotelesma anoxias opos eixame kanei 
stis proigoumenes askiseis*/
create('1'):- 
reply_html_page( %dimiourgia html selidas
title('Epilogi 1'),  %titlos selidas
/*Parakato exoume tin forma tou html pou tha emfanistei sto browser.*/
[ h1('Dose ta aparaitita dedomena (osa xreiazontai):'),
form( [ action='/selection1', method='POST' ],
[ p( [ ], [label([for=d1],'Pososto_koresmou (<20 / >=20 / oxi) : '),input([name=d1, type=textarea]) ] ),
p( [ ], [label([for=d2],'Iparksi_nitrikon_alaton (nai / oxi) : '),input([name=d2, type=textarea]) ] ),
p( [ ], [label([for=d3],'Iparksi_kokkinon_oligochaetes (arketa / liga / oxi) : '),input([name=d3, type=textarea]) ] ),
p( [ ], [label([for=d4],'Iparksi_izimaton (anoikta / mavra / skoura) : '),input([name=d4, type=textarea]) ] ),
p( [ ], [label([for=d5],'Iparksi_idrothiou (nai / oxi) : '),input([name=d5, type=textarea]) ] ),
p( [ ], [label([for=d6],'Iparksi_methaniou (nai / oxi) : '),input([name=d6, type=textarea]) ] ),
p( [ ], [label([for=d7],'Tipos_ipostromatos (kanoniko / mesaio / megalo) : '),input([name=d7, type=textarea]) ] ),
p( [ ], [label([for=d8],'Asximi_mirodia_nerou (nai / oxi) : '),input([name=d8, type=textarea]) ] ),
p( [ ],input([name=submit, type=submit, value='Submit'], [ ] )) ] )]).

/*  -- Epilogi 2 Kirios Menou --  
Dimiourgei to defterevon menou.*/
create('2'):- 
reply_html_page( %dimiourgia html selidas
title('Epilogi 2'),  %titlos selidas
/*Parakato exoume tin forma tou html pou tha emfanistei sto browser.*/
[ h1('Epelekse enan arithmo apo tous parakato:'),
form( [ action='/selection2', method='POST' ],
[ h4('Dose 1 gia diagrafi kanona.'),
h4('Dose 2 gia prosthiki neou kanona.'),
h4('Dose 3 gia tropopoiisi iparxontos kanona.'),
h4('Dose 4 gia apothikefsi tis BG kai eksodo apo tin diadikasia enimerosis tis BG.'),
p( [ ], [label([for=smenu],'Epilogi : '),input([name=smenu, type=number]) ] ),
p( [ ],input([name=submit, type=submit, value='Submit'], [ ] )) ] )]).

/*  -- Epilogi 3 Kirios Menou --  
Emfanizei minima eksodou.*/
create('3'):-
reply_html_page( %dimiourgia html selidas (to Body to afinoume keno)
title('Epilogi 3'),  %titlos selidas
/*Parakato exoume tin forma tou html pou tha emfanistei sto browser.*/
[ h1('Exit')]).

/*  -- Lanthasmeni Epilogi --
An o xristis dosei kapoion arithmo pou den anoikei stis epiloges tou kirios menou
tote i selida emfanizei minima lathous*/
create(X):-
X\='1',X\='2',X\='3',
reply_html_page( %dimiourgia html selidas (to Body to afinoume keno)
title('Error'),  %titlos selidas
/*Parakato exoume tin forma tou html pou tha emfanistei sto browser.*/
[ h1('Lathos epilogi. Parakalo pigaine piso kai epelekse kapoion arithmo apo to menou.')]).


:- http_handler('/selection1', landing_pad3, []).  %dilosi tou handler tis selidas (landing_pad3)
/*I selida pou tha emfanistei tha exei to apotelesma anoxias pou proekipse apo ta dedomena pou dosame
stin proti epilogi tou kirios menou*/
landing_pad3(Request):-
reply_html_page( %dimiourgia html selidas (to Body to afinoume keno)
title('Result'),[]),  %titlos selidas
format('<p><h1>', []), %orismos tag pou tha xrisimopoiithoun gia tin morfopiisi ton apotelesmaton
member(method(post), Request), !, %elenxos an to method tou request einai post kai an exei pragmatopiithei
http_read_data(Request, Data, []), %diavasma dedomenwn apo to request kai kataxorisi tous sto Data
apotelesma(_,data(Data.d1,Data.d2,Data.d3,Data.d4,Data.d5,Data.d6,Data.d7,Data.d8),Answer), %kaloume tin create me orisma to Data.mmenu
write(Answer). %ektiposi apotelesmatos


:- http_handler('/selection2', landing_pad4, []).  %dilosi tou handler tis selidas (landing_pad4)

/*I selida pou tha dimiourgithei tha periexei tin katallili forma i apotelesma me vasi tin
epilogi pou dothike sto defterevon menou*/
landing_pad4(Request):-
member(method(post), Request), !, %elenxos an to method tou request einai post kai an exei pragmatopiithei
http_read_data(Request, Data, []), %diavasma dedomenwn apo to request kai kataxorisi tous sto Data
create2(Data.smenu). %kaloume tin create me orisma to Data.mmenu gia na dimiourgisoume tin katallili forma

/*  -- Epilogi 1 Defterevontos Menou -- 
Emfanizei mia forma stin opoia zitaei apo ton xristi na dosei tin taftotita tou kanona pou epithimei 
na diagrafei*/
create2('1'):-
reply_html_page( %dimiourgia html selidas (to Body to afinoume keno)
title('Diagrafi kanona'),  %titlos selidas
/*Parakato exoume tin forma tou html pou tha emfanistei sto browser.*/
[ h1('Dose tin taftotita tou kanona pou epithimeis na diagrafei (Paradeigma: rid3) :'),
form( [ action='/selection21', method='POST' ],
[ p( [ ], [label([for=id],'ID : '),input([name=id, type=textarea]) ] ),
p( [ ],input([name=submit, type=submit, value='Submit'], [ ] )) ] )]).

/*  -- Epilogi 2 Defterevontos Menou --  
Emfanizei mia forma stin opoia zitaei apo ton xristi na dosei ta katallila dedomena, oste na prosthesei 
stin BG enan neo kanona.*/	
create2('2'):-
reply_html_page( %dimiourgia html selidas (to Body to afinoume keno)
title('Prosthiki neou kanona'),  %titlos selidas
/*Parakato exoume tin forma tou html pou tha emfanistei sto browser.*/
[ h1('Dose ta stoixeia tou neou kanona:'),
form( [ action='/selection22', method='POST' ],
[ p( [ ], [label([for=d11],"Dose ta aparaitita dedomena (etc: '$VAR'(10),_,_,_,_,_,_,_ ) : "),input([name=d11, type=textarea]) ] ),
p( [ ], [label([for=d12],"Dose tis proipothesis tou kanona (etc: ('$VAR'(10)='<25') ): "),input([name=d12, type=textarea]) ] ),
p( [ ], [label([for=d13],'Dose to apotelesma pou tha emfanizetai me afton ton kanona (etc: Moderate Problem Anoxia ): '),input([name=d13, type=textarea]) ] ),
p( [ ],input([name=submit, type=submit, value='Submit'], [ ] )) ] )]).


/*  -- Epilogi 3 Defterevontos Menou --  
Emfanizei mia forma stin opoia zitaei ta katallila dedomena apo ton xristi, gia tin tropopoiisi enos kanona.*/
create2('3'):-
reply_html_page( %dimiourgia html selidas (to Body to afinoume keno)
title('Tropopoiisi iparxontos kanona'),  %titlos selidas
/*Parakato exoume tin forma tou html pou tha emfanistei sto browser.*/
[ form( [ action='/selection23', method='POST' ],
[ p( [ ], [label([for=rid],'Dose tin taftotita tou kanona pou epithimeis na tropopoiithei (etc: rid1 ) : '),input([name=rid, type=textarea]) ] ),
p( [ ], [label([for=olddata],"Dose to dedomeno pou epithimeis na allakseis (etc: '$VAR'(0) = '>=20' ) : "),input([name=olddata, type=textarea]) ] ),
p( [ ], [label([for=newdata],"Dose to neo dedomeno (etc: '$VAR'(0) = '>= 25' ): "),input([name=newdata, type=textarea]) ] ),
p( [ ],input([name=submit, type=submit, value='Submit'], [ ] )) ] )]).

/*  -- Epilogi 4 Defterevontos Menou --
Apothikevei tin BG sto arxeio KB.pl.*/
create2('4'):-
reply_html_page(    %dimiourgia html selidas
title('Apothikefsi arxeiou'), %titlos selidas
/*Parakato exoume tin forma tou html pou tha emfanistei sto browser.*/
[ h2("Dose to path gia to arxeio sto opoio theleis na apothikefseis ta nea dedomena, se morfi C:/.../.../KB.pl"),
h5('Ego an ta apothikeva sto idio arxeio xrisimopoiousa pali afto : C:/Users/smatt/Documents/University/7th Semester/Knowledge Systems/lab hw/TP4856 - Ergasia 3/KB.pl'),
form( [ action='/selection24', method='POST' ],
[ p( [ ], [label([for=path],'Path : '),input([name=path, type=textarea]) ] ),
p( [ ],input([name=submit, type=submit, value='Submit'], [ ] )) ] ) ] ).

/*  -- Lanthasmeni Epilogi Defterevontos Menou --
Emfanizei minima lathous se periptosi pou o arithmos pou dothike den iparxei os epilogi sto defterevon menou.*/
create2(X):-
X\='1',X\='2',X\='3',X\='4',
reply_html_page( %dimiourgia html selidas (to Body to afinoume keno)
title('Error'),  %titlos selidas
/*Parakato exoume tin forma tou html pou tha emfanistei sto browser.*/
[ h1('Lathos epilogi. Parakalo pigaine piso kai epelekse kapoion arithmo apo to menou.')]).

:- http_handler('/selection21', selection21, []).  %dilosi tou handler tis selidas (selection21)

/*To sigkekrimeno katigorima diagrafei enan kanona apo tin BG. Kaleitai stin proti epilogi tou defterevontos menou.*/
selection21(Request):-
member(method(post), Request), !, %elenxos an to method tou request einai post kai an exei pragmatopiithei
http_read_data(Request, Data, []), %diavasma dedomenwn apo to request kai kataxorisi tous sto Data
retractall(apotelesma(Data.id,_,_)), /*me tin sigkekrimeni entoli diagrafetai to katigorima me to id pou dothike*/
reply_html_page( %dimiourgia html selidas
title('Deleted ID'),  %titlos selidas
/*Parakato exoume tin forma tou html pou tha emfanistei sto browser.*/
[ h1('O kanonas diagrafike epitixos') ] ).

:- http_handler('/selection22', selection22, []).  %dilosi tou handler tis selidas (selection22)

/*To sigkekrimeno katigorima prosthetei enan kanona stin BG. Kaleitai stin defteri epilogi tou defterevontos menou.*/
selection22(Request):-
member(method(post), Request), !, %elenxos an to method tou request einai post kai an exei pragmatopiithei
http_read_data(Request, Data, []), %diavasma dedomenwn apo to request kai kataxorisi tous sto Data
/*me to katigorima findall pernoume ola ta ID apo ola ta katigorimata apotelesma kai ta vazoume stin lista List*/
	findall(Id,clause(apotelesma(Id,data('$VAR'(0),'$VAR'(1),'$VAR'(2),'$VAR'(3),'$VAR'(4),'$VAR'(5),'$VAR'(6),'$VAR'(7)),'$VAR'(8)),_),List),
	trim(List,List2), /*Apo tin lista pou dimiourgisame stin proisoumeni grammmi kratame mono tous arithmous stin lista List2*/
	findMax(List2,Max), /*Vriskoume ton megalitero apo tous arithmous stin List2*/
	NewMax is Max + 1, /*I taftotita tou neou katigorimatos tha exei arithmo megalitero apo to proigoumeno katigorima kata mia monada.*/
	string_concat(rid,NewMax,IdString), /*Ftiaxnoume tin taftotita tou neou katigorimatos enonontas to string 'rid' me ton arithmo NewMax*/
	string_to_atom(IdString,Id), /*metatrepei to string IdString se atom*/
	term_to_atom(D11,Data.d11), /*metatrepei to string Data.d11 se atom oste na afairethoun ta ''*/
	term_to_atom(D12,Data.d12), /*metatrepei to string Data.d12 se atom oste na afairethoun ta ''*/
	assertz((apotelesma(Id, data(D11), Answer):- D12,Answer=Data.d13)), /*Prosthetei ton neo kanona stin vasi gnosis*/
reply_html_page( %dimiourgia html selidas
title('Rule added'),  %titlos selidas
/*Parakato exoume tin forma tou html pou tha emfanistei sto browser.*/
[ h1('O kanonas prostethike epitixos') ] ).

:- http_handler('/selection23', selection23, []).  %dilosi tou handler tis selidas (selection23)

/*To sigkekrimeno katigorima tropopoiei enan kanona stin BG. Kaleitai stin triti epilogi tou defterevontos menou.*/
selection23(Request):-
member(method(post), Request), !, %elenxos an to method tou request einai post kai an exei pragmatopiithei
http_read_data(Request, Data, []), %diavasma dedomenwn apo to request kai kataxorisi tous sto Data
term_to_atom(Rid,Data.rid), /*metatrepei to string Data.rid se atom, oste na afairethoun ta ''*/ 
term_to_atom(Olddata,Data.olddata), /*metatrepei to string Data.olddata se atom, oste na afairethoun ta ''*/
term_to_atom(Newdata,Data.newdata), /*metatrepei to string Data.newdata se atom, oste na afairethoun ta ''*/
/*me to katigorima findall pernoume ola ta ID apo ola ta katigorimata apotelesma kai ta vazoume stin lista List*/
	clause(apotelesma(Rid,data('$VAR'(0),'$VAR'(1),'$VAR'(2),'$VAR'(3),'$VAR'(4),'$VAR'(5),'$VAR'(6),'$VAR'(7)),'$VAR'(8)),Body),
	tuple(Body,List), /*allazei tis () me [] oste na dimiourgisoume tin lista pou xriazomaste.*/
	member(Olddata,List), /*elegxoume an to dedomeno pou edose o xristis iparxei ston kanona me tin taftotita pou epelekse*/
	select(Olddata,List,Newdata,Newlist), /*dimiourgei tin kainourgia lista Newlist vazontas ton dedomeno Newdata stin katallili thesi me vasi ta palia dedomena*/
	untuple(Newlist,Newlist1), /*allazei tis [] me () oste na xrisimopoiisoume tin Newlist1 sto tropopoiimeno katigorima*/
	retractall(apotelesma(Rid,_,_)), /*diagrafei to katigorima me tin taftotita pou dosame kai to antikathista me to neo, me tin entoli assertz stin kato grammi*/
	assertz(apotelesma(Rid,data('$VAR'(0),'$VAR'(1),'$VAR'(2),'$VAR'(3),'$VAR'(4),'$VAR'(5),'$VAR'(6),'$VAR'(7)),'$VAR'(8)):-Newlist1),
reply_html_page( %dimiourgia html selidas
title('Rule added'),  %titlos selidas
/*Parakato exoume tin forma tou html pou tha emfanistei sto browser.*/
[ h1('O kanonas prostethike epitixos') ] ).



:- http_handler('/selection24', selection24, []).  %dilosi tou handler tis selidas (selection24)

/*To sigkekrimeno katigorima tropopoiei enan kanona stin BG. Kaleitai stin triti epilogi tou defterevontos menou.*/
selection24(Request):-
member(method(post), Request), !, %elenxos an to method tou request einai post kai an exei pragmatopiithei
http_read_data(Request, Data, []), %diavasma dedomenwn apo to request kai kataxorisi tous sto Data
tell(Data.path),
listing(apotelesma/3),
told,
consult(Data.path),
reply_html_page( %dimiourgia html selidas
title('Epilogi 4'),  %titlos selidas
[ h1('Egine apothikefsi tis BG.')]). %to minima pou emfanizetai ston xristi meta tin apothikafsi tou arxeiou.