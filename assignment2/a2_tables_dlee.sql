CREATE TABLE MealItem (
    itemId   VARCHAR(20) PRIMARY KEY,
    name     VARCHAR(20),
    price    NUMBER(2),
    calories INTEGER
);

CREATE TABLE MealOrder (
    orderId VARCHAR(20) PRIMARY KEY,
    name    VARCHAR(20),
    phone   VARCHAR(10)
);

CREATE TABLE Order_Item (
    orderId VARCHAR(20),
    itemId  VARCHAR(20),
    CONSTRAINT PK         PRIMARY KEY (orderId, itemId),
    CONSTRAINT FK_orderId FOREIGN KEY (orderId)
                          REFERENCES MealOrder(orderId),
    CONSTRAINT FK_itemId  FOREIGN KEY (itemId)
                          REFERENCES MealItem(itemId)
);

