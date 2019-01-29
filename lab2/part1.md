a) The following insert statement failed:
      INSERT INTO Schedule VALUES ('dg5',  'c32', 't')

  The first one failed due to a parent key not being found,
  the custid c32 was not found in the Customer table so the
  tuple could not be inserted.

b) The insert failed due to the check constraint being
  violated, the check makes sure only weekdays are used for day
  and the tuple attempted to be inserted is 's'.
