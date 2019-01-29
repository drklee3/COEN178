Create table L_EMP (
    empNo   INTEGER PRIMARY KEY,
    empname VARCHAR(10),
    deptId  VARCHAR(5)
);

Create table L_DEPT (
    deptId   VARCHAR(5) PRIMARY KEY,
    deptname VARCHAR(10)
);

insert into L_EMP  values(1,    'smith',  'd1');
insert into L_EMP  values(2,    'jones',  'd2');
insert into L_EMP  values(3,    'wayne',  'd1');
insert into L_EMP  values(4,    'moor',   'd3');
insert into L_EMP  values(5,    'king',   'd1');
insert into L_EMP  values(6,    'chen',   'd1');
insert into L_EMP  values(7,    'winger', 'd3');
insert into L_DEPT values('d1', 'Research'    );
insert into L_DEPT values('d2', 'Devt'        );
insert into L_DEPT values('d3', 'Testing'     );
insert into L_DEPT values('d4', 'Advert'      );