sentence(S,A):- s(S,A).

s(InputPhrase,OutputPhrase):- np(InputPhrase,TempPhrase), vp(TempPhrase,OutputPhrase).
np(InputPhrase,OutputPhrase) :- det(InputPhrase,TempPhrase), n(TempPhrase,OutputPhrase).
vp(InputPhrase,OutputPhrase) :- v(InputPhrase,TempPhrase), np(TempPhrase,OutputPhrase).
vp(InputPhrase,OutputPhrase) :- v(InputPhrase,OutputPhrase).

det(InputPhrase,OutputPhrase) :- (InputPhrase=[a|OutputPhrase]; InputPhrase=[the|OutputPhrase]; InputPhrase=OutputPhrase).
n(InputPhrase,OutputPhrase) :- (InputPhrase=[dog|OutputPhrase]; InputPhrase=[cat|OutputPhrase]; InputPhrase=[boy|OutputPhrase]; InputPhrase=[girl|OutputPhrase]).
v(InputPhrase,OutputPhrase) :- (InputPhrase=[chased|OutputPhrase]; InputPhrase=[saw|OutputPhrase]; InputPhrase=[said|OutputPhrase]; InputPhrase=[believed|OutputPhrase]).

/*  STOXOI:
sentence([the, cat, saw, the, dog],[]). ----> yes
sentence([the, saw, cat, the, dog],[]). ----> no
sentence(S, []).
*/