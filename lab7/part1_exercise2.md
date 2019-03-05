the prerequisites are in a separate table as prereqs are courses that reference another course, which cant be done in a single table.


the following query
insert into Course_Prereq values (121,12);
failed to work, there are still 2 rows after attempting to insert the row above.

the update also failed to work, with the following error:

ERROR at line 1;
ORA-04091: table DLEE.COURSE_PREREQ is mutating, trigger/function may not it
ORA-06512: at "DLEE.LIMITTEST", line 6
ORA-04088: error during execution of trigger 'DLEE.LIMITTEST'

