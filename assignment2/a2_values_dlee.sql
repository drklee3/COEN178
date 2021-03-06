-- meal items
INSERT INTO MealItem VALUES ('I1', 'oatmeal',      3.00,  120);
INSERT INTO MealItem VALUES ('I2', 'fruit_plate',  7.50,  220);
INSERT INTO MealItem VALUES ('I3', 'steak',        20.99, 420);
INSERT INTO MealItem VALUES ('I4', 'chicken pie',  12.50, 350);
INSERT INTO MealItem VALUES ('I5', 'broccoli pie', 10.00, 200);

-- meal orders
INSERT INTO MealOrder VALUES ('O1', 'Smith', '4085551212');
INSERT INTO MealOrder VALUES ('O2', 'Jones', '4085554444');
INSERT INTO MealOrder VALUES ('O5', 'Clark', '4083331212');
INSERT INTO MealOrder VALUES ('O7', 'Chen',  '4086661212');
INSERT INTO MealOrder VALUES ('O8', 'Smith', '4085551212');

-- order items
INSERT INTO Order_Item VALUES ('O1', 'I1');
INSERT INTO Order_Item VALUES ('O1', 'I2');
INSERT INTO Order_Item VALUES ('O1', 'I3');
INSERT INTO Order_Item VALUES ('O2', 'I4');
INSERT INTO Order_Item VALUES ('O8', 'I1');

-- custom values
INSERT INTO MealItem   VALUES ('I6', 'ramen', 13.50, 500);
INSERT INTO MealOrder  VALUES ('09', 'Lee', '7732316369');
INSERT INTO Order_Item VALUES ('09', 'I6');

