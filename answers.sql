-- 📝 Assignment: Database Design and Normalization
-- Author: Dejenie Derese Mitiku


/* 
=========================================
 Question 1: Achieving 1NF (First Normal Form) 🛠️
=========================================
 Problem:
 - The column 'Products' contains multiple values (comma-separated).
 - This violates 1NF since attributes must contain atomic (indivisible) values.

 Solution:
 - Split multi-valued attributes into separate rows.
 - Each row should represent one product for an order.
*/

-- Original Table: ProductDetail (non-1NF)
-- OrderID | CustomerName | Products

-- Step 1: Create new table in 1NF
CREATE TABLE ProductDetail_1NF (
    OrderID INT,
    CustomerName VARCHAR(100),
    Product VARCHAR(50)
);

-- Step 2: Insert transformed rows (each product = one row)
INSERT INTO ProductDetail_1NF (OrderID, CustomerName, Product)
VALUES
(101, 'John Doe', 'Laptop'),
(101, 'John Doe', 'Mouse'),
(102, 'Jane Smith', 'Tablet'),
(102, 'Jane Smith', 'Keyboard'),
(102, 'Jane Smith', 'Mouse'),
(103, 'Emily Clark', 'Phone');

-- ✅ Now the table is in 1NF (atomic values, no repeating groups).



/* 
=========================================
 Question 2: Achieving 2NF (Second Normal Form) 🧩
=========================================
 Problem:
 - Table is in 1NF but has a partial dependency.
 - 'CustomerName' depends only on OrderID, not on (OrderID, Product).
 - Violates 2NF (non-key attribute must depend on full primary key).

 Solution:
 - Decompose into two tables:
   1. Orders table (OrderID → CustomerName)
   2. OrderItems table (OrderID, Product, Quantity)
*/

-- Step 1: Create Orders table (no redundancy)
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(100)
);

-- Step 2: Create OrderItems table (each product per order with quantity)
CREATE TABLE OrderItems (
    OrderID INT,
    Product VARCHAR(50),
    Quantity INT,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

-- Step 3: Insert normalized data
INSERT INTO Orders (OrderID, CustomerName)
VALUES
(101, 'John Doe'),
(102, 'Jane Smith'),
(103, 'Emily Clark');

INSERT INTO OrderItems (OrderID, Product, Quantity)
VALUES
(101, 'Laptop', 2),
(101, 'Mouse', 1),
(102, 'Tablet', 3),
(102, 'Keyboard', 1),
(102, 'Mouse', 2),
(103, 'Phone', 1);

-- ✅ Now the schema is in 2NF:
--   - Orders table stores Customer info (depends only on OrderID).
--   - OrderItems table stores product info (depends on both OrderID + Product).
