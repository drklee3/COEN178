-- exercise 1

-- approach 1
SELECT First || ' ' || Last AS Name
       , salary
  FROM Staff_2010
 WHERE salary >= ALL (
     SELECT salary
       FROM Staff_2010
 );

-- approach 2
SELECT First || ' ' || Last AS Name
       , salary
  FROM Staff_2010
 WHERE salary = (
     SELECT MAX(salary)
       FROM Staff_2010
 );

/*
output is Michael M. Hash and Timothy P. Love with a salary of 178700
*/

-- exercise 2
-- a
SELECT last
       , salary
  FROM Staff_2010
 WHERE salary = (
     SELECT salary
       FROM Staff_2010
      WHERE UPPER(last) = 'ZICHAL'
 );

-- b
SELECT last
       , salary
  FROM Staff_2010
 WHERE salary = (
     SELECT salary
       FROM Staff_2010
      WHERE UPPER(last) = 'YOUNG'
 );

/*
No, the query with 'Young' did not work as there are multiple
employees with the last name 'Young'.  This means more than 1 row
was returned from the subquery in which you cannot use = in the where
clause.
*/

-- b fixed, selecting anyone with same salary as anyone with last name 'Young'
SELECT last
       , salary
  FROM Staff_2010
 WHERE salary IN (
     SELECT salary
       FROM Staff_2010
      WHERE UPPER(last) = 'YOUNG'
 );


-- exercise 3
SELECT COUNT(salary) AS SALARIES_100K_ABOVE
  FROM Staff_2010
 WHERE salary > 100000;

-- exercise 4
  SELECT salary
         , COUNT(*) AS SALARIES_100K_ABOVE
    FROM Staff_2010
   WHERE salary > 100000
GROUP BY salary;

-- exercise 5
  SELECT salary
         , COUNT(*) AS SALARIES_100K_ABOVE
    FROM Staff_2010
   WHERE salary > 100000
GROUP BY salary
  HAVING COUNT(salary) > 10;

-- exercise 6
SELECT last
  FROM Staff_2010
 WHERE REGEXP_LIKE(last, '([aeiou])\1', 'i');

/*
i ignores the case, does case insensitive regex matches
*/


