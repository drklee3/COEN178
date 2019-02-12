-- QUESTION #4

CREATE OR REPLACE
PROCEDURE DisplayMessage (message in VARCHAR)
AS
BEGIN
    DBMS_OUTPUT.put_line('Hello ' || message);
END;
/
Show Errors;

/*
a) Yes, the procedure compiled without errors.
*/

exec DisplayMessage('World');

/*
c) 'Hello World' was displayed.
*/

--  QUESTION #5
SELECT ROUND(DBMS_RANDOM.value(10, 100))
  FROM DUAL;

/*
a) 88 was displayed, a random number between 10 and 100
*/

CREATE OR REPLACE
PROCEDURE setSalaries(low in INTEGER, high in INTEGER)
AS
Cursor Emp_cur IS
    SELECT *
      FROM AlphaCoEmp;
    -- local variables
    l_emprec Emp_cur % rowtype;
    l_salary AlphaCoEmp.salary % type;
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
SELECT name, salary
  FROM AlphaCoEmp
 WHERE SALARY > 80000
   AND SALARY < 100000;

-- QUESTION #7
CREATE OR REPLACE
PROCEDURE setEmpSalary (
    p_name IN VARCHAR,
    low    IN INTEGER,
    high   IN INTEGER
) AS
    -- local variables
    l_salary AlphaCoEmp.salary % type;
BEGIN
    l_salary := ROUND(DBMS_RANDOM.value(low, high));
    UPDATE AlphaCoEmp
       SET salary = l_salary
     WHERE name = p_name;
    COMMIT;
END;
/
show errors;

SELECT name, salary AS SalaryBefore
  FROM AlphaCoEmp
 WHERE name = 'Smith';

exec setEmpSalary('Smith', 10, 5000);

SELECT name, salary AS SalaryAfter
  FROM AlphaCoEmp
 WHERE name = 'Smith';


-- QUESTION #8
CREATE OR REPLACE
FUNCTION getEmpSalary(p_name in VARCHAR)
RETURN NUMBER IS
    -- local variables
    l_salary AlphaCoEmp.salary % type;
BEGIN
    SELECT salary
      INTO l_salary
      FROM AlphaCoEmp
     WHERE name = p_name;
    
    RETURN l_salary;
END;
/
show errors;


SELECT getEmpSalary('Smith')
  FROM DUAL;

