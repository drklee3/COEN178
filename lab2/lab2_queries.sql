SELECT custid, 
       first_name || last_name AS fullname,
       city
  FROM Customer;

  SELECT custid,
         first_name || last_name AS fullname,
         city
    FROM Customer
ORDER BY last_name;

  SELECT *
    FROM Schedule
ORDER BY serviceid, custid DESC;

SELECT serviceid
  FROM DeliveryService
 WHERE serviceid
NOT IN (
    SELECT serviceid
      FROM Schedule
);

SELECT first_name || last_name AS fullname,
  FROM Customer
  JOIN Schedule
 WHERE day = 'm';

SELECT last_name
  FROM Customer
  JOIN Schedule
 WHERE day IS NOT NULL;

SELECT MAX(servicefee)
    AS highest_ServiceFee
  FROM DeliveryService;

  SELECT COUNT(*),
    FROM Schedule
GROUP BY day;

SELECT A.custid,
       B.custid,
       A.city
  FROM Customer A,
       Customer B
 WHERE A.city = B.city;

SELECT *
  FROM Customer
  JOIN DeliveryService
  JOIN Schedule
 WHERE Customer.city = DeliveryService.location;

SELECT MAX(salary) AS Max_Salary,
       MIN(salary) AS Min_Salary
  FROM Staff_2010;
