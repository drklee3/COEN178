-- 1
  SELECT name
         , price
    FROM MealItem2
ORDER BY price;

-- 2
  SELECT name
         , price
         , calories
    FROM MealItem2
ORDER BY price, calories;

-- 3
SELECT name
  FROM MealItem2
 WHERE calories = 
       (SELECT MAX(calories)
          FROM MealItem2);

-- 4
  SELECT name
    FROM MealItem2
   WHERE name = (SELECT name
                   FROM (SELECT name
                                , COUNT(*) AS order_count2
                           FROM MealItem2
                                NATURAL JOIN OrderItem
                       GROUP BY name
                       ORDER BY COUNT(*) DESC)
                   WHERE ROWNUM = 1);
   


-- 5
SELECT name
       , price
  FROM MealItem2
 WHERE itemId NOT IN
       (SELECT itemId
          FROM OrderItem);

-- 6
SELECT phone, COUNT(*)
  FROM MealOrder2
GROUP BY phone
HAVING COUNT(*) = (SELECT MAX(COUNT(*))
                     FROM MealOrder2
                 GROUP BY phone);

-- 7
  SELECT orderId
         , SUM(calories)
    FROM OrderItem
         NATURAL JOIN MealItem2
GROUP BY orderId;

-- 8
UPDATE MealItem2
   SET price = 0.9 * price
 WHERE itemId NOT IN 
       (SELECT itemId
          FROM OrderItem);
