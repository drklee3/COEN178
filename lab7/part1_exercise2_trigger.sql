CREATE OR REPLACE TRIGGER LimitTest
    BEFORE INSERT OR UPDATE ON Course_Prereq
    FOR EACH ROW
DECLARE
    v_MAX_PREREQS CONSTANT INTEGER := 2;
    v_CurNum INTEGER;
BEGIN
    BEGIN
          SELECT COUNT(*)
            INTO v_CurNum
            FROM Course_Prereq
           WHERE courseNo = :new.CourseNo
        GROUP BY courseNo;

        EXCEPTION
            -- befor eyou enter first row no data
            WHEN no_data_found THEN
                DBMS_OUTPUT.put_line('not found');
                v_CurNum := 0;
    END;

    IF v_CurNum > 0 THEN
        IF v_CurNum + 1 > v_MAX_PREREQS THEN
            RAISE_APPLICATION_ERROR(-20000, 'Only 2 prereqs for course');
        END IF;
    END IF;
END;
/
show errors;
