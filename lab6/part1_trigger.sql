CREATE OR REPLACE TRIGGER display_customer_trig
    AFTER INSERT ON BankCust_6
    FOR EACH ROW
BEGIN
    DBMS_OUTPUT.PUT_LINE('From Trigger '||'Customer NO:'||:new.custno||' Customer Name: '||:new.custname || ' Customer City '|| :new.city);
END;
/
show errors;

