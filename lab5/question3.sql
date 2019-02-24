CREATE OR REPLACE FUNCTION countByTitle(
    p_title IN AlphaCoEmp.title % TYPE
) RETURN NUMBER
IS 
    l_cnt INTEGER; 
BEGIN
	/* Complete the query below */ 
      SELECT COUNT(*)
        INTO l_cnt
        FROM AlphaCoEmp 
    GROUP BY title
      HAVING title = p_title;
 
    RETURN l_cnt;
END; 
/
show errors;


