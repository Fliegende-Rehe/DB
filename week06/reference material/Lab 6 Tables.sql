-- Exercise 1

CREATE TABLE orders
	(orderId INT,
	date DATE,
	customerId INT,
	customerName VARCHAR(15),
	city VARCHAR(15),
	itemId INT,
	itemName VARCHAR(15),
	quantity INT,
	price REAL,
	PRIMARY KEY (orderId, customerId, itemId)
	);

INSERT INTO orders VALUES ('2301', '2011-02-23', '101', 'Martin', 'Prague', '3786', 'Net', '3', '35.00');
INSERT INTO orders VALUES ('2301', '2011-02-23', '101', 'Martin', 'Prague', '4011', 'Racket', '6', '65.00');
INSERT INTO orders VALUES ('2301', '2011-02-23', '101', 'Martin', 'Prague', '9132', 'Pack-3', '8', '4.75');
INSERT INTO orders VALUES ('2302', '2012-02-25', '107', 'Herman', 'Madrid', '5794', 'Pack-6', '4', '5.00');
INSERT INTO orders VALUES ('2303', '2011-11-27', '110', 'Pedro', 'Moscow', '4011', 'Racket', '2', '65.00');
INSERT INTO orders VALUES ('2303', '2011-11-27', '110', 'Pedro', 'Moscow', '3141', 'Cover', '2', '10.00');

-- Exercise 2

CREATE TABLE loan_books
	(school VARCHAR(50),
    teacher VARCHAR(30),
    course VARCHAR(40),
    room VARCHAR(10),
    grade VARCHAR(15),
    book VARCHAR(60),
    publisher VARCHAR(30),
    loanDate DATE,
	PRIMARY KEY (loanDate)
	);
	
INSERT INTO loan_books VALUES ('Horizon Education Institute', 'Chad Russell', 'Logical Thinking', '1.A01', '1st grade', 'Learning and teaching in early childhood education', 'BOA Editions', '2010-09-09');
INSERT INTO loan_books VALUES ('Horizon Education Institute', 'Chad Russell', 'Writing', '1.A01', '1st grade', 'Preschool, N56', 'Taylor & Francis Publishing', '2010-05-05');
INSERT INTO loan_books VALUES ('Horizon Education Institute', 'Chad Russell', 'Numerical thinking', '1.A01', '1st grade', 'Learning and teaching in early childhood education', 'BOA Editions', 2010-05-05);
INSERT INTO loan_books VALUES ('Horizon Education Institute', 'E.F.Codd', 'Spatial, Temporal and Causal Thinking', '1.B01', '1st grade', 'Early Childhood Education N9', 'Prentice Hall', '2010-05-06');
INSERT INTO loan_books VALUES ('Horizon Education Institute', 'E.F.Codd', 'Numerical thinking', '1.B01', '1st grade', 'Learning and teaching in early childhood education', 'BOA Editions', '2010-05-06');
INSERT INTO loan_books VALUES ('Horizon Education Institute', 'Jones Smith', 'Writing', '1.A01', '2nd grade', 'Learning and teaching in early childhood education', 'BOA Editions', '2010-09-09');
INSERT INTO loan_books VALUES ('Horizon Education Institute', 'Jones Smith', 'English', '1.A01', '2nd grade', 'Know how to educate: guide for Parents and Teachers', 'McGraw Hill', '2010-05-05');
INSERT INTO loan_books VALUES ('Bright Institution', 'Adam Baker', 'Logical Thinking', '2.B01', '1st grade', 'Know how to educate: guide for Parents and Teachers', 'McGraw Hill', '2010-12-18');
INSERT INTO loan_books VALUES ('Bright Institution', 'Adam Baker', 'Numerical Thinking', '2.B01', '1st grade', 'Learning and teaching in early childhood education', 'BOA Editions', '2010-05-06');