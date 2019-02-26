CREATE TABLE BANKCUST_6 (
    custno   VARCHAR(5) PRIMARY KEY,
    custname VARCHAR(20),
    street   VARCHAR(30),
    city     VARCHAR(20)
);

CREATE TABLE ACCOUNTS_6 (
    AccountNo   VARCHAR(5) PRIMARY KEY,
    accountType VARCHAR(10),
    amount      NUMBER(10,2),
    custno      VARCHAR(5),
    CONSTRAINT accounts_fkey
    FOREIGN KEY (custno) REFERENCES BANKCUST_6(custno)
);

CREATE TABLE TOTALS_6 (
    custno      VARCHAR(5),
    totalAmount NUMBER(10,2),
    CONSTRAINT totals_fkey
    FOREIGN KEY (custno) REFERENCES BANKCUST_6(custno)
);

