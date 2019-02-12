-- QUESTION #1
CREATE TABLE AlphaCoEmp (
    name   VARCHAR(25)   PRIMARY KEY,
    title  VARCHAR(20)   DEFAULT NULL,
    salary NUMBER(10, 2) DEFAULT 0
);

INSERT INTO AlphaCoEmp (name)
     SELECT last
       FROM Staff_2010;

-- load unique last names from staff_2010
INSERT INTO AlphaCoEmp (name)
     SELECT DISTINCT last
       FROM Staff_2010;

SELECT * FROM AlphaCoEmp;

-- QUESTION #2

CREATE TABLE Emp_Work (
    name    VARCHAR(25) PRIMARY KEY,
    project VARCHAR(20) DEFAULT NULL,
     CONSTRAINT FK_AlphaCo
    FOREIGN KEY (name)
     REFERENCES AlphaCoEmp(name)
);

INSERT INTO Emp_Work (name)
SELECT name
  FROM AlphaCoEmp
 WHERE REGEXP_LIKE(name, '(^[ags])', 'i');

/**
a) The 'i' is for case insensitive matching.
   This allows for any names starting with a, g, s
   both in lower case or upper case to be
   matched.
b) 82 rows were inserted into Emp_Work
*/

SELECT name
  FROM AlphaCoEmp
 WHERE REGEXP_LIKE(name, '(^[ags])', 'i');

DELETE 
  FROM AlphaCoEmp
 WHERE name = 'Stoev';

/*
c) My deletion didn't work as it violated the foreign
   key constraint.  The name attribute in Emp_Work
   references the name attribute in AlphaCoEmp in which
   you cannot delete a child record before deleting the parent.
*/

-- QUESTION #3

    ALTER TABLE Emp_Work
DROP CONSTRAINT FK_AlphaCo;

   ALTER TABLE Emp_Work
ADD CONSTRAINT FK_AlphaCo
   FOREIGN KEY (name)
    REFERENCES AlphaCoEmp (name)
     ON DELETE CASCADE;

/*
a) The table has been altered to delete child records
   when a parent has been deleted.
*/

DELETE
  FROM AlphaCoEmp
 WHERE name = 'Stone';


/*
b) This time it succeeded.
*/

SELECT *
  FROM Emp_Work
 WHERE name = 'Stone';

 /*
 c) The record has been deleted.
 */
 
