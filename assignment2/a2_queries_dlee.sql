-- 1
  SELECT name
         , price
    FROM MealItem
ORDER BY price;

-- 2
  SELECT name
         , price
         , calories
    FROM MealItem
ORDER BY price, calories;

-- 3
SELECT name
  FROM MealItem
 WHERE calories = 
       (SELECT MAX(calories)
          FROM MealItem);

-- 4
  SELECT name
    FROM MealItem
   WHERE name = (SELECT name
                   FROM (SELECT name
                                , COUNT(*) AS order_count
                           FROM MealItem
                                NATURAL JOIN Order_Item
                       GROUP BY name
                       ORDER BY COUNT(*) DESC)
                   WHERE ROWNUM = 1);
   


-- 5
SELECT name
       , price
  FROM MealItem
 WHERE itemId NOT IN
       (SELECT itemId
          FROM Order_Item);

-- 6
SELECT phone, COUNT(*)
  FROM MealOrder
GROUP BY phone
HAVING COUNT(*) = (SELECT MAX(COUNT(*))
                     FROM MealOrder
                 GROUP BY phone);

-- 7
  SELECT orderId
         , SUM(calories)
    FROM Order_Item
         NATURAL JOIN MealItem
GROUP BY orderId;

-- 8
UPDATE MealItem
   SET price = 0.9 * price
 WHERE itemId NOT IN 
       (SELECT itemId
          FROM Order_Item);
