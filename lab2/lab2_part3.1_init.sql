CREATE TABLE L_EMP (
    empNo   INTEGER PRIMARY KEY,
    empname VARCHAR(10),
    deptId  VARCHAR(5)
);

CREATE TABLE L_DEPT (
    deptId   VARCHAR(5) PRIMARY KEY,
    deptname VARCHAR(10)
);
