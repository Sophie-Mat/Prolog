
/*  ENDIKTIKOI STOXOI:
p([ο, πεισματάρης, μανάβης],[]). ----> yes
p([το, καρδιά],[]). ----> no
p([η, ωραία, καρδιά],[]). ----> yes
p([πεισματάρικων, παιδιών],[]). ----> yes
p([καλού, παιδιού],[]). ----> yes
p([πεισματάρες, θάλασσες],[]). ----> yes
p([πεισματάρηδες, θάλασσες],[]). ----> no
p([το, κύμα],[]). ----> yes
p([παιδιού],[]). ----> yes



ΟΔΗΓΙΕΣ:
Κάθε πτώση στο πρόγραμμα αναπαριστάται με έναν αριθμό όπως φαίνεται παρακάτω:
0-> Ονομαστική Ενικού
1-> Γενική Ενικού
2-> Αιτιατική Ενικού
3-> Κλιτική Ενικού
4-> Ονομαστική Πληθυντικού
5-> Γενική Πληθυντικού
6-> Αιτιατική Πληθυντικού
7-> Κλητική Πληθυντικού

Η αναγνώριση των σωστών ονοματικών φράσεων επιτυγχάνεται με τον συνδιασμό του γένους της κάθε λέξης (Gender) και του παραπάνω αριθμού (Num).
*/

p --> ουσιαστικό(_,_) ; 
(επίθετο(Gender,Num) , ουσιαστικό(Gender,Num)) ; 
(άρθρο(Gender,Num) , ουσιαστικό(Gender,Num));
(άρθρο(Gender,Num), επίθετο(Gender,Num), ουσιαστικό(Gender,Num)).

άρθρο(αρσενικό,0) --> [ένας] ; [ο].
άρθρο(θηλυκό,0) --> [μία] ; [η] ; [τη].
άρθρο(θηλυκό,4) --> [τις].
άρθρο(ουδέτερο,0) --> [ένα] ; [το] ; [στο] .

ουσιαστικό(Gender,Num) --> [Word],{check_noun(Word,Gender,Num)}.
επίθετο(Gender,Num) --> [Word],{check_adj(Word,Gender,Num)}.
	
check_noun(Thema,Gender,Num):-
	Katal = '-',
	((ουσιαστικό(_, Gender, _,[[Thema,_], [_,_]], _, [_,_], A6), κατάληξηΟυσ(A6, _, Enikos, _), nth0(Num,Enikos,Katal));
	(ουσιαστικό(_, Gender, _,[[_,Thema], [_,_]], _, [_,_], A6), κατάληξηΟυσ(A6, _, Enikos, _), nth0(Num,Enikos,Katal));
	(ουσιαστικό(_, Gender, _,[[_,_], [Thema,_]], _, [_,_], A6), κατάληξηΟυσ(A6, _, _, Plith), nth0(Num1,Plith,Katal), Num is Num1+4);
	(ουσιαστικό(_, Gender, _,[[_,_], [_,Thema]], _, [_,_], A6), κατάληξηΟυσ(A6, _, _, Plith), nth0(Num1,Plith,Katal), Num is Num1+4)).

check_noun(Noun,Gender,Num):-
	atom_codes(Noun,Ncodes),
	append(Lthema,[X1], Ncodes),
	Lkatal = [X1],
	atom_codes(Thema, Lthema),
	atom_codes(Katal,Lkatal),
	((ουσιαστικό(_, Gender, _,[[Thema,_], [_,_]], _, [_,_], A6), κατάληξηΟυσ(A6, _, Enikos, _), nth0(Num,Enikos,Katal));
	(ουσιαστικό(_, Gender, _,[[_,Thema], [_,_]], _, [_,_], A6), κατάληξηΟυσ(A6, _, Enikos, _), nth0(Num,Enikos,Katal));
	(ουσιαστικό(_, Gender, _,[[_,_], [Thema,_]], _, [_,_], A6), κατάληξηΟυσ(A6, _, _, Plith), nth0(Num1,Plith,Katal), Num is Num1+4);
	(ουσιαστικό(_, Gender, _,[[_,_], [_,Thema]], _, [_,_], A6), κατάληξηΟυσ(A6, _, _, Plith), nth0(Num1,Plith,Katal), Num is Num1+4)).
	
check_noun(Noun,Gender,Num):-
	atom_codes(Noun,Ncodes),
	append(Lthema,[X1,X2], Ncodes),
	Lkatal = [X1,X2],
	atom_codes(Thema, Lthema),
	atom_codes(Katal,Lkatal),
	((ουσιαστικό(_, Gender, _,[[Thema,_], [_,_]], _, [_,_], A6), κατάληξηΟυσ(A6, _, Enikos, _), nth0(Num,Enikos,Katal));
	(ουσιαστικό(_, Gender, _,[[_,Thema], [_,_]], _, [_,_], A6), κατάληξηΟυσ(A6, _, Enikos, _), nth0(Num,Enikos,Katal));
	(ουσιαστικό(_, Gender, _,[[_,_], [Thema,_]], _, [_,_], A6), κατάληξηΟυσ(A6, _, _, Plith), nth0(Num1,Plith,Katal), Num is Num1+4);
	(ουσιαστικό(_, Gender, _,[[_,_], [_,Thema]], _, [_,_], A6), κατάληξηΟυσ(A6, _, _, Plith), nth0(Num1,Plith,Katal), Num is Num1+4)).
	
check_noun(Noun,Gender,Num):-
	atom_codes(Noun,Ncodes),
	append(Lthema,[X1,X2,X3], Ncodes),
	Lkatal = [X1,X2,X3],
	atom_codes(Thema, Lthema),
	atom_codes(Katal,Lkatal),
	((ουσιαστικό(_, Gender, _,[[Thema,_], [_,_]], _, [_,_], A6), κατάληξηΟυσ(A6, _, Enikos, _), nth0(Num,Enikos,Katal));
	(ουσιαστικό(_, Gender, _,[[_,Thema], [_,_]], _, [_,_], A6), κατάληξηΟυσ(A6, _, Enikos, _), nth0(Num,Enikos,Katal));
	(ουσιαστικό(_, Gender, _,[[_,_], [Thema,_]], _, [_,_], A6), κατάληξηΟυσ(A6, _, _, Plith), nth0(Num1,Plith,Katal), Num is Num1+4);
	(ουσιαστικό(_, Gender, _,[[_,_], [_,Thema]], _, [_,_], A6), κατάληξηΟυσ(A6, _, _, Plith), nth0(Num1,Plith,Katal), Num is Num1+4)).
	
check_adj(Adj,Gender,Num):-
	atom_codes(Adj,Acodes),
	append(Lthema,[X1], Acodes),
	Lkatal = [X1],
	atom_codes(Thema, Lthema),
	atom_codes(Katal,Lkatal),
	επίθετο(_, _, Thema, [_,_,_], A6),
	καταλήξειςΚατηγΕπιθ(A6, [ [Male1,Male2], [Female1,Female2], [Neutral1,Neutral2] ]),
	((nth0(Num,Male1,Katal),Gender = 'αρσενικό');
	(nth0(Num1,Male2,Katal),Gender = 'αρσενικό', Num is Num1+4);
	(nth0(Num,Female1,Katal),Gender = 'θηλυκό');
	(nth0(Num1,Female2,Katal),Gender = 'θηλυκό', Num is Num1+4);
	(nth0(Num,Neutral1,Katal),Gender = 'ουδέτερο');
	(nth0(Num1,Neutral2,Katal),Gender = 'ουδέτερο', Num is Num1+4)).

check_adj(Adj,Gender,Num):-
	atom_codes(Adj,Acodes),
	append(Lthema,[X1,X2], Acodes),
	Lkatal = [X1,X2],
	atom_codes(Thema, Lthema),
	atom_codes(Katal,Lkatal),
	επίθετο(_, _, Thema, [_,_,_], A6),
	καταλήξειςΚατηγΕπιθ(A6, [ [Male1,Male2], [Female1,Female2], [Neutral1,Neutral2] ]),
	((nth0(Num,Male1,Katal),Gender = 'αρσενικό');
	(nth0(Num1,Male2,Katal),Gender = 'αρσενικό', Num is Num1+4);
	(nth0(Num,Female1,Katal),Gender = 'θηλυκό');
	(nth0(Num1,Female2,Katal),Gender = 'θηλυκό', Num is Num1+4);
	(nth0(Num,Neutral1,Katal),Gender = 'ουδέτερο');
	(nth0(Num1,Neutral2,Katal),Gender = 'ουδέτερο', Num is Num1+4)).
	
check_adj(Adj,Gender,Num):-
	atom_codes(Adj,Acodes),
	append(Lthema,[X1,X2,X3], Acodes),
	Lkatal = [X1,X2,X3],
	atom_codes(Thema, Lthema),
	atom_codes(Katal,Lkatal),
	επίθετο(_, _, Thema, [_,_,_], A6),
	καταλήξειςΚατηγΕπιθ(A6, [ [Male1,Male2], [Female1,Female2], [Neutral1,Neutral2] ]),
	((nth0(Num,Male1,Katal),Gender = 'αρσενικό');
	(nth0(Num1,Male2,Katal),Gender = 'αρσενικό', Num is Num1+4);
	(nth0(Num,Female1,Katal),Gender = 'θηλυκό');
	(nth0(Num1,Female2,Katal),Gender = 'θηλυκό', Num is Num1+4);
	(nth0(Num,Neutral1,Katal),Gender = 'ουδέτερο');
	(nth0(Num1,Neutral2,Katal),Gender = 'ουδέτερο', Num is Num1+4)).
	
check_adj(Adj,Gender,Num):-
	atom_codes(Adj,Acodes),
	append(Lthema,[X1,X2,X3,X4], Acodes),
	Lkatal = [X1,X2,X3,X4],
	atom_codes(Thema, Lthema),
	atom_codes(Katal,Lkatal),
	επίθετο(_, _, Thema, [_,_,_], A6),
	καταλήξειςΚατηγΕπιθ(A6, [ [Male1,Male2], [Female1,Female2], [Neutral1,Neutral2] ]),
	((nth0(Num,Male1,Katal),Gender = 'αρσενικό');
	(nth0(Num1,Male2,Katal),Gender = 'αρσενικό', Num is Num1+4);
	(nth0(Num,Female1,Katal),Gender = 'θηλυκό');
	(nth0(Num1,Female2,Katal),Gender = 'θηλυκό', Num is Num1+4);
	(nth0(Num,Neutral1,Katal),Gender = 'ουδέτερο');
	(nth0(Num1,Neutral2,Katal),Gender = 'ουδέτερο', Num is Num1+4)).
	
/* ΛΕΞΙΚΟ */

ουσιαστικό(κοινό,αρσενικό,ισοΣύλλαβο, [[ναύτ,ναύτ], [ναύτ,ναυτ]],[παροξύτονη,παροξύτονη], [ης,ες], ουσΑρσ01).
ουσιαστικό(κοινό,αρσενικό,ισοΣύλλαβο, [[νικητ,νικητ], [νικητ,νικητ]], [οξύτονη, οξύτονη], [ής,ές], ουσΑρσ02).
ουσιαστικό(κοινό,αρσενικό,ανισοΣύλλαβο, [[μανάβ,μανάβ], [μανάβηδ,μανάβηδ]], [παροξύτονη,προπαροξύτονη], [ης,ες],ουσΑρσ03).

ουσιαστικό(κοινό,θηλυκό,ισοΣύλλαβο, [[καρδι,καρδι],[καρδι,καρδι]], [οξύτονη, οξύτονη], [α,ές], ουσΘηλ01).
ουσιαστικό(κοινό,θηλυκό,ισοΣύλλαβο, [[θάλλασσ,θάλασσ], [θάλασσ,θαλασσ]], [προπαροξύτονη,προπαροξύτονη], [α,ες], ουσΘηλ02).

ουσιαστικό(κοινό,ουδέτερο, ισοΣύλλαβο, [[παιδ,παιδ],[παιδ,παιδ]], [οξύτονη,οξύτονη], [ί, ά], ουσΟυδ01).
ουσιαστικό(κοινό,ουδέτερο, ανισοΣύλλαβο, [[κύμα, κύματ], [κύματ,κυμάτ]], [παροξύτονη,προπαροξύτονη], [α,α], ουσΟυδ02).
ουσιαστικό(κοινό,ουδέτερο, ανισοΣύλλαβο, [[όνομα,ονόματ], [ονόματ,ονομάτ]], [προπαροξύτονη,προπαροξύτονη], [α,α], ουσΟυδ02).


κατάληξηΟυσ(ουσΑρσ01, αρσενικα-ισοσύλαβα-σε-ης, [ης,η,η,η],[ες,ών,ες,ες]).
κατάληξηΟυσ(ουσΑρσ02, αρσενικα-ισοσύλαβα-σε-ής, [ής,ή,ή,ή],[ές,ών,ές,ές]).
κατάληξηΟυσ(ουσΑρσ03, αρσενικα-ανισοσύλαβα-σε-ης, [ης,η,η,η],[ες,ων,ες,ες]).
κατάληξηΟυσ(ουσΘηλ01, θηλυκά-ισοσύλαβα-σε-ά, [ά,άς,ά,ά],[ές,ών,ές,ές]).
κατάληξηΟυσ(ουσΘηλ02, θηλυκά-ισοσύλαβα-σε-α, [α,ας,α,α],[ες,ών,ες,ες]).
κατάληξηΟυσ(ουσΟυδ01, ουδέτερο-ισοσύλαβα-σε-ί, [ί,ιού,ί,ί],[ιά,ιών,ιά,ιά]).
κατάληξηΟυσ(ουσΟυδ02, ουδέτερο-ανισοσύλαβα-σε-α, [-,ος,-,-],[α,ων,α,α]).


επίθετο(ισοσύλλαβο, οξύτονο, καλ, [ός,ή,ό], κατηγΚλίσηςΕπιθέτου01).
επίθετο(ισοσύλλαβο, παροξύτονο, ωραί, [ος,α,ο], κατηγΚλίσηςΕπιθέτου02).
επίθετο(ανισοσύλλαβο, παροξύτονο, πεισματάρ, [ης,α,ικο], κατηγΚλίσηςΕπιθέτου03).


καταλήξειςΚατηγΕπιθ(κατηγΚλίσηςΕπιθέτου01, [ [[ός,ού,ό,έ ], [οί,ών,ούς,οί]], [[ή,ής,ή,ή], [ές,ών,ές,ές]], [[ό,ού,ό,ό],[ά,ών,ά,ά]] ]).
καταλήξειςΚατηγΕπιθ(κατηγΚλίσηςΕπιθέτου02, [ [[ος,ου,ο,ε],[οι,ων,ους,οι]],[[α,ας,α,α],[ες,ων,ες,ες]], [[ο,ου,ο,ο],[α,ων,α,α]] ]).
καταλήξειςΚατηγΕπιθ(κατηγΚλίσηςΕπιθέτου03, [ [[ης,η,η,η],[ηδες,ηδων,ηδες,ηδες]], [[α,ας,α,α],[ες,_,ες,ες]], [[ικο,ικου,ικο,ικο],[ικα,ικων,ικα,ικα]]]).
