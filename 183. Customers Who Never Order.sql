-- Table: Customers

-- +-------------+---------+
-- | Column Name | Type    |
-- +-------------+---------+
-- | id          | int     |
-- | name        | varchar |
-- +-------------+---------+
-- id is the primary key (column with unique values) for this table.
-- Each row of this table indicates the ID and name of a customer.
 

-- Table: Orders

-- +-------------+------+
-- | Column Name | Type |
-- +-------------+------+
-- | id          | int  |
-- | customerId  | int  |
-- +-------------+------+
-- id is the primary key (column with unique values) for this table.
-- customerId is a foreign key (reference columns) of the ID from the Customers table.
-- Each row of this table indicates the ID of an order and the ID of the customer who ordered it.
 

-- Write a solution to find all customers who never order anything.

-- Return the result table in any order.

-- The result format is in the following example.

--# Write your MySQL query statement below type1
select name as Customers
from Customers as cu
LEFT join Orders as od
on cu.id = od.customerId 
where  cu.id not in (select customerId from Orders )

--# Write your MySQL query statement below type2

select name as Customers
from Customers as cu
LEFT join Orders as od
on cu.id = od.customerId 
where  od.customerId is Null

--# Write your MySQL query statement below type3
SELECT c.id, c.name
FROM Customers c
WHERE NOT EXISTS (
    SELECT 1
    FROM Orders o
    WHERE o.customerId = c.id
);