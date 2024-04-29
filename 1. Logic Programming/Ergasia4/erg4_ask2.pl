:-consult('kb_old.pl'). 

save_KB:- tell('kb.pl'),     
          write(':- dynamic max_student_id/1,students/1,student/2.'),nl, 
		  Head=max_student_id(_),
		  clause(Head,Body),  
		  write(Head),
		  write('.'),nl,
		  Head2=students(List),   
		  clause(Head2,Body),
		  write(Head2),
		  write('.'),nl,
		  save_students(List),   
		  told.  
		 

save_students([]).	

save_students([H|T]) :-	 
	Head = student(H, _), 
	clause(Head, _),
	write(Head), write('.'), nl,
	save_students(T).