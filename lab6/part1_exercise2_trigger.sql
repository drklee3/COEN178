CREATE OR REPLACE TRIGGER Acct_Cust_Trig
AFTER INSERT ON Accounts_6
FOR EACH ROW
BEGIN
    /*If the custno is already in the Totals_6 table, the update willsucceed */
    UPDATE totals_6
       SET totalAmount = totalAmount + :new.amount
     WHERE custno = :new.custno;

    /*If the custno is not in the Totals_6 table, we insert a row intoTotals_6 table. Complete the missing part in te subquery */    
    INSERT INTO totals_6
        (SELECT :new.custno
                , :new.amount
           FROM DUAL
          WHERE NOT EXISTS
                (SELECT *
                   FROM TOTALS_6
                  WHERE custno = :new.custno));
END;
/
show errors;

