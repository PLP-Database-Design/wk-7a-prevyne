--Question 1:
-- This creates the target table for 1NF
DROP TABLE IF EXISTS ProductDetail_1NF;
CREATE TABLE ProductDetail_1NF (
    OrderID INT,
    CustomerName VARCHAR(100),
    Product VARCHAR(100),
    PRIMARY KEY (OrderID, Product)
);

-- Populate the 1NF table (Simulating a string split for the provided data)
INSERT INTO ProductDetail_1NF (OrderID, CustomerName, Product)
SELECT OrderID, CustomerName, 'Laptop' FROM ProductDetail WHERE OrderID = 101
UNION ALL
SELECT OrderID, CustomerName, 'Mouse' FROM ProductDetail WHERE OrderID = 101
UNION ALL
SELECT OrderID, CustomerName, 'Tablet' FROM ProductDetail WHERE OrderID = 102
UNION ALL
SELECT OrderID, CustomerName, 'Keyboard' FROM ProductDetail WHERE OrderID = 102
UNION ALL
SELECT OrderID, CustomerName, 'Mouse' FROM ProductDetail WHERE OrderID = 102
UNION ALL
SELECT OrderID, CustomerName, 'Phone' FROM ProductDetail WHERE OrderID = 103;

--Question 2:
