-- show rows in tables
SELECT *
  FROM L_EMP;

SELECT *
  FROM L_DEPT;

-- show names in 'Testing'
SELECT L_EMP.empname
  FROM L_EMP,
       L_DEPT
 WHERE L_EMP.deptId = L_DEPT.deptId
   AND L_DEPT.deptname = 'Testing';

-- show names again
SELECT empname
  FROM L_EMP
  JOIN L_DEPT
    ON L_EMP.deptId = L_DEPT.deptId
 WHERE deptname = 'Testing';
