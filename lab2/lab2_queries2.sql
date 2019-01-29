SELECT *
  FROM L_EMP,
       L_DEPT;

SELECT empname
  FROM L_EMP
  JOIN L_DEPT
    ON L_EMP.deptId = L_DEPT.deptId
 WHERE deptname = 'testing';
