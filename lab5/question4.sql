CREATE OR REPLACE PROCEDURE saveCountByTitle 
AS 
    l_advisor_cnt INTEGER := 0; 
BEGIN 
    l_advisor_cnt := countByTitle('advisor'); 

    DELETE
      FROM EmpStats; -- Any previously loaded data is deleted 
    /* inserting count of employees with title, ‘advisor’.*/ 
    INSERT
      INTO EmpStats
    VALUES ('advisor', l_advisor_cnt, SYSDATE); 
END; 
/ 
Show errors; 