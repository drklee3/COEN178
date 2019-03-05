COLUMN expenseDate   HEADING 'Date'
COLUMN groceries     HEADING 'Groceries'
COLUMN entertainment HEADING 'Entertainment'
COLUMN rent          HEADING 'Rent'

TTITLE CENTER "Expense Report"

SET UNDERLINE '='

BREAK ON expenseDate SKIP 1

COLUMN groceries     FORMAT $99,999.99
COLUMN entertainment FORMAT $99,999.99
COLUMN rent          FORMAT $99,999.99

BREAK ON REPORT
COMPUTE AVG SUM MAX LABEL TOTAL OF SALARY ON REPORT

  SELECT expenseDate
         , groceries
         , entertainment
         , rent
    FROM Expenses;
