expenseDate, groceries, entertainment, and rent 
 “Date”, “Groceries”,“Entertainment”, and “Rent” respectively.

COLUMN expenseDate   HEADING 'Date'
COLUMN groceries     HEADING 'Groceries'
COLUMN entertainment HEADING 'Entertainment'
COLUMN rent          HEADING 'Rent'

TTITLE CENTER "Expense Report"

SET UNDERLINE '='

BREAK ON expenseDate SKIP 1

COLUMN rent FORMAT $99,990
