-- exercise 1

-- approach 1
SELECT First || ' ' || Last
       , salary
  FROM Staff_2010
 WHERE salary >= ALL (
     SELECT salary
       FROM Staff_2010
 );

-- approach 2
SELECT First || ' ' || Last
       , salary
  FROM Staff_2010
 WHERE salary = MAX (
     SELECT salary
       FROM Staff_2010
 );

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

-- i ignores the case, does case insensitive regex matches
