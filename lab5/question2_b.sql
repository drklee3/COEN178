SELECT name
       , title
       , salary AS CURRENTSALARY
       , trunc(calcSalaryRaise(name, 2)) AS NEWSALARY
  FROM AlphaCoEmp
 WHERE upper(name) = upper('Kang');

