CREATE DATABASE CustomerDB; 
USE CustomerDB;

CREATE TABLE Customers( 
  CustomerID INT AUTO_INCREMENT PRIMARY KEY, 
  CustomerName VARCHAR(50), 
  City VARCHAR(100)
);

INSERT INTO CustomerDB (CustomerName, City) VALUES

('John Smith', 'New York'), 
('Mary Johnson', 'Chicago'), 
('Peter Adams', 'Los Angeles'), 
('Nancy Miller', 'Houston'), 
('Robert White', 'Miami');


CREATE TABLE Orders( 
   OrderID INT PRIMARY KEY, 
   CustomerID INT, 
   OrderDate DATE, 
   Amount INT 
);

INSERT INTO Orders VALUES

(101,1,'2024-10-01',250),
(102,2,'2024-10-05',300),
(103,1,'2024-10-07',150),
(104,3,'2024-10-10',450),
(105,6,'2024-10-12',400);


CREATE TABLE Payments(
  PaymentID VARCHAR(10) PRIMARY KEY, 
  CustomerID INT, 
  paymentDate DATE,
  Amount INT
);

INSERT INTO Payments (PaymentID, CustomerID, PaymentDate, Amount) VALUE 
('P001', 1, '2024-10-02', 250), 
('P002', 2, '2024-10-06', 300), 
('P003', 3, '2024-10-11', 450), 
('P004', 4, '2024-10-15', 200);

CREATE TABLE EmployeesDB (  
  EmployeeID INT AUTO_INCREMENT PRIMARY KEY, 
  EmployeeName VARCHAR(50), 
  ManagerID INT
);

INSERT INTO EmployeesDB (EmployeeName, ManagerID) VALUE 
('Alex Green', NULL),
('Brian Lee', 1),
('Carol lee', 1),
('David Kim', 2),
('Eva Smith', 2);

USE CustomerDB;

SELECT DISTINCT CustomerName
FROM CustomerDB c INNER JOIN Orders o on c.CustomerID = O.CustomerID;

SELECT DISTINCT CustomerName, OrderID
FROM CustomerDB c RIGHT JOIN Orders o on c.CustomerID = O.CustomerID;

SELECT*
FROM CustomerDB c LEFT JOIN Orders o on c.CustomerID = O.CustomerID
UNION ALL
SELECT*
FROM CustomerDB c RIGHT JOIN Orders o on c.CustomerID = O.CustomerID;

SELECT*
FROM CustomerDB c LEFT JOIN Orders o on c.CustomerID = O.CustomerID
WHERE O.OrderID is NULL;

SELECT*
FROM CustomerDB c INNER JOIN Payments p on c.CustomerID = P.CustomerID
LEFT JOIN Orders o on c.CustomerID = o.CustomerID
WHERE o.OrderID is NULL;

SELECT COUNT(*)
FROM CustomerDB CROSS JOIN Orders;

SELECT*
FROM CustomerDB c LEFT JOIN Orders o on c.CustomerID = O.CustomerID
LEFT JOIN Payments on c.CustomerID = O.CustomerID;

SELECT*
FROM CustomerDB c INNER JOIN Orders o on c.CustomerID = O.CustomerID
INNER JOIN Payments on c.CustomerID = O.CustomerID;
