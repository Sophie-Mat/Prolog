sentence --> noun_phrase(Num), verb_phrase(Num).
noun_phrase(Num) --> det(Num), noun(Num).
verb_phrase(Num) --> verb(Num), noun_phrase(_Anything).
verb_phrase(Num) --> verb(Num).

det(singular) --> [a].
det(_Anything) --> [the]; [].
noun(singular) --> [dog]; [cat]; [boy]; [girl].
noun(plural) --> [dogs]; [cats]; [boys]; [girls].
verb(singular) --> [chases]; [sees]; [says]; [believes].
verb(plural) --> [chase]; [see]; [say]; [believe].


/*  STOXOI:
sentence([the,dog, chases,cats],[]). ----> yes
sentence([the,dog, chase, cats],[]). ----> no
sentence(S, []).
*/