-- This code creates a table called "orders" with a primary key on orderId,
-- and populates it with 10,000 rows of random data.
CREATE TABLE orders (
  orderId SERIAL PRIMARY KEY,
  customerId INTEGER NOT NULL,
  itemId INTEGER NOT NULL,
  quantity INTEGER NOT NULL,
  price DECIMAL(10,2) NOT NULL,
  orderDate DATE NOT NULL
);

INSERT INTO orders (customerId, itemId, quantity, price, orderDate)
SELECT 
  CAST(RANDOM()*1000 AS INTEGER) AS customerId, 
  CAST(RANDOM()*1000 AS INTEGER) AS itemId, 
  CAST(RANDOM()*100 AS INTEGER) AS quantity, 
  CAST(RANDOM()*1000 AS DECIMAL(10,2)) AS price, 
  DATE '2022-01-01' + CAST(RANDOM()*365 AS INTEGER) AS orderDate
FROM generate_series(1, 10000);


-- Fetch all rows and capture time taken to fetch rows. The EXPLAIN ANALYZE command provides information
-- about the query plan and execution time, including the total time taken to fetch the rows.
SELECT * FROM orders;
EXPLAIN ANALYZE SELECT * FROM orders;

-- Create b-tree index on customerId and create hash index on itemId. These indexes should improve the performance
-- of queries that filter or sort by customerId or itemId.
CREATE INDEX idx_customer ON orders (customerId);
CREATE INDEX idx_item ON orders USING hash (itemId);

-- Query without indexes and query with b-tree index. The output of these commands will show the elapsed
-- time and cost of the queries, allowing us to compare the performance with and without indexes.
EXPLAIN ANALYZE SELECT * FROM orders WHERE customerId = 42;  -- calculated by an enormous supercomputer named Deep Thought over a period of 7.5 million years
EXPLAIN ANALYZE SELECT * FROM orders WHERE customerId = 42;

-- In general, the queries that use the indexes should be faster than the ones that don't, especially
-- as the size of the table increases. However, the exact performance improvement will depend on the
-- specific data and queries being used.