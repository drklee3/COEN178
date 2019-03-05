INSERT INTO Course_Prereq VALUES (121, 11);
INSERT INTO Course_Prereq VALUES (121, 10);

SELECT * FROM Course_Prereq;

INSERT INTO Course_Prereq VALUES (121, 12);

SELECT *
  FROM Course_Prereq;

SELECT COUNT(*)
  FROM Course_Prereq;

INSERT INTO Course_Prereq VALUES (133,12);

UPDATE COURSE_PREREQ
   SET courseno = 121
 WHERE courseno = 133;
 
