CREATE DATABASE [asm123]
GO
USE [asm123]
GO

CREATE TABLE Category (
    CategoryID INT PRIMARY KEY IDENTITY(1,1),
    CategoryName NVARCHAR(100) NOT NULL
);

CREATE TABLE Product (
    ProductID INT PRIMARY KEY IDENTITY(1,1),
    ProductCode NVARCHAR(50) NOT NULL,
    ProductName NVARCHAR(100) NOT NULL,
    Price DECIMAL(10, 2) NOT NULL,
    InventoryQuantity INT NOT NULL,
    ProductImage NVARCHAR(MAX),
    CategoryID INT,
    FOREIGN KEY (CategoryID) REFERENCES Category(CategoryID)
);

CREATE TABLE Employee (
    EmployeeID INT PRIMARY KEY IDENTITY(1,1),
    EmployeeCode NVARCHAR(50) NOT NULL,
    EmployeeName NVARCHAR(100) NOT NULL,
    Position NVARCHAR(50),
    AuthorityLevel NVARCHAR(50) NOT NULL,
    Username NVARCHAR(50) NOT NULL UNIQUE,
    Password NVARCHAR(255) NOT NULL,
    PasswordChanged BIT DEFAULT 0
);

CREATE TABLE Customer (
    CustomerID INT PRIMARY KEY IDENTITY(1,1),
    CustomerCode NVARCHAR(50) NOT NULL,
    CustomerName NVARCHAR(100) NOT NULL,
    PhoneNumber NVARCHAR(20),
    Address NVARCHAR(255)
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY IDENTITY(1,1),
    OrderDate DATETIME NOT NULL,
    EmployeeID INT,
    CustomerID INT,
    FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID),
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);

CREATE TABLE OrderDetail (
    OrderDetailID INT PRIMARY KEY IDENTITY(1,1),
    OrderID INT,
    ProductID INT,
    QuantitySold INT NOT NULL,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
);

CREATE TABLE Import (
    ImportID INT PRIMARY KEY IDENTITY(1,1),
    ImportDate DATETIME NOT NULL,
    EmployeeID INT,
    FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID)
);

CREATE TABLE ImportDetail (
    ImportDetailID INT PRIMARY KEY IDENTITY(1,1),
    ImportID INT,
    ProductID INT,
    QuantityImported INT NOT NULL,
    ImportCost DECIMAL(10, 2),
    FOREIGN KEY (ImportID) REFERENCES Import(ImportID),
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
);

INSERT INTO [dbo].[Product]
Values ('p1','Airod1','200000','5','',1),
('p2','Airpod2','300000','10','',1),
('p3','Airpod3','500000','15','',1);


INSERT INTO [dbo].[Category]
VALUES
('Airpod')

INSERT INTO [dbo].[Customer] 
VALUES
('c1', 'To Hieu', '3646357', 'Ha Noi'),
('c2', 'Nguyen Van Anh', '1234567', 'Ha Noi'),
('c3', 'Tran Thi Ban', '7654321', 'Ha Noi'),
('c4', 'Le Van Canh', '9876543', 'Ha Noi'),
('c5', 'Pham Thi Diem', '4567890', 'Ha Noi');

INSERT INTO [dbo].[Orders]
VALUES
('2024-8-6',3,1),
('2024-5-6',3,2),
('2024-5-7',3,3),
('2024-6-6',3,4),
('2024-4-3',3,5);

INSERT INTO [dbo].[OrderDetail]
VALUES
(1,1,'1'),
(2,2,'1'),
(3,3,'2'),
(4,1,'2'),
(5,2,'1');

INSERT INTO [dbo].[Import]
VALUES
('2024-1-2',2),
('2024-1-1',2),
('2024-2-1',2);

INSERT INTO [dbo].[ImportDetail]
VALUES
(1,1,200,150000),
(2,2,300,180000),
(3,3,200,200000);

INSERT INTO [dbo].[Employee] 
VALUES 
('Emp1', 'Nguyen Van A', 'Manager', 'Admin', 'admin1','123456', 1),
('Emp2', 'Nguyen Van B', 'Staff', 'Warehouse Manager', 'warehousemanager1','123456', 1),
('Emp3', 'Nguyen Van C', 'Staff', 'Sale', 'sale1','123456', 1);

