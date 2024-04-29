sentence --> noun_phrase(Num), verb_phrase(Num).
noun_phrase(Num) --> det(Num), noun(Num).
verb_phrase(Num) --> verb(Num), noun_phrase(_Anything).
verb_phrase(Num) --> verb(Num).

det(singular) --> [a].
det(_Anything) --> [the]; [].
noun(singular) --> [Word], {n(Word)}.
noun(plural) --> [Word], {n(W), name(W,L1), append(L1,"s",L2), name(Word,L2)}.
verb(singular) --> [Word], {v(W), name(W,L1), append(L1,"s",L2), name(Word,L2)}.
verb(plural) --> [Word], {v(Word)}.

n(dog). n(cat). n(boy). n(girl).
v(chase). v(see). v(say). v(believe).


/*  STOXOI:
sentence([the,dog, chases,cats],[]). ----> yes
sentence([the,dog, chase, cats],[]). ----> no
*/