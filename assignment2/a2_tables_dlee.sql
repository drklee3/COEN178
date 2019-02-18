CREATE TABLE MealItem2 (
    itemId   VARCHAR(20) PRIMARY KEY,
    name     VARCHAR(20),
    price    NUMBER(2),
    calories INTEGER
);

CREATE TABLE MealOrder2 (
    orderId VARCHAR(20) PRIMARY KEY,
    name    VARCHAR(20),
    phone   VARCHAR(10)
);

CREATE TABLE OrderItem (
    orderId VARCHAR(20),
    itemId  VARCHAR(20),
    CONSTRAINT PK2        PRIMARY KEY (orderId, itemId),
    CONSTRAINT FK_orderId2 FOREIGN KEY (orderId)
                          REFERENCES MealOrder2(orderId),
    CONSTRAINT FK_itemId2  FOREIGN KEY (itemId)
                          REFERENCES MealItem2(itemId)
);

