:- dynamic apotelesma/3.

apotelesma(rid1, data(A, _, _, _, _, _, _, _), B) :-
    A='>=20',
    B="Kanena provlima anoksias".
apotelesma(rid2, data(A, B, _, _, _, _, _, _), C) :-
    A='<20',
    B=nai,
    C="Sovaro provlima anoksias".
apotelesma(rid3, data(A, B, _, _, _, _, _, _), C) :-
    A='<20',
    B=oxi,
    C="Poli sovaro provlima anoksias".
apotelesma(rid4, data(A, _, B, C, D, _, _, _), E) :-
    A=oxi,
    B=oxi,
    (   C=mavra
    ;   C=skoura
    ),
    D=nai,
    E="Poli sovaro provlima anoksias".
apotelesma(rid5, data(A, _, B, C, D, E, _, _), F) :-
    A=oxi,
    B=oxi,
    (   C=mavra
    ;   C=skoura
    ),
    D=oxi,
    E=nai,
    F="Poli sovaro provlima anoksias".
apotelesma(rid6, data(A, _, B, C, D, E, _, _), F) :-
    A=oxi,
    B=oxi,
    (   C=mavra
    ;   C=skoura
    ),
    D=oxi,
    E=oxi,
    F="Sovaro provlima anoksias".
apotelesma(rid7, data(A, _, B, C, _, _, D, _), E) :-
    A=oxi,
    B=oxi,
    C=anoikta,
    (   D=mesaio
    ;   D=megalo
    ),
    E="Kanena provlima anoksias".
apotelesma(rid8, data(A, _, B, C, _, _, D, E), F) :-
    A=oxi,
    B=oxi,
    C=anoikta,
    D=kanoniko,
    E=oxi,
    F="Kanena provlima anoksias".
apotelesma(rid9, data(A, _, B, C, _, _, D, E), F) :-
    A=oxi,
    B=oxi,
    C=anoikta,
    D=kanoniko,
    E=nai,
    F="Metria anoksia".
apotelesma(rid10, data(A, _, B, _, _, _, _, _), C) :-
    A=oxi,
    B=liga,
    C="Poli sovaro provlima anoksias".
apotelesma(rid11, data(A, _, B, _, _, _, _, _), C) :-
    A=oxi,
    B=arketa,
    C="Metria anoksia".

