SET LINESIZE 47

COLUMN expenseDate   HEADING 'Date'
COLUMN groceries     HEADING 'Groceries'
COLUMN entertainment HEADING 'Entertainment'
COLUMN rent          HEADING 'Rent'

TTITLE CENTER "Expense Report"

SET UNDERLINE '='

COLUMN groceries     FORMAT $99,999.99
COLUMN entertainment FORMAT $99,999.99
COLUMN rent          FORMAT $99,999.99

BREAK ON REPORT ON ROW SKIP 1
COMPUTE AVG SUM MAX OF groceries entertainment rent ON REPORT

  SELECT expenseDate
         , groceries
         , entertainment
         , rent
    FROM Expenses;
