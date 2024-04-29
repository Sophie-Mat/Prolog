/*
Sofia Matthaiaki - TP4856

Simeiosi gia tin epilogi 1 sto kirios menou:
Den eimai sigouri an thelate na kratisoume tin domi tou programmatos apo tin askisi 1 oso anafora ta 
dedomena pou dinei o xristis. Den allaksa kati, o xristis dinei dialogika ta dedomena sto programma,
den dinei kapoion sintheto oro, oste na min xreiastei na gemizoume kathe fora ton sintheto oro me
axrista dedomena. Etsi to programma stamataei na zitaei dedomena molis apoktisei ta aparaitita gia 
tin eksagogi apotelesmatos.

Gia na treksei to programma:
?-ks.

    - - - STOXOI - - -
!!Gia efkolia akolouthiste tis ipodeikseis kathos trexei to programma, opou iparxoun, kanontas copy-paste.

1. Gia diagrafi tou kanona me tin taftotita rid3:
Epilegoume apo to kirios menou tin epiilogi 2 kai stin sinexeia tin epilogi 1 apo to defterevon menou.
Meta dinoume tin taftotita tou kanona pou theloume na diagrafei (rid3).

2. Gia tropopoiisi tou kanona rid1:
(O Koresmos sto rid1 se emena exei timi '>=20' ara oi ipodikseis einai gia na allaxtei to sigkekrimeno.
Trexei paromoia gia ola).
Epilegoume apo to kirios menou tin epiilogi 2 kai stin sinexeia tin epilogi 3 apo to defterevon menou.
Akolouthiste tis ipodikseis kathos trexei to programma.

3. Gia prosthiki kanona stin BG xoris na dosoume emeis tin taftotita:
Epilegoume apo to kirios menou tin epiilogi 2 kai stin sinexeia tin epilogi 2 apo to defterevon menou.
Meta grafoume ta dedomena se morfi:
data('$VAR'(10),'$VAR'(11),'$VAR'(12),'$VAR'(13),'$VAR'(14),'$VAR'(15),'$VAR'(16),'$VAR'(17)).

Paradeigma pou zititai: (Vazoume _ se opooia metavliti den xreiazomaste gia na apofigoume ta singleton variable warnings.
data('$VAR'(10),_,_,_,_,_,_,_).
Dinoume tis proipothesis:
('$VAR'(10)='>=20' ; '$VAR'(10)='<25').
Telos grafoume tin apantisi pou tha dinei to programma otan exoume ta sigkekrimena dedomena.
'Moderate Problem Anoxia'.




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


/*Arxi tou programmatos, ekxorisi tou path gia to arxeio KB.pl*/
ks:-
	write("Dose to path gia to arxeio KB.pl se morfi 'C:/.../...'"),nl,
	read(Path),nl,
	consult(Path),
	kmenu(Path).
	
/*Kirios Menou*/
kmenu(Path):-
	write('Epelekse enan arithmo apo tous parakato:'),nl,
	write('Dose 1 gia diagnosi provlimaton apo to perivallontiko sistima gnosis.'),nl,
	write('Dose 2 gia enimerosi tis BG.'),nl,
	write('Dose 3 gia eksodo.'),nl,
	read(Number),nl,
	menu(Number,Path).
	
/*
-- Epilogi 1 - Kirios Menou -- 

Trexei to programma me tin vasi gnosis pou dimiourgisa stin askisi 1.
*/
menu(1,Path):-
	anoxia(Answer),
	write(Answer),nl,nl,
	kmenu(Path).

/*
-- Epilogi 2 - Kirios Menou -- 

Emfanizei to defterevon menou
*/
menu(2,Path):-
	write('Epelekse enan arithmo apo tous parakato:'),nl,
	write('Dose 1 gia diagrafi kanona.'),nl,
	write('Dose 2 gia prosthiki neou kanona.'),nl,
	write('Dose 3 gia tropopoiisi iparxontos kanona.'),nl,
	write('Dose 4 gia apothikefsi tis BG kai eksodo apo tin diadikasia enimerosis tis BG.'),nl,
	read(Number1),nl,
	menu1(Number1,Path).

/*
-- Epilogi 3 - Kirios Menou -- 

Termatizei to programma
*/
menu(3,_):-
	write('--Eksodos--'),nl,
	abort.

/*
-- Lanthasmeni Epilogi -- 

Emfanizei ksana to kirios menou se periptosi lanthasmenis epilogis
*/
menu(_,Path):-
	write('Lanthasmeni epilogi, epelekse mia apo tis 3 epiloges'),nl,nl,
	kmenu(Path).
	
	
/*
-- Epilogi 1 - Menou apo Epilogi 2 --

Diagrafi kanona apo tin basi gnosis (KB.pl)
*/
menu1(1,Path):-
	write('Dose tin taftotita tou kanona pou epithimeis na diagrafei (Paradeigma: rid3) :'),nl,
	read(Id),
	retractall(apotelesma(Id,_,_)), /*me tin sigkekrimeni entoli diagrafetai to katigorima me to id pou dothike stin pano grammi*/
	write('Egine epitixis diagrafi tou kanona'),nl,nl,
	menu(2,Path).
	
/*
-- Epilogi 2 - Menou apo Epilogi 2 -- 

Prosthetei neo kanona stin vasi gnosis (KB.pl)
*/
		  
menu1(2,Path):-
	write('Dose ta aparaitita dedomena.'),nl,nl,
	write('Ipodeiksi:'),nl,
	write("data('$VAR'(10),_,_,_,_,_,_,_)."),nl,nl,
	read(Data),nl,
	write('Dose tis proipothesis tou kanona'),nl,nl,
	write('Ipodeiksi:'),nl,
	write("('$VAR'(10)='>=20' ; '$VAR'(10)='<25')."),nl,nl,
	read(RuleCondition),nl,
	write('Dose to apotelesma pou tha emfanizetai me afton ton kanona'),nl,nl,
	write('Ipodeiksi:'),nl,
	write("'Moderate Problem Anoxia'."),nl,nl,
	read(RuleAnswer),nl,
	/*me to katigorima findall pernoume ola ta ID apo ola ta katigorimata apotelesma kai ta vazoume stin lista List*/
	findall(Id,clause(apotelesma(Id,data('$VAR'(0),'$VAR'(1),'$VAR'(2),'$VAR'(3),'$VAR'(4),'$VAR'(5),'$VAR'(6),'$VAR'(7)),'$VAR'(8)),_),List),
	trim(List,List2), /*Apo tin lista pou dimiourgisame stin proisoumeni grammmi kratame mono tous arithmous stin lista List2*/
	findMax(List2,Max), /*Vriskoume ton megalitero apo tous arithmous stin List2*/
	NewMax is Max + 1, /*I taftotita tou neou katigorimatos tha exei arithmo megalitero apo to proigoumeno katigorima kata mia monada.*/
	string_concat(rid,NewMax,IdString), /*Ftiaxnoume tin taftotita tou neou katigorimatos enonontas to string 'rid' me ton arithmo NewMax*/
	string_to_atom(IdString,Id), /*metatrepei to string IdString se atom*/
	assertz((apotelesma(Id, Data, Answer):- RuleCondition,Answer=RuleAnswer)), /*Prosthetei ton neo kanona stin vasi gnosis*/
	write('Egine epitixis dimiourgia tou kanona me tin taftotita:'),
	write(Id),nl,nl,
	menu(2,Path).
	
/* 
-- Epilogi 3 - Menou apo Epilogi 2 -- 

Tropopoiei kapoion kanona pou iparxei stin vasi gnosis me vasi to ID pou tha dosoume.
*/
menu1(3,Path):-
	write('Dose tin taftotita tou kanona pou epithimeis na tropopoiithei.'),nl,nl,
	write('Ipodeiksi:'),nl,
	write('rid1'),nl,nl,
	read(Id),nl,
	clause(apotelesma(Id,data('$VAR'(0),'$VAR'(1),'$VAR'(2),'$VAR'(3),'$VAR'(4),'$VAR'(5),'$VAR'(6),'$VAR'(7)),'$VAR'(8)),Body),
	tuple(Body,List), /*allazei tis () me [] oste na dimiourgisoume tin lista pou xriazomaste.*/
	write('Dose to dedomeno pou epithimeis na allakseis.'),nl,nl,
	write('Ipodeiksi:'),nl,
	write("'$VAR'(0) = '>=20'."),nl,nl,
	read(Olddata),nl,
	member(Olddata,List), /*elegxoume an to dedomeno pou edose o xristis iparxei ston kanona me tin taftotita pou epelekse*/
	write('Dose to neo dedomeno.'),nl,nl,
	write('Ipodeiksi:'),nl,
	write("'$VAR'(0) = '>= 25'."),nl,nl,
	read(Newdata),nl,
	select(Olddata,List,Newdata,Newlist), /*dimiourgei tin kainourgia lista Newlist vazontas ton dedomeno Newdata stin katallili thesi me vasi ta palia dedomena*/
	untuple(Newlist,Newlist1), /*allazei tis [] me () oste na xrisimopoiisoume tin Newlist1 sto tropopoiimeno katigorima*/
	retractall(apotelesma(Id,_,_)), /*diagrafei to katigorima me tin taftotita pou dosame kai to antikathista me to neo, me tin entoli assertz stin kato grammi*/
	assertz(apotelesma(Id,data('$VAR'(0),'$VAR'(1),'$VAR'(2),'$VAR'(3),'$VAR'(4),'$VAR'(5),'$VAR'(6),'$VAR'(7)),'$VAR'(8)):-Newlist1),
	write('Egine epitixis tropopoiisi tou kanona'),nl,nl,
	menu(2,Path).
	
/*
-- Epilogi 4 - Menou apo Epilogi 2 -- 

Apothikevei tin vasi gnosis sto arxeio KB.pl, bgainei apo to defterevon menou enimerosis kai emfanizei to kirios menou.
Episis kanei ksana consult to arxeio KB.pl oste na enimerothei to programma.
*/
menu1(4,Path):-
	tell(Path),
	listing(apotelesma/3),
	told,
	write('Egine apothikefsi tis BG.'),nl,
	consult(Path),
	write('Epistrofi sto kirios menou.'),nl,nl,
	kmenu(Path).
	
/* 
-- Lanthasmeni Epilogi - Menou apo Epilogi 2 -- 

Emfanizei minima lathous se periptosi lanthasmenis epilogis sto defterevon menou.
*/
menu1(_,Path):-
	write('Lanthasmeni epilogi, epelekse mia apo tis parakato epiloges'),nl,nl,
	menu(2,Path).
	
/* 

-- Parakato fainetai to sistima gnosis pou eftiaksa stin askisi 1 -- 

Exei diaforous elegxous pou tha mporousan na paralifthoun stin sigkekrimeni askisi alla tous afisa gia
na min xreiastei na dinoume axrista dedomena stin proti epilogi tou menou, gia tin diagnosi provlimaton.
*/
anoxia(Answer):-
	write('Iparxei timi gia ton koresmo se dialimeno oksigono?'),nl,
	write("An nai, tote dose tis epiloges '>=20' i '<20' gia to pososto."),nl,
	write("An den iparxei, tote grapse 'oxi'."),nl,
	read(Pososto_koresmou),
	anoxia1(Pososto_koresmou,Answer).
	
	anoxia1(Pososto_koresmou,Answer):-
	apotelesma(_,data(Pososto_koresmou,-,-,-,-,-,-,-),Answer).
	
	anoxia1(Pososto_koresmou,Answer):-
	Pososto_koresmou = '<20',
	write('Iparksi nitrikon alaton? (nai/oxi)'),nl,
	read(Iparksi_nitrikon_alaton),
	apotelesma(_,data(Pososto_koresmou,Iparksi_nitrikon_alaton,-,-,-,-,-,-),Answer).
	
	anoxia1(Pososto_koresmou,Answer):-
	Pososto_koresmou=oxi,
	write('Iparksi kokkinon oligochaetes? (arketa/liga/oxi)'),nl,
	read(Iparksi_kokkinon_oligochaetes),
	anoxia2(Pososto_koresmou,Iparksi_kokkinon_oligochaetes,Answer).
	
	anoxia2(Pososto_koresmou,Iparksi_kokkinon_oligochaetes,Answer):-
	apotelesma(_,data(Pososto_koresmou,-,Iparksi_kokkinon_oligochaetes,-,-,-,-,-),Answer).
	
	anoxia2(Pososto_koresmou,Iparksi_kokkinon_oligochaetes,Answer):-
	Iparksi_kokkinon_oligochaetes=oxi,
	write('Iparksi izimaton? (anoikta/mavra/skoura)'),nl,
	read(Iparksi_izimaton),
	anoxia3(Pososto_koresmou,Iparksi_kokkinon_oligochaetes,Iparksi_izimaton,Answer).
	
	anoxia3(Pososto_koresmou,Iparksi_kokkinon_oligochaetes,Iparksi_izimaton,Answer):-
	(Iparksi_izimaton=mavra ; Iparksi_izimaton = skoura),
	write('Iparksi idrothiou? (nai/oxi)'),nl,
	read(Iparksi_idrothiou),
	anoxia4(Pososto_koresmou,Iparksi_kokkinon_oligochaetes,Iparksi_izimaton,Iparksi_idrothiou,Answer).
	
	anoxia3(Pososto_koresmou,Iparksi_kokkinon_oligochaetes,Iparksi_izimaton,Answer):-
	Iparksi_izimaton=anoikta,
	write('Poios einai o tipos ipostromatos? (kanoniko/mesaio/megalo)'),nl,
	read(Tipos_ipostromatos),
	anoxia5(Pososto_koresmou,Iparksi_kokkinon_oligochaetes,Iparksi_izimaton,Tipos_ipostromatos,Answer).
	
	anoxia4(Pososto_koresmou,Iparksi_kokkinon_oligochaetes,Iparksi_izimaton,Iparksi_idrothiou,Answer):-
	apotelesma(_,data(Pososto_koresmou,-,Iparksi_kokkinon_oligochaetes,Iparksi_izimaton,Iparksi_idrothiou,-,-,-),Answer).
	
	anoxia4(Pososto_koresmou,Iparksi_kokkinon_oligochaetes,Iparksi_izimaton,Iparksi_idrothiou,Answer):-
	Iparksi_idrothiou=oxi,
	write('Iparksi methaniou? (nai/oxi)'),nl,
	read(Iparksi_methaniou),
	apotelesma(_,data(Pososto_koresmou,-,Iparksi_kokkinon_oligochaetes,Iparksi_izimaton,Iparksi_idrothiou,Iparksi_methaniou,-,-),Answer).

	
	anoxia5(Pososto_koresmou,Iparksi_kokkinon_oligochaetes,Iparksi_izimaton,Tipos_ipostromatos,Answer):-
	apotelesma(_,data(Pososto_koresmou,-,Iparksi_kokkinon_oligochaetes,Iparksi_izimaton,-,-,Tipos_ipostromatos,-),Answer).
	
	anoxia5(Pososto_koresmou,Iparksi_kokkinon_oligochaetes,Iparksi_izimaton,Tipos_ipostromatos,Answer):-
	Tipos_ipostromatos=kanoniko,
	write('To nero mirizei asxima? (nai/oxi)'),nl,
	read(Asximi_mirodia_nerou),
	apotelesma(_,data(Pososto_koresmou,-,Iparksi_kokkinon_oligochaetes,Iparksi_izimaton,-,-,Tipos_ipostromatos,Asximi_mirodia_nerou),Answer).

	