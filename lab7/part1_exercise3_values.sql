INSERT INTO Course_Prereq VALUES (121, 11);
INSERT INTO Course_Prereq VALUES (121, 10);
INSERT INTO Course_Prereq VALUES (121, 12);
INSERT INTO Course_Prereq VALUES (133, 12);

SELECT * FROM Course_Prereq;

UPDATE Course_Prereq
   SET courseno = 121
 WHERE courseno= 133;