connection(a,b).
connection(a,d).
connection(b,c).
connection(b,e).
connection(c,d).
connection(d,e).

connected(A,B) :- connections(A,B),write('true').
connections(A,B) :- connection(A,B) ; connection(A,B)=connection(B,A).
