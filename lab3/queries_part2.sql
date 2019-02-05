--exercise 7
  SELECT deptid
         , COUNT(*) AS empcount
    FROM L_EMP
GROUP BY deptid;

-- exercise 8
-- a
  SELECT EMP.deptid
         , L_DEPT.deptname
         , EMP.empcount
    FROM (
        SELECT deptid
               , COUNT(*) AS empcount
          FROM L_EMP
      GROUP BY deptid
    ) EMP, L_DEPT
   WHERE EMP.deptid = L_DEPT.deptid;

-- b
  SELECT EMP.deptid
         , L_DEPT.deptname
         , EMP.empcount
    FROM (
        SELECT deptid
               , COUNT(*) AS empcount
          FROM L_EMP
      GROUP BY deptid
    ) EMP, L_DEPT
   WHERE EMP.deptid = L_DEPT.deptid
ORDER BY EMP.empcount DESC;

-- exercise 9
-- attempt 1
  SELECT deptid
         , MAX(COUNT(*))
    FROM L_EMP
GROUP BY deptid;

/*
no, the query does no work as max returns a single value
while selecting deptid returns multiple rows
*/

-- attempt 2
  SELECT deptid
    FROM L_EMP
GROUP BY deptid
  HAVING COUNT(*) = (
        SELECT COUNT(*)
          FROM L_EMP
      GROUP BY deptid
  );

/*
a) the subquery returns more than a single row due to the
   group by clause
*/

-- attempt 2 fixed
  SELECT deptid AS DEPT_WITH_MAX_EMP
    FROM L_EMP
GROUP BY deptid
  HAVING COUNT(*) >= ALL (
        SELECT COUNT(*)
          FROM L_EMP
      GROUP BY deptid
  );

-- b
      SELECT deptid
             , deptname
        FROM L_EMP
NATURAL JOIN L_DEPT
    GROUP BY deptid, deptname
      HAVING COUNT(*) >= ALL (
          SELECT COUNT(*)
            FROM L_EMP
        GROUP BY deptid
  );

-- exercise 10
-- a
      SELECT *
        FROM L_EMP
NATURAL JOIN L_DEPT;

-- b
SELECT L_EMP.empNo
       , L_EMP.empname
       , L_EMP.deptId
       , L_DEPT.deptname
  FROM L_EMP
       , L_DEPT
 WHERE L_EMP.deptid = L_DEPT.deptid;
