-- a
SELECT custid, 
       first_name || ' ' || last_name AS fullname,
       city
  FROM Customer;

-- b
  SELECT custid,
         first_name || ' ' || last_name AS fullname,
         city
    FROM Customer
ORDER BY last_name;

-- c
  SELECT *
    FROM Schedule
ORDER BY serviceid, custid DESC;

-- d
SELECT serviceid
  FROM DeliveryService
 WHERE serviceid
NOT IN (
    SELECT serviceid
      FROM Schedule
);

-- e
      SELECT first_name || ' ' || last_name AS fullname
        FROM Customer
NATURAL JOIN Schedule
       WHERE day = 'm';

-- f
      SELECT last_name
        FROM Customer
NATURAL JOIN Schedule
       WHERE day IS NOT NULL;

-- g
SELECT MAX(servicefee)
    AS highest_ServiceFee
  FROM DeliveryService;

-- h
  SELECT COUNT(*), day
    FROM Schedule
GROUP BY day;

-- i
SELECT A.custid,
       B.custid,
       A.city
  FROM Customer A,
       Customer B
 WHERE A.city = B.city
   AND A.custid > B.custid;

-- j
        SELECT first_name || ' ' || last_name AS fullname
          FROM Customer
  NATURAL JOIN DeliveryService
  NATURAL JOIN Schedule
         WHERE Customer.city = DeliveryService.location;

-- k
SELECT MAX(salary) AS Max_Salary,
       MIN(salary) AS Min_Salary
  FROM Staff_2010;
