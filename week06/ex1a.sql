create TABLE OrderItemdb
(orderId INT,
 itemId INT,
 quantity INT,
 PRIMARY KEY (orderId, itemId));

create TABLE Itemdb
(itemName VARCHAR(15),
 itemId INT,
 price REAL,
 PRIMARY KEY (itemId));

create TABLE Customerdb
(customerId INT,
 customerName VARCHAR(15),
 city VARCHAR(15),
 PRIMARY KEY (customerId));

create TABLE Orderdb
(orderId INT,
 customerId INT,
 date DATE,
 PRIMARY KEY (orderId));

insert into OrderItemdb(orderId, itemId, quantity)
select orderId, itemId, quantity
from orders
ON CONFLICT DO NOTHING;

insert into Itemdb(itemName, itemId, price)
select itemName, itemId, price
from orders
ON CONFLICT DO NOTHING;

insert into Customerdb(customerId, customerName, city)
select customerId, customerName, city
from orders
ON CONFLICT DO NOTHING;

insert into Orderdb(orderId, customerId, date)
select orderId, customerId, date
from orders
ON CONFLICT DO NOTHING;