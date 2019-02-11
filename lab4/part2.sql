-- QUESTION #4

CREATE OR REPLACE
PROCEDURE DisplayMessage (message in VARCHAR)
AS
BEGIN
    DBMS_OUTPUT.put_line('Hello' || message);
END;
/
Show Errors;

/*
a) 
b) 
*/

exec DisplayMessage('World');

/*
c)
*/

--  QUESTION #5
SELECT ROUND(DBMS_RANDOM.value(10, 100))
  FROM DUAL;

/*
a)
*/

CREATE OR REPLACE
PROCEDURE setSalaries(low in INTEGER, high in INTEGER)
AS
Cursor Emp_cur IS
    SELECT *
      FROM AlphaCoEmp;
    -- local variables
    l_emprec Emp_cur % rowtype;
    l_salary AlphaCoEmp.slary % type;
BEGIN
    FOR l_emprec IN Emp_cur
    LOOP
        l_salary := ROUND(DBMS_RANDOM.value(low, high));

        UPDATE AlphaCoEmp
           SET salary = l_salary
         WHERE name = l_emprec.name;
    END LOOP;
    COMMIT;
END;
/
show errors;

exec setSalaries(5000, 100000);

SELECT *
  FROM AlphaCoEmp;

-- QUESTION #6
SELECT name
  FROM AlphaCoEmp
 WHERE SALARY > 80000
   AND SALARY < 100000;

-- QUESTION #7
CREATE OR REPLACE
PROCEDURE setEmpSalary(
    p_name IN VARCHAR,
    low    IN INTEGER,
    high   IN INTEGER,
) AS
-- variables
BEGIN
-- content

    COMMIT;
END;
/
show errors;

-- QUESTION #8
CREATE OR REPLACE
FUNCTION getEmpSalary(p_name in VARCHAR)
RETURN NUMBER IS
    -- local variables
    l_salary AlphaCoEmp.salary % type;
BEGIN
    SELECT salary
      FROM AlphaCoEmp;
    
    RETURN l_salary;
END;
/
show errors;


SELECT getEmpSalary('...')
  FROM DUAL;
