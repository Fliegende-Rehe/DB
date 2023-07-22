-- Create and fill table frm example
CREATE TABLE account
(
    username varchar(50) PRIMARY KEY,
    fullname varchar(100) NOT NULL,
    balance  integer      NOT NULL,
    group_id integer      NOT NULL
);

INSERT INTO account (username, fullname, balance, group_id)
VALUES ('jones', 'Alice Jones', 82, 1),
       ('bitdiddl', 'Ben Bitdiddle', 65, 1),
       ('mike', 'Michael Dole', 73, 2),
       ('alyssa', 'Alyssa P. Hacker', 79, 3),
       ('bbrown', 'Bob Brown', 100, 3);


-- To connect to the PostgreSQL database using the CLI in terminal
-- and set the transaction isolation level to READ UNCOMMITTED:
psql -U username -d database_name
SET SESSION CHARACTERISTICS AS TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

-- T1 - terminal 1
-- T2 - terminal 2

-- 1) Start a transaction and display the accounts information in T1
BEGIN;
SELECT * FROM account;

-- 2) Start a transaction and update the username for "Alice Jones" as "ajones" in T2
BEGIN;
UPDATE account SET username = 'ajones' WHERE fullname = 'Alice Jones';

-- 3) Display again the accounts table in T1 and T2
SELECT * FROM account;

-- 4) Both terminals show the same information as the transaction isolation level is READ UNCOMMITTED, which
-- allows dirty reads. This means that T1 is not waiting for T2 to commit before displaying the updated data.

-- 5) Commit the changes and compare again both sessions in T2
COMMIT;
SELECT * FROM account;

-- 6) Start a new transaction in T2
BEGIN;

-- 7) Update the balance for the Alice's account by +10 in T1
BEGIN;
UPDATE account SET balance = balance + 10 WHERE fullname = 'Alice Jones';

-- 8) Update the balance for the Alice's account by +20 in T2
UPDATE account SET balance = balance + 20 WHERE fullname = 'Alice Jones';

-- 9) Changes made by T2 are now visible in T2 as the transaction is committed.

-- 10) Commit the changes in T1
COMMIT;

-- 11) Rollback in T2
ROLLBACK;

-- 12) The output from the second terminal not show the changes made by T1 because the transaction isolation
-- level is READ UNCOMMITTED, which allows dirty reads. This means that when T2 reads the data, it is not
-- waiting for T1 to commit before displaying the updated data. However, when T2 rolls back, the changes made
-- by T2 are not visible anymore. This means that the changes made by T1 are still visible.

-- 13) Read accounts with group_id=2 in T1
SELECT * FROM account WHERE group_id = 2;

-- 14) Move Bob to group 2 in T2
UPDATE account SET group_id = 2 WHERE fullname = 'Bob Brown';

-- 15) Read accounts with group_id=2 in T1
SELECT * FROM account WHERE group_id = 2;

-- 16) Update selected accounts balances by +15 in T1
UPDATE account SET balance = balance + 15 WHERE group_id = 2;

-- 17) Commit the transaction in T1 and T2
COMMIT;

-- 18) Read committed: The READ COMMITTED isolation level ensures that each transaction sees a consistent
-- view of the database at the time the transaction starts. Therefore, when T1 reads the accounts with
-- group_id=2 for the second time, after T2 has moved Bob to group 2, it see the accounts that belong to
-- group 2 at the time the transaction started. As a result, Bob's account not included in the results.
-- However, when T1 updates the balances of the selected accounts, it update the accounts that belong to
-- group 2 at the time the update starts, which include Bob's account.

-- 19) Repeatable read: The REPEATABLE READ isolation level ensures that each transaction sees a consistent
-- view of the database throughout the transaction. Therefore, when T1 reads the accounts with group_id=2 for
-- the second time, after T2 has moved Bob to group 2, it see the accounts that belong to group 2 at the time
-- the transaction started. As a result, Bob's account not included in the results. When T1 updates the balances
-- of the selected accounts, it update the accounts that belong to group 2 at the time the update starts, which
-- include Bob's account. However, when T1 commits the transaction, it wait for T2 to finish before committing.
-- This means that Bob's account not moved to group 2 until after T1 commits, so the balance update affect the
-- accounts that already belong to group 2.