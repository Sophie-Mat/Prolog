
add-end-diff-lists(Elem, DiffList, EndDiffList, NewDiffList, EndNewDiffList):- 
op(600, xfy,[\]),
append_dl(DiffList\EndDiffList,[Elem|EndNewDiffList]\EndNewDiffList,NewDiffList).

append_dl(X\Y, Y\_, X).

/*  STOXOS:
add-end-diff-lists(1,[a,b,c,d|EndDL],EndDL,NewDL,EndNewDL).
*/