CREATE OR REPLACE TRIGGER titlecountchange_trig 
AFTER INSERT ON AlphaCoEmp 
FOR EACH ROW 
BEGIN 
    UPDATE EmpStats 
       SET Empcount = Empcount + 1
           , lastmodified = SYSDATE 
     WHERE title = :new.title; 
END; 
/ 
Show errors; 
