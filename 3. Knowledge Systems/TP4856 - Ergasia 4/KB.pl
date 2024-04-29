/*

Sofia Matthaiaki - TP4856

Ta 2 katigorimata rule_gripis/1 kai rule_pneumonias/1 einai oi kanones K1 kai K2 antistoixa, efoson exei dothei o piretos os simptoma.
O piretos didetai os simptoma kathe fora opote ta xreiazomaste se kathe ena apo ta rules/4.
Ta rules/4 einai 8, osa kai oi periptoseis o astheneis na exei i oxi, vicha, efidrosi, aimoptisi 
((3^2)-1 = 8 pithanotites, o piretos iparxei kathe fora os simptoma).
Kathe ena apo ta rules/4 ipologizei olous tous 6 kanones pou exoume stin erotisi kai analoga me to an exei dothei i oxi to simptoma
ipologizei to apotelesma.

*/


rule_gripis(P):-
  Prior = 0.5,
  LS = 1.8,
  O_gripis is Prior / (1 - Prior),
  O_h_gripis is LS * O_gripis,
  P is (O_h_gripis) / (1 + O_h_gripis).

rule_pneumonias(P):-
  Prior = 0.5,
  LS = 1.2,
  O_pneumonias is Prior / (1 - Prior),
  O_h_pneumonias is LS * O_pneumonias,
  P is (O_h_pneumonias) / (1 + O_h_pneumonias).

rules(1,values(yes,no,no,no),Res1,Res2):-
  rule_gripis(Prior),
  A is Prior,
  rule_pneumonias(Prior2),
  B is Prior2,
  LS = 2.5,
  O_gripis is A / (1 - A),
  O_h_gripis is LS * O_gripis,
  C is (O_h_gripis) / (1 + O_h_gripis),
  LN = 0.6,
  O_pneumonias is B / (1 - B),
  O_h_pneumonias is LN * O_pneumonias,
  D is (O_h_pneumonias) / (1 + O_h_pneumonias),
  LN1 = 0.8,
  O_gripis1 is C / (1 - C),
  O_h_gripis1 is LN1 * O_gripis1,
  Res1 is (O_h_gripis1) / (1 + O_h_gripis1),
  LN2 = 0.6,
  O_pneumonias1 is D / (1 - D),
  O_h_pneumonias1 is LN2 * O_pneumonias1,
  Res2 is (O_h_pneumonias1) / (1 + O_h_pneumonias1).

rules(2,values(yes,yes,no,no),Res1,Res2):-
  rule_gripis(Prior),
  A is Prior,
  rule_pneumonias(Prior2),
  B is Prior2,
  LN = 0.8,
  O_gripis1 is A / (1 - A),
  O_h_gripis1 is LN * O_gripis1,
  C is (O_h_gripis1) / (1 + O_h_gripis1),
  LS = 2.7,
  O_pneumonias1 is B / (1 - B),
  O_h_pneumonias1 is LS * O_pneumonias1,
  D is (O_h_pneumonias1) / (1 + O_h_pneumonias1),
  LN1 = 0.8,
  O_gripis2 is C / (1 - C),
  O_h_gripis2 is LN1 * O_gripis2,
  Res1 is (O_h_gripis2) / (1 + O_h_gripis2),
  LN2 = 0.6,
  O_pneumonias2 is D / (1 - D),
  O_h_pneumonias2 is LN2 * O_pneumonias2,
  Res2 is (O_h_pneumonias2) / (1 + O_h_pneumonias2).
  

rules(3,values(yes,no,yes,no),Res1,Res2):-
  rule_gripis(Prior),
  A is Prior,
  rule_pneumonias(Prior2),
  B is Prior2,
  LS=2.5,
  O_gripis1 is A / (1 - A),
  O_h_gripis1 is LS * O_gripis1,
  C is (O_h_gripis1) / (1 + O_h_gripis1),
  LN = 0.6,
  O_pneumonias1 is B / (1 - B),
  O_h_pneumonias1 is LN * O_pneumonias1,
  D is (O_h_pneumonias1) / (1 + O_h_pneumonias1),
  LS1 = 2.5,
  O_gripis2 is C / (1 - C),
  O_h_gripis2 is LS1 * O_gripis2,
  Res1 is (O_h_gripis2) / (1 + O_h_gripis2),
  LN1 = 0.6,
  O_pneumonias2 is D / (1 - D),
  O_h_pneumonias2 is LN1 * O_pneumonias2,
  Res2 is (O_h_pneumonias2) / (1 + O_h_pneumonias2).

rules(4,values(yes,yes,yes,no),Res1,Res2):-
  rule_gripis(Prior),
  A is Prior,
  rule_pneumonias(Prior2),
  B is Prior2,
  LN=0.8,
  O_gripis1 is A / (1 - A),
  O_h_gripis1 is LN * O_gripis1,
  C is (O_h_gripis1) / (1 + O_h_gripis1),
  LS = 2.7,
  O_pneumonias1 is B / (1 - B),
  O_h_pneumonias1 is LS * O_pneumonias1,
  D is (O_h_pneumonias1) / (1 + O_h_pneumonias1),
  LS1 = 2.5,
  O_gripis2 is C / (1 - C),
  O_h_gripis2 is LS1 * O_gripis2,
  Res1 is (O_h_gripis2) / (1 + O_h_gripis2),
  LN1 = 0.6,
  O_pneumonias2 is D / (1 - D),
  O_h_pneumonias2 is LN1 * O_pneumonias2,
  Res2 is (O_h_pneumonias2) / (1 + O_h_pneumonias2).

rules(5,values(yes,yes,yes,yes),Res1,Res2):-
  rule_gripis(Prior),
  A is Prior,
  rule_pneumonias(Prior2),
  B is Prior2,
  LN=0.8,
  O_gripis1 is A / (1 - A),
  O_h_gripis1 is LN * O_gripis1,
  C is (O_h_gripis1) / (1 + O_h_gripis1),
  LS = 2.7,
  O_pneumonias1 is B / (1 - B),
  O_h_pneumonias1 is LS * O_pneumonias1,
  D is (O_h_pneumonias1) / (1 + O_h_pneumonias1),
  LS1 = 2.5,
  O_gripis2 is C / (1 - C),
  O_h_gripis2 is LS1 * O_gripis2,
  Res1 is (O_h_gripis2) / (1 + O_h_gripis2),
  LS2 = 2.7,
  O_pneumonias2 is D / (1 - D),
  O_h_pneumonias2 is LS2 * O_pneumonias2,
  Res2 is (O_h_pneumonias2) / (1 + O_h_pneumonias2).

rules(6,values(yes,yes,no,yes),Res1,Res2):-
  rule_gripis(Prior),
  A is Prior,
  rule_pneumonias(Prior2),
  B is Prior2,
  LN=0.8,
  O_gripis1 is A / (1 - A),
  O_h_gripis1 is LN * O_gripis1,
  C is (O_h_gripis1) / (1 + O_h_gripis1),
  LS = 2.7,
  O_pneumonias1 is B / (1 - B),
  O_h_pneumonias1 is LS * O_pneumonias1,
  D is (O_h_pneumonias1) / (1 + O_h_pneumonias1),
  LN1 = 0.8,
  O_gripis2 is C / (1 - C),
  O_h_gripis2 is LN1 * O_gripis2,
  Res1 is (O_h_gripis2) / (1 + O_h_gripis2),
  LS1 = 2.7,
  O_pneumonias2 is D / (1 - D),
  O_h_pneumonias2 is LS1 * O_pneumonias2,
  Res2 is (O_h_pneumonias2) / (1 + O_h_pneumonias2).

rules(7,values(yes,no,yes,yes),Res1,Res2):-
  rule_gripis(Prior),
  A is Prior,
  rule_pneumonias(Prior2),
  B is Prior2,
  LS=2.5,
  O_gripis1 is A / (1 - A),
  O_h_gripis1 is LS * O_gripis1,
  C is (O_h_gripis1) / (1 + O_h_gripis1),
  LN = 0.6,
  O_pneumonias1 is B / (1 - B),
  O_h_pneumonias1 is LN * O_pneumonias1,
  D is (O_h_pneumonias1) / (1 + O_h_pneumonias1),
  LS1 = 2.5,
  O_gripis2 is C / (1 - C),
  O_h_gripis2 is LS1 * O_gripis2,
  Res1 is (O_h_gripis2) / (1 + O_h_gripis2),
  LS2 = 2.7,
  O_pneumonias2 is D / (1 - D),
  O_h_pneumonias2 is LS2 * O_pneumonias2,
  Res2 is (O_h_pneumonias2) / (1 + O_h_pneumonias2).

rules(8,values(yes,no,no,yes),Res1,Res2):-
  rule_gripis(Prior),
  A is Prior,
  rule_pneumonias(Prior2),
  B is Prior2,
  LS=2.5,
  O_gripis1 is A / (1 - A),
  O_h_gripis1 is LS * O_gripis1,
  C is (O_h_gripis1) / (1 + O_h_gripis1),
  LN = 0.6,
  O_pneumonias1 is B / (1 - B),
  O_h_pneumonias1 is LN * O_pneumonias1,
  D is (O_h_pneumonias1) / (1 + O_h_pneumonias1),
  LN1 = 0.8,
  O_gripis2 is C / (1 - C),
  O_h_gripis2 is LN1 * O_gripis2,
  Res1 is (O_h_gripis2) / (1 + O_h_gripis2),
  LS1 = 2.7,
  O_pneumonias2 is D / (1 - D),
  O_h_pneumonias2 is LS1 * O_pneumonias2,
  Res2 is (O_h_pneumonias2) / (1 + O_h_pneumonias2).
