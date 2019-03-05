DELETE FROM Course_Prereq;

CREATE OR REPLACE TRIGGER LimitTest
FOR INSERT
ON Course_Prereq
COMPOUND TRIGGER
    v_MAX_PREREQS CONSTANT INTEGER := 2;
    v_CurNum INTEGER := 1;
    v_cno    INTEGER;
-- row level
BEFORE EACH ROW IS
BEGIN
    v_cno := :new.COURSENO;
END BEFORE EACH ROW;
-- statement level

AFTER STATEMENT IS
BEGIN
      SELECT COUNT(*)
        INTO v_CurNum
        FROM Course_Prereq
       WHERE courseNo = v_cno
    GROUP BY courseNo;

    IF v_CurNum > v_MAX_PREREQS THEN
        RAISE_APPLICATION_ERROR(-20000, 'only 2 prereqs for course');
    END IF;
END AFTER STATEMENT;
END;
/
show errors;
