
/*  ENDIKTIKOI STOXOI:
p([�, �����������, �������],[]). ----> yes
p([��, ������],[]). ----> no
p([�, �����, ������],[]). ----> yes
p([�������������, �������],[]). ----> yes
p([�����, �������],[]). ----> yes
p([�����������, ��������],[]). ----> yes
p([�������������, ��������],[]). ----> no
p([��, ����],[]). ----> yes
p([�������],[]). ----> yes



�������:
���� ����� ��� ��������� ������������� �� ���� ������ ���� �������� ��������:
0-> ���������� ������
1-> ������ ������
2-> ��������� ������
3-> ������� ������
4-> ���������� �����������
5-> ������ �����������
6-> ��������� �����������
7-> ������� �����������

� ���������� ��� ������ ���������� ������� ������������� �� ��� ��������� ��� ������ ��� ���� ����� (Gender) ��� ��� �������� ������� (Num).
*/

p --> ����������(_,_) ; 
(�������(Gender,Num) , ����������(Gender,Num)) ; 
(�����(Gender,Num) , ����������(Gender,Num));
(�����(Gender,Num), �������(Gender,Num), ����������(Gender,Num)).

�����(��������,0) --> [����] ; [�].
�����(������,0) --> [���] ; [�] ; [��].
�����(������,4) --> [���].
�����(��������,0) --> [���] ; [��] ; [���] .

����������(Gender,Num) --> [Word],{check_noun(Word,Gender,Num)}.
�������(Gender,Num) --> [Word],{check_adj(Word,Gender,Num)}.
	
check_noun(Thema,Gender,Num):-
	Katal = '-',
	((����������(_, Gender, _,[[Thema,_], [_,_]], _, [_,_], A6), �����������(A6, _, Enikos, _), nth0(Num,Enikos,Katal));
	(����������(_, Gender, _,[[_,Thema], [_,_]], _, [_,_], A6), �����������(A6, _, Enikos, _), nth0(Num,Enikos,Katal));
	(����������(_, Gender, _,[[_,_], [Thema,_]], _, [_,_], A6), �����������(A6, _, _, Plith), nth0(Num1,Plith,Katal), Num is Num1+4);
	(����������(_, Gender, _,[[_,_], [_,Thema]], _, [_,_], A6), �����������(A6, _, _, Plith), nth0(Num1,Plith,Katal), Num is Num1+4)).

check_noun(Noun,Gender,Num):-
	atom_codes(Noun,Ncodes),
	append(Lthema,[X1], Ncodes),
	Lkatal = [X1],
	atom_codes(Thema, Lthema),
	atom_codes(Katal,Lkatal),
	((����������(_, Gender, _,[[Thema,_], [_,_]], _, [_,_], A6), �����������(A6, _, Enikos, _), nth0(Num,Enikos,Katal));
	(����������(_, Gender, _,[[_,Thema], [_,_]], _, [_,_], A6), �����������(A6, _, Enikos, _), nth0(Num,Enikos,Katal));
	(����������(_, Gender, _,[[_,_], [Thema,_]], _, [_,_], A6), �����������(A6, _, _, Plith), nth0(Num1,Plith,Katal), Num is Num1+4);
	(����������(_, Gender, _,[[_,_], [_,Thema]], _, [_,_], A6), �����������(A6, _, _, Plith), nth0(Num1,Plith,Katal), Num is Num1+4)).
	
check_noun(Noun,Gender,Num):-
	atom_codes(Noun,Ncodes),
	append(Lthema,[X1,X2], Ncodes),
	Lkatal = [X1,X2],
	atom_codes(Thema, Lthema),
	atom_codes(Katal,Lkatal),
	((����������(_, Gender, _,[[Thema,_], [_,_]], _, [_,_], A6), �����������(A6, _, Enikos, _), nth0(Num,Enikos,Katal));
	(����������(_, Gender, _,[[_,Thema], [_,_]], _, [_,_], A6), �����������(A6, _, Enikos, _), nth0(Num,Enikos,Katal));
	(����������(_, Gender, _,[[_,_], [Thema,_]], _, [_,_], A6), �����������(A6, _, _, Plith), nth0(Num1,Plith,Katal), Num is Num1+4);
	(����������(_, Gender, _,[[_,_], [_,Thema]], _, [_,_], A6), �����������(A6, _, _, Plith), nth0(Num1,Plith,Katal), Num is Num1+4)).
	
check_noun(Noun,Gender,Num):-
	atom_codes(Noun,Ncodes),
	append(Lthema,[X1,X2,X3], Ncodes),
	Lkatal = [X1,X2,X3],
	atom_codes(Thema, Lthema),
	atom_codes(Katal,Lkatal),
	((����������(_, Gender, _,[[Thema,_], [_,_]], _, [_,_], A6), �����������(A6, _, Enikos, _), nth0(Num,Enikos,Katal));
	(����������(_, Gender, _,[[_,Thema], [_,_]], _, [_,_], A6), �����������(A6, _, Enikos, _), nth0(Num,Enikos,Katal));
	(����������(_, Gender, _,[[_,_], [Thema,_]], _, [_,_], A6), �����������(A6, _, _, Plith), nth0(Num1,Plith,Katal), Num is Num1+4);
	(����������(_, Gender, _,[[_,_], [_,Thema]], _, [_,_], A6), �����������(A6, _, _, Plith), nth0(Num1,Plith,Katal), Num is Num1+4)).
	
check_adj(Adj,Gender,Num):-
	atom_codes(Adj,Acodes),
	append(Lthema,[X1], Acodes),
	Lkatal = [X1],
	atom_codes(Thema, Lthema),
	atom_codes(Katal,Lkatal),
	�������(_, _, Thema, [_,_,_], A6),
	�������������������(A6, [ [Male1,Male2], [Female1,Female2], [Neutral1,Neutral2] ]),
	((nth0(Num,Male1,Katal),Gender = '��������');
	(nth0(Num1,Male2,Katal),Gender = '��������', Num is Num1+4);
	(nth0(Num,Female1,Katal),Gender = '������');
	(nth0(Num1,Female2,Katal),Gender = '������', Num is Num1+4);
	(nth0(Num,Neutral1,Katal),Gender = '��������');
	(nth0(Num1,Neutral2,Katal),Gender = '��������', Num is Num1+4)).

check_adj(Adj,Gender,Num):-
	atom_codes(Adj,Acodes),
	append(Lthema,[X1,X2], Acodes),
	Lkatal = [X1,X2],
	atom_codes(Thema, Lthema),
	atom_codes(Katal,Lkatal),
	�������(_, _, Thema, [_,_,_], A6),
	�������������������(A6, [ [Male1,Male2], [Female1,Female2], [Neutral1,Neutral2] ]),
	((nth0(Num,Male1,Katal),Gender = '��������');
	(nth0(Num1,Male2,Katal),Gender = '��������', Num is Num1+4);
	(nth0(Num,Female1,Katal),Gender = '������');
	(nth0(Num1,Female2,Katal),Gender = '������', Num is Num1+4);
	(nth0(Num,Neutral1,Katal),Gender = '��������');
	(nth0(Num1,Neutral2,Katal),Gender = '��������', Num is Num1+4)).
	
check_adj(Adj,Gender,Num):-
	atom_codes(Adj,Acodes),
	append(Lthema,[X1,X2,X3], Acodes),
	Lkatal = [X1,X2,X3],
	atom_codes(Thema, Lthema),
	atom_codes(Katal,Lkatal),
	�������(_, _, Thema, [_,_,_], A6),
	�������������������(A6, [ [Male1,Male2], [Female1,Female2], [Neutral1,Neutral2] ]),
	((nth0(Num,Male1,Katal),Gender = '��������');
	(nth0(Num1,Male2,Katal),Gender = '��������', Num is Num1+4);
	(nth0(Num,Female1,Katal),Gender = '������');
	(nth0(Num1,Female2,Katal),Gender = '������', Num is Num1+4);
	(nth0(Num,Neutral1,Katal),Gender = '��������');
	(nth0(Num1,Neutral2,Katal),Gender = '��������', Num is Num1+4)).
	
check_adj(Adj,Gender,Num):-
	atom_codes(Adj,Acodes),
	append(Lthema,[X1,X2,X3,X4], Acodes),
	Lkatal = [X1,X2,X3,X4],
	atom_codes(Thema, Lthema),
	atom_codes(Katal,Lkatal),
	�������(_, _, Thema, [_,_,_], A6),
	�������������������(A6, [ [Male1,Male2], [Female1,Female2], [Neutral1,Neutral2] ]),
	((nth0(Num,Male1,Katal),Gender = '��������');
	(nth0(Num1,Male2,Katal),Gender = '��������', Num is Num1+4);
	(nth0(Num,Female1,Katal),Gender = '������');
	(nth0(Num1,Female2,Katal),Gender = '������', Num is Num1+4);
	(nth0(Num,Neutral1,Katal),Gender = '��������');
	(nth0(Num1,Neutral2,Katal),Gender = '��������', Num is Num1+4)).
	
/* ������ */

����������(�����,��������,����������, [[����,����], [����,����]],[����������,����������], [��,��], ������01).
����������(�����,��������,����������, [[�����,�����], [�����,�����]], [�������, �������], [��,��], ������02).
����������(�����,��������,������������, [[�����,�����], [�������,�������]], [����������,�������������], [��,��],������03).

����������(�����,������,����������, [[�����,�����],[�����,�����]], [�������, �������], [�,��], ������01).
����������(�����,������,����������, [[�������,������], [������,������]], [�������������,�������������], [�,��], ������02).

����������(�����,��������, ����������, [[����,����],[����,����]], [�������,�������], [�, �], ������01).
����������(�����,��������, ������������, [[����, �����], [�����,�����]], [����������,�������������], [�,�], ������02).
����������(�����,��������, ������������, [[�����,������], [������,������]], [�������������,�������������], [�,�], ������02).


�����������(������01, ��������-���������-��-��, [��,�,�,�],[��,��,��,��]).
�����������(������02, ��������-���������-��-��, [��,�,�,�],[��,��,��,��]).
�����������(������03, ��������-�����������-��-��, [��,�,�,�],[��,��,��,��]).
�����������(������01, ������-���������-��-�, [�,��,�,�],[��,��,��,��]).
�����������(������02, ������-���������-��-�, [�,��,�,�],[��,��,��,��]).
�����������(������01, ��������-���������-��-�, [�,���,�,�],[��,���,��,��]).
�����������(������02, ��������-�����������-��-�, [-,��,-,-],[�,��,�,�]).


�������(����������, �������, ���, [��,�,�], �������������������01).
�������(����������, ����������, ����, [��,�,�], �������������������02).
�������(������������, ����������, ���������, [��,�,���], �������������������03).


�������������������(�������������������01, [ [[��,��,�,� ], [��,��,���,��]], [[�,��,�,�], [��,��,��,��]], [[�,��,�,�],[�,��,�,�]] ]).
�������������������(�������������������02, [ [[��,��,�,�],[��,��,���,��]],[[�,��,�,�],[��,��,��,��]], [[�,��,�,�],[�,��,�,�]] ]).
�������������������(�������������������03, [ [[��,�,�,�],[����,����,����,����]], [[�,��,�,�],[��,_,��,��]], [[���,����,���,���],[���,����,���,���]]]).
