CREATE Or Replace TRIGGER countchange_trig 
AFTER INSERT or DELETE ON AlphaCoEmp 
FOR EACH ROW 
BEGIN 
    IF DELETING THEN 
    UPDATE EmpStats 
       SET Empcount = Empcount - 1
           , lastmodified = SYSDATE 
     WHERE title = :old.title; 
    END IF; 
    IF INSERTING THEN 
        UPDATE EmpStats
           SET Empcount = Empcount + 1
               , lastmodified = SYSDATE
        where title = :new.title; 
    END IF; 
END;
/ 
Show errors; 

