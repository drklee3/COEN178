--exercise 7
  SELECT deptid
         , count(*) AS empcount
    FROM L_EMP
GROUP BY deptid;

-- exercise 8
-- a
  SELECT deptno
         , deptname
         , empcount
    FROM (
        SELECT deptid
               , count(*) AS empcount
          FROM L_EMP
      GROUP BY deptid;
    ), L_DEPT
   WHERE deptno = L_DEPT.deptid;

-- b
  SELECT deptno
         , deptname
         , empcount
    FROM (
        SELECT deptid
               , count(*) AS empcount
          FROM L_EMP
      GROUP BY deptid;
    ), L_DEPT
   WHERE deptno = L_DEPT.deptid;
ORDER BY empcount;

-- exercise 9
-- attempt 1
  SELECT deptid
         , MAX(COUNT(*))
    FROM L_EMP
GROUP BY deptid;

-- attempt 2
  SELECT deptid
    FROM L_EMP
GROUP BY deptid
  HAVING COUNT(*) = (
        SELECT COUNT(*)
          FROM L_EMP
      GROUP BY deptid
  );

-- a
-- problem with query is ??

-- fixed approach 2


-- b


-- exercise 10
-- a
      SELECT *
        FROM L_EMP
NATURAL JOIN L_DEPT;

-- b
SELECT *
  FROM L_EMP
       , L_DEPT
 WHERE L_EMP.deptid = L_DEPT.deptid;
