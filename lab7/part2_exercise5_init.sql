CREATE TABLE Expenses (
    expenseDate   DATE PRIMARY KEY,
    groceries     NUMBER(10, 2),
    entertainment NUMBER(10, 2),
    rent          NUMBER(10, 2)
);

INSERT INTO Expenses VALUES ('12-Mar-2015', 15.25, 10.50, 500.00);
INSERT INTO Expenses VALUES ('15-Jul-2014', 25.75, 5.00,  700.00);
INSERT INTO Expenses VALUES ('27-Jan-2014', 10.00, 12.00, 400.00);
INSERT INTO Expenses VALUES ('20-Feb-2015', 12.00, 15.00, 800.00);
INSERT INTO Expenses VALUES ('30-Oct-2014', 5.00,  2.00,  100.00);

SELECT *
  FROM Expenses;
