CREATE OR REPLACE PROCEDURE saveCountByTitle 
AS 
    l_advisor_cnt INTEGER := 0;
    l_director_cnt INTEGER := 0;
    l_assistant_cnt INTEGER := 0;
    l_manager_cnt INTEGER := 0;
    l_supervisor_cnt INTEGER := 0;
    l_ceo_cnt INTEGER := 0;
BEGIN 
    l_advisor_cnt := countByTitle('advisor'); 
    l_director_cnt := countByTitle('director'); 
    l_assistant_cnt := countByTitle('assistant'); 
    l_manager_cnt := countByTitle('manager'); 
    l_supervisor_cnt := countByTitle('supervisor'); 
    l_ceo_cnt := countByTitle('ceo'); 

    DELETE
      FROM EmpStats; -- Any previously loaded data is deleted 
    
    /* inserting count of employees with title, ‘advisor’.*/ 
    INSERT
      INTO EmpStats
    VALUES ('advisor', l_advisor_cnt, SYSDATE); 
    INSERT
      INTO EmpStats
    VALUES ('director', l_director_cnt, SYSDATE); 
    INSERT
      INTO EmpStats
    VALUES ('assistant', l_assistant_cnt, SYSDATE); 
    INSERT
      INTO EmpStats
    VALUES ('manager', l_manager_cnt, SYSDATE); 
    INSERT
      INTO EmpStats
    VALUES ('supervisor', l_supervisor_cnt, SYSDATE); 
    INSERT
      INTO EmpStats
    VALUES ('ceo', l_ceo_cnt, SYSDATE); 
END; 
/ 
Show errors; 
