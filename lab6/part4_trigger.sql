CREATE OR REPLACE TRIGGER Acct_Cust_Trig
AFTER INSERT OR UPDATE ON Accounts_6
FOR EACH ROW
BEGIN
    IF INSERTING THEN
        UPDATE totals_6
           SET totalAmount = totalAmount + :new.amount
         WHERE custno = :new.custno;
        
        INSERT
          INTO totals_6
               (SELECT :new.custno
                       , :new.amount
                  FROM DUAL
                 WHERE NOT EXISTS
                      (SELECT *
                         FROM TOTALS_6
                        WHERE custno = :new.custno));
    END IF;
    
    IF UPDATING THEN
        /* If we are updating we want to correctly set the totalAmountto the new amount that may be >= or < old amountComplete the query */
        UPDATE totals_6
           SET totalAmount = totalAmount - :old.amount + :new.amount
         WHERE custno = :new.custno;
    END IF;
END;
/
show errors;

