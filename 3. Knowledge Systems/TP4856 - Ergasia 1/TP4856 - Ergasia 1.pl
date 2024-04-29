/* IF-THEN KANONES

if (Pososto_koresmou = megalitero ; Pososto_koresmou = iso) and
then Answer = "Kanena provlima anoksias";

if Pososto_koresmou = mikrotero and
Iparksi_nitrikon_alaton = nai
then Answer = "Sovaro provlima anoksias";

if Pososto_koresmou = mikrotero and
Iparksi_nitrikon_alaton = oxi
then Answer = "Poli sovaro provlima anoksias";

if Pososto_koresmou = oxi and
Iparksi_kokkinon_oligochaetes = oxi and
(Iparksi_izimaton = mavra or Iparksi_izimaton = skoura) and 
Iparksi_idrothiou = nai
then Answer = "Poli sovaro provlima anoksias";

if Pososto_koresmou = oxi and
Iparksi_kokkinon_oligochaetes = oxi and
(Iparksi_izimaton = mavra or Iparksi_izimaton = skoura) and 
Iparksi_idrothiou = oxi and
Iparksi_methaniou = nai
then Answer = "Poli sovaro provlima anoksias";

if Pososto_koresmou = oxi and
Iparksi_kokkinon_oligochaetes = oxi and
(Iparksi_izimaton = mavra or Iparksi_izimaton = skoura) and 
Iparksi_idrothiou = oxi and
Iparksi_methaniou = oxi
then Answer = "Sovaro provlima anoksias";

if Pososto_koresmou = oxi and
Iparksi_kokkinon_oligochaetes = oxi and
Iparksi_izimaton = anoikta and 
(Tipos_ipostromatos = mesaio or Tipos_ipostromatos = megalo)
then Answer = "Kanena provlima anoksias";

if Pososto_koresmou = oxi and
Iparksi_kokkinon_oligochaetes = oxi and
Iparksi_izimaton = anoikta and 
Tipos_ipostromatos = kanoniko and
Asximi_mirodia_nerou = oxi
then Answer = "Kanena provlima anoksias";

if Pososto_koresmou = oxi and
Iparksi_kokkinon_oligochaetes = oxi and
Iparksi_izimaton = anoikta and 
Tipos_ipostromatos = kanoniko and
Asximi_mirodia_nerou = nai
then Answer = "Metria anoksia";

if Pososto_koresmou = oxi and
Iparksi_kokkinon_oligochaetes = liga
then Answer = "Poli sovaro provlima anoksias";

if Pososto_koresmou = oxi and
Iparksi_kokkinon_oligochaetes = arketa
then Answer = "Metria anoksia";
*/

apotelesma(data(Pososto_koresmou,_,_,_,_,_,_,_),Answer):-
(Pososto_koresmou = megalitero ; Pososto_koresmou = iso),
Answer = "Kanena provlima anoksias".

apotelesma(data(Pososto_koresmou,Iparksi_nitrikon_alaton,_,_,_,_,_,_),Answer):-
Pososto_koresmou = mikrotero,
Iparksi_nitrikon_alaton = nai,
Answer = "Sovaro provlima anoksias".

apotelesma(data(Pososto_koresmou,Iparksi_nitrikon_alaton,_,_,_,_,_,_),Answer):-
Pososto_koresmou = mikrotero,
Iparksi_nitrikon_alaton = oxi,
Answer = "Poli sovaro provlima anoksias".

apotelesma(data(Pososto_koresmou,_,Iparksi_kokkinon_oligochaetes,Iparksi_izimaton,Iparksi_idrothiou,_,_,_),Answer):-
Pososto_koresmou = oxi,
Iparksi_kokkinon_oligochaetes = oxi,
(Iparksi_izimaton = mavra ; Iparksi_izimaton = skoura), 
Iparksi_idrothiou = nai,
Answer = "Poli sovaro provlima anoksias".

apotelesma(data(Pososto_koresmou,_,Iparksi_kokkinon_oligochaetes,Iparksi_izimaton,Iparksi_idrothiou,Iparksi_methaniou,_,_),Answer):-
Pososto_koresmou = oxi,
Iparksi_kokkinon_oligochaetes = oxi,
(Iparksi_izimaton = mavra ; Iparksi_izimaton = skoura),
Iparksi_idrothiou = oxi,
Iparksi_methaniou = nai,
Answer = "Poli sovaro provlima anoksias".

apotelesma(data(Pososto_koresmou,_,Iparksi_kokkinon_oligochaetes,Iparksi_izimaton,Iparksi_idrothiou,Iparksi_methaniou,_,_),Answer):-
Pososto_koresmou = oxi,
Iparksi_kokkinon_oligochaetes = oxi,
(Iparksi_izimaton = mavra ; Iparksi_izimaton = skoura),
Iparksi_idrothiou = oxi,
Iparksi_methaniou = oxi,
Answer = "Sovaro provlima anoksias".

apotelesma(data(Pososto_koresmou,_,Iparksi_kokkinon_oligochaetes,Iparksi_izimaton,_,_,Tipos_ipostromatos,_),Answer):-
Pososto_koresmou = oxi,
Iparksi_kokkinon_oligochaetes = oxi,
Iparksi_izimaton = anoikta,
(Tipos_ipostromatos = mesaio ; Tipos_ipostromatos = megalo),
Answer = "Kanena provlima anoksias".

apotelesma(data(Pososto_koresmou,_,Iparksi_kokkinon_oligochaetes,Iparksi_izimaton,_,_,Tipos_ipostromatos,Asximi_mirodia_nerou),Answer):-
Pososto_koresmou = oxi,
Iparksi_kokkinon_oligochaetes = oxi,
Iparksi_izimaton = anoikta,
Tipos_ipostromatos = kanoniko,
Asximi_mirodia_nerou = oxi,
Answer = "Kanena provlima anoksias".

apotelesma(data(Pososto_koresmou,_,Iparksi_kokkinon_oligochaetes,Iparksi_izimaton,_,_,Tipos_ipostromatos,Asximi_mirodia_nerou),Answer):-
Pososto_koresmou = oxi,
Iparksi_kokkinon_oligochaetes = oxi,
Iparksi_izimaton = anoikta,
Tipos_ipostromatos = kanoniko,
Asximi_mirodia_nerou = nai,
Answer = "Metria anoksia".

apotelesma(data(Pososto_koresmou,_,Iparksi_kokkinon_oligochaetes,_,_,_,_,_),Answer):-
Pososto_koresmou = oxi,
Iparksi_kokkinon_oligochaetes = liga,
Answer = "Poli sovaro provlima anoksias".

apotelesma(data(Pososto_koresmou,_,Iparksi_kokkinon_oligochaetes,_,_,_,_,_),Answer):-
Pososto_koresmou = oxi,
Iparksi_kokkinon_oligochaetes = arketa,
Answer = "Metria anoksia".

anoxia(Answer):-
	write('Iparxei timi gia ton koresmo se dialimeno oksigono?'),nl,
	write('An nai, tote grapse an to pososto einai "megalitero", "iso", i "mikrotero" apo 20%.'),nl,
	write('An den iparxei, tote grapse "oxi".'),nl,
	read(Pososto_koresmou),
	anoxia1(Pososto_koresmou,Answer).
	
	anoxia1(Pososto_koresmou,Answer):-
	apotelesma(data(Pososto_koresmou,-,-,-,-,-,-,-),Answer).
	
	anoxia1(Pososto_koresmou,Answer):-
	Pososto_koresmou=mikrotero,
	write('Iparksi nitrikon alaton? (nai/oxi)'),nl,
	read(Iparksi_nitrikon_alaton),
	apotelesma(data(Pososto_koresmou,Iparksi_nitrikon_alaton,-,-,-,-,-,-),Answer).
	
	anoxia1(Pososto_koresmou,Answer):-
	Pososto_koresmou=oxi,
	write('Iparksi kokkinon oligochaetes? (arketa/liga/oxi)'),nl,
	read(Iparksi_kokkinon_oligochaetes),
	anoxia2(Pososto_koresmou,Iparksi_kokkinon_oligochaetes,Answer).
	
	anoxia2(Pososto_koresmou,Iparksi_kokkinon_oligochaetes,Answer):-
	apotelesma(data(Pososto_koresmou,-,Iparksi_kokkinon_oligochaetes,-,-,-,-,-),Answer).
	
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
	apotelesma(data(Pososto_koresmou,-,Iparksi_kokkinon_oligochaetes,Iparksi_izimaton,Iparksi_idrothiou,-,-,-),Answer).
	
	anoxia4(Pososto_koresmou,Iparksi_kokkinon_oligochaetes,Iparksi_izimaton,Iparksi_idrothiou,Answer):-
	Iparksi_idrothiou=oxi,
	write('Iparksi methaniou? (nai/oxi)'),nl,
	read(Iparksi_methaniou),
	apotelesma(data(Pososto_koresmou,-,Iparksi_kokkinon_oligochaetes,Iparksi_izimaton,Iparksi_idrothiou,Iparksi_methaniou,-,-),Answer).

	
	anoxia5(Pososto_koresmou,Iparksi_kokkinon_oligochaetes,Iparksi_izimaton,Tipos_ipostromatos,Answer):-
	apotelesma(data(Pososto_koresmou,-,Iparksi_kokkinon_oligochaetes,Iparksi_izimaton,-,-,Tipos_ipostromatos,-),Answer).
	
	anoxia5(Pososto_koresmou,Iparksi_kokkinon_oligochaetes,Iparksi_izimaton,Tipos_ipostromatos,Answer):-
	Tipos_ipostromatos=kanoniko,
	write('To nero mirizei asxima? (nai/oxi)'),nl,
	read(Asximi_mirodia_nerou),
	apotelesma(data(Pososto_koresmou,-,Iparksi_kokkinon_oligochaetes,Iparksi_izimaton,-,-,Tipos_ipostromatos,Asximi_mirodia_nerou),Answer).
		
