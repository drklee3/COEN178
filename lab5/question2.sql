CREATE OR REPLACE FUNCTION calcSalaryRaise (
    p_name IN AlphaCoEmp.name % TYPE
    , percentRaise IN NUMBER
) RETURN NUMBER 
IS 
    l_salary AlphaCoEmp.salary % TYPE; 
    l_raise  AlphaCoEmp.salary % TYPE; 
    l_cnt INTEGER; 
BEGIN 
    -- Find the current salary of p_name from AlphaCoEMP table. 
    SELECT salary
      INTO l_salary
      FROM AlphaCoEmp 
     WHERE UPPER(name) = UPPER(p_name); 
    -- Calculate the raise amount 
    l_raise := l_salary * (percentRaise/100); 

    -- Check if the p_name is in Emp_Work table. 
    -- If so, add a $1000 bonus to the 
    -- raise amount 
    SELECT COUNT(*)
      INTO l_cnt
      FROM Emp_Work 
     WHERE UPPER(name) = UPPER(p_name); 

    IF l_cnt >= 1 THEN 
        l_raise := l_raise + 1000; 
    END IF; 

    /* return a value from the function */
    RETURN l_raise;
END; 
/ 
Show Errors;
