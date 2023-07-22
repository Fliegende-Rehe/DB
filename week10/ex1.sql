-- Create a table of accounts
CREATE TABLE Accounts
(
    ID       SERIAL PRIMARY KEY,
    Name     VARCHAR(50) NOT NULL,
    Credit   INTEGER     NOT NULL,
    Currency VARCHAR(10) NOT NULL,
    BankName VARCHAR(50) NOT NULL
);

-- Generate and insert 4 accounts into the table, each account has 1000 Rub and the last one for fees
INSERT INTO Accounts (Name, Credit, Currency, BankName)
VALUES ('Account 1', 1000, 'Rub', 'SberBank'),
       ('Account 2', 1000, 'Rub', 'Tinkoff'),
       ('Account 3', 1000, 'Rub', 'SberBank'),
       ('Transaction Fees', 0, 'Rub', '');

-- Create new table called Ledger to show all transactions:
CREATE TABLE Ledger
(
    ID                  SERIAL PRIMARY KEY,
    FromID              INTEGER   NOT NULL,
    ToID                INTEGER   NOT NULL,
    Fee                 INTEGER   NOT NULL,
    Amount              INTEGER   NOT NULL,
    TransactionDateTime TIMESTAMP NOT NULL
);

-- Create Transactions
BEGIN;

-- Perform the transactions with control commands
-- Account 1 send 500 RUB to Account 3
SAVEPOINT T1;
UPDATE Accounts
SET Credit = Credit - 500
WHERE ID = 1;
UPDATE Accounts
SET Credit = Credit + 500
WHERE ID = 3;
INSERT INTO Ledger (FromID, ToID, Fee, Amount, TransactionDateTime)
VALUES (1, 3, 0, 500, NOW());
-- I dot rollback so that the transaction is saved in the Ledger table
-- ROLLBACK TO SAVEPOINT T1;

-- Account 2 send 700 RUB to Account 1
SAVEPOINT T2;
UPDATE Accounts
SET Credit = Credit - 700
WHERE ID = 2;
UPDATE Accounts
SET Credit = Credit + 700
WHERE ID = 1;
INSERT INTO Ledger (FromID, ToID, Fee, Amount, TransactionDateTime)
VALUES (2, 1, 30, 670, NOW());
UPDATE Accounts
SET Credit = Credit - 30
WHERE ID = 2;
-- I dot rollback so that the transaction is saved in the Ledger table
-- ROLLBACK TO SAVEPOINT T2;

-- Account 2 send 100 RUB to Account 3
SAVEPOINT T3;
UPDATE Accounts
SET Credit = Credit - 100
WHERE ID = 2;
UPDATE Accounts
SET Credit = Credit + 100
WHERE ID = 3;
INSERT INTO Ledger (FromID, ToID, Fee, Amount, TransactionDateTime)
VALUES (2, 3, 30, 70, NOW());
UPDATE Accounts
SET Credit = Credit - 30
WHERE ID = 2;
-- I dot rollback so that the transaction is saved in the Ledger table
-- ROLLBACK TO SAVEPOINT T3;

-- Commit the changes
COMMIT;

-- Return credit for all accounts
UPDATE Accounts
SET Credit = 1000
WHERE ID IN (1, 2, 3, 4);
