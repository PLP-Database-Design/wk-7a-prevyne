ls--Question 1:
-- This creates the target table for 1NF
DROP TABLE IF EXISTS ProductDetail;
CREATE TABLE ProductDetail (
    OrderID INT,
    CustomerName VARCHAR(100),
    Product VARCHAR(100),
    PRIMARY KEY (OrderID, Product)
);

-- Populate the 1NF table (Simulating a string split for the provided data)
INSERT INTO ProductDetail (OrderID, CustomerName, Product)
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
-- Create the 'Orders' table for 2NF
DROP TABLE IF EXISTS Orders;
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(100)
);

-- Create the 'OrderItems' table for 2NF
DROP TABLE IF EXISTS OrderItems;
CREATE TABLE OrderItems (
    OrderID INT,
    Product VARCHAR(100),
    Quantity INT,
    PRIMARY KEY (OrderID, Product),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

-- Populate the 'Orders' table
INSERT INTO Orders (OrderID, CustomerName)
SELECT DISTINCT OrderID, CustomerName
FROM OrderDetails;

-- Populate the 'OrderItems' table
INSERT INTO OrderItems (OrderID, Product, Quantity)
SELECT OrderID, Product, Quantity
FROM OrderDetails;
