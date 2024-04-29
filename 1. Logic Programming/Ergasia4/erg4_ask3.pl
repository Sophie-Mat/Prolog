:-use_module(library(lists)).

load:-['kb_old.pl'],update_KB.

update_KB:-	write('Select 1 to change a record in the kb.'),nl,
			write('Select 2 to create a new record in the kb.'),nl,
			write('Select 3 to delete a record from the kb.'),nl,
			write('Select any other key to exit.'),nl,
			write('Selection: '),
			read(X),
			selection(X),
			update_KB.
update_KB :- write('Exit!'),save_KB.

selection(1):- change_record.
			 

selection(2):- create_record.
			 

selection(3):-delete_record.



change_record:-write('Give the id of the student to change his info : '),
			   read(Id),
			   student(Id,Stoixeia),
			   write('Old info : '),
			   write(Stoixeia),nl,
			   write('New info : '),nl,
			   read(NeaStoixeia),
			   retract(student(Id,_)),
			   assertz(student(Id,NeaStoixeia)).
			   

create_record:-write('Give info to create a new record in the kb : '),
			   read(Stoixeia),
			   students(List),						
			   last(List,Teleutaio),
			   Neo_id is Teleutaio+1,
			   assertz(student(Neo_id,Stoixeia)),
			   append(List,[Neo_id],NewList),
			   retractall(students(_)),
			   asserta(students(NewList)),
			   retract(max_student_id(_)),
			   asserta(max_student_id(Neo_id)).
			

delete_record:-write('Give the id of the student you want to delete : '),
			   read(Id),
			   retract(student(Id,_)),
			   students(List),
			   delete(List,Id,NewList),
			   last(NewList,Teleutaio),
			   retractall(max_student_id(_)),
			   retractall(students(_)),
			   asserta(students(NewList)),
			   asserta(max_student_id(Teleutaio)).
		

save_KB :- tell('kb.pl'),     
          write(':-dynamic max_student_id/1,students/1,student/2.'),nl, 
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
    	