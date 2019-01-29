CREATE TABLE Customer (
    custid VARCHAR(5) PRIMARY KEY,
    first_name VARCHAR(10),
    last_name VARCHAR(15),
    city VARCHAR(10)
);

CREATE TABLE DeliveryService (
    serviceid VARCHAR(10) PRIMARY KEY,
    item VARCHAR(15),
    location VARCHAR(15),
    servicefee NUMBER(2)
);

CREATE TABLE Schedule (
    serviceid VARCHAR(2) NOT NULL FOREIGN KEY REFERENCES DeliveryService(serviceid),
    custid VARCHAR(2) NOT NULL FOREIGN KEY REFERENCES Customer(custid),
    day VARCHAR(2) NOT NULL,
    CHECK (day in ('m', 't', 'w', 'r', 'f'))
);
