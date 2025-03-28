	CREATE DATABASE	QuanLiSieuThi
	USE QuanLiSieuThi
	DROP DATABASE QuanLiSieuThi

-- Bảng Nhà cung cấp (Suppliers)
CREATE TABLE Suppliers (
    Supplier_ID INT PRIMARY KEY IDENTITY(1,1),
    Supplier_Name VARCHAR(100) NOT NULL,
    Phone VARCHAR(15),
    Address VARCHAR(200)
);

-- Bảng Sản phẩm (Products)
CREATE TABLE Products (
    Product_ID INT PRIMARY KEY IDENTITY(1,1),
    Product_Name VARCHAR(100) NOT NULL,
    Category VARCHAR(50),
    Price DECIMAL(10, 2) NOT NULL,
    Supplier_ID INT,
    FOREIGN KEY (Supplier_ID) REFERENCES Suppliers(Supplier_ID)
);

-- Bảng Khách hàng (Customers)
CREATE TABLE Customers (
    Customer_ID INT PRIMARY KEY IDENTITY(1,1),
    Customer_Name VARCHAR(100) NOT NULL,
    Phone VARCHAR(15),
    Address VARCHAR(200)
);

-- Bảng Nhân viên (Employees)
CREATE TABLE Employees (
    Employee_ID INT PRIMARY KEY IDENTITY(1,1),
    Employee_Name VARCHAR(100) NOT NULL,
    Position VARCHAR(50),
    Phone VARCHAR(15)
);

-- Bảng Hóa đơn (Invoices)
CREATE TABLE Invoices (
    Invoice_ID INT PRIMARY KEY IDENTITY(1,1),
    Customer_ID INT,
    Employee_ID INT,
    Invoice_Date DATE NOT NULL,
    Total_Amount DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (Customer_ID) REFERENCES Customers(Customer_ID),
    FOREIGN KEY (Employee_ID) REFERENCES Employees(Employee_ID)
);

-- Bảng Chi tiết hóa đơn (Invoice_Details)
CREATE TABLE Invoice_Details (
    Detail_ID INT PRIMARY KEY IDENTITY(1,1),
    Invoice_ID INT,
    Product_ID INT,
    Quantity INT NOT NULL,
    Unit_Price DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (Invoice_ID) REFERENCES Invoices(Invoice_ID),
    FOREIGN KEY (Product_ID) REFERENCES Products(Product_ID)
);

-- Bảng Kho hàng (Inventory)
CREATE TABLE Inventory (
    Inventory_ID INT PRIMARY KEY IDENTITY(1,1),
    Product_ID INT,
    Quantity INT NOT NULL,
    Last_Updated DATE NOT NULL,
    FOREIGN KEY (Product_ID) REFERENCES Products(Product_ID)
);

INSERT INTO Suppliers (Supplier_Name, Phone, Address) VALUES
('Cong ty Thuc pham ABC', '0901234567', '123 Duong Le Loi, TP.HCM'),
('Cong ty Do uong XYZ', '0912345678', '456 Duong Nguyen Hue, Ha Noi'),
('Cong ty Hang gia dung KLM', '0923456789', '789 Duong Tran Hung Dao, Da Nang'),
('Cong ty Sua tuoi DEF', '0934567890', '101 Duong Pham Van Dong, TP.HCM'),
('Cong ty Banh keo GHI', '0945678901', '202 Duong Vo Thi Sau, Ha Noi'),
('Cong ty Rau cu JKL', '0956789012', '303 Duong Dien Bien Phu, Da Nang'),
('Cong ty Do kho MNO', '0967890123', '404 Duong Hai Ba Trung, TP.HCM'),
('Cong ty Nuoc giai khat PQR', '0978901234', '505 Duong Nguyen Trai, Ha Noi'),
('Cong ty Hoa my pham STU', '0989012345', '606 Duong Le Dai Hanh, Da Nang'),
('Cong ty Thuc pham dong lanh VWX', '0990123456', '707 Duong Ly Thuong Kiet, TP.HCM');

SELECT *FROM Suppliers
SELECT *FROM Products
INSERT INTO Products (Product_Name, Category, Price, Supplier_ID) VALUES
('Sua tuoi Vinamilk', 'Thuc pham', 25000, 4),
('Coca Cola 500ml', 'Do uong', 12000, 2),
('Xa phong Lifebuoy', 'Hoa my pham', 35000, 9),
('Banh quy Cosy', 'Banh keo', 45000, 5),
('Khoai tay Da Lat', 'Rau cu', 20000, 6),
('Muc kho 500g', 'Do kho', 150000, 7),
('Nuoc loc Lavie 1L', 'Do uong', 8000, 8),
('Thit bo dong lanh', 'Thuc pham', 250000, 10),
('Dau an Tuong An 1L', 'Thuc pham', 40000, 1),
('Kem danh rang PS', 'Hoa my pham', 30000, 9);


INSERT INTO Customers (Customer_Name, Phone, Address) VALUES
('Nguyen Van A', '0912345678', '123 Duong Nguyen Hue, TP.HCM'),
('Tran Thi B', '0923456789', '456 Duong Le Loi, Ha Noi'),
('Le Van C', '0934567890', '789 Duong Tran Phu, Da Nang'),
('Pham Thi D', '0945678901', '101 Duong Hai Ba Trung, TP.HCM'),
('Hoang Van E', '0956789012', '202 Duong Nguyen Trai, Ha Noi'),
('Ngo Thi F', '0967890123', '303 Duong Dien Bien Phu, Da Nang'),
('Bui Van G', '0978901234', '404 Duong Ly Thuong Kiet, TP.HCM'),
('Do Thi H', '0989012345', '505 Duong Vo Thi Sau, Ha Noi'),
('Vu Van I', '0990123456', '606 Duong Pham Van Dong, Da Nang'),
('Truong Thi J', '0901234567', '707 Duong Le Dai Hanh, TP.HCM');


INSERT INTO Employees (Employee_Name, Position, Phone) VALUES
('Nguyen Thi Lan', 'Thu ngan', '0911111111'),
('Tran Van Hung', 'Quan ly', '0922222222'),
('Le Thi Mai', 'Thu ngan', '0933333333'),
('Pham Van Tam', 'Nhan vien kho', '0944444444'),
('Hoang Thi Ngoc', 'Thu ngan', '0955555555'),
('Ngo Van Binh', 'Nhan vien ban hang', '0966666666'),
('Bui Thi Hoa', 'Thu ngan', '0977777777'),
('Do Van Long', 'Nhan vien kho', '0988888888'),
('Vu Thi Thao', 'Nhan vien ban hang', '0999999999'),
('Truong Van Nam', 'Quan ly', '0900000000');


SELECT *FROM Employees


INSERT INTO Invoices (Customer_ID, Employee_ID, Invoice_Date, Total_Amount) VALUES
(1, 1, '2025-02-01', 82000),
(2, 3, '2025-02-02', 150000),
(3, 5, '2025-02-03', 258000),
(4, 7, '2025-02-04', 45000),
(5, 9, '2025-02-05', 30000),
(6, 2, '2025-02-06', 40000),
(7, 4, '2025-02-07', 12000),
(8, 6, '2025-02-08', 200000),
(9, 8, '2025-02-09', 35000),
(10, 10, '2025-02-10', 8000);


INSERT INTO Invoice_Details (Invoice_ID, Product_ID, Quantity, Unit_Price) VALUES
(1, 1, 2, 25000),  -- Sua tuoi
(1, 7, 4, 8000),   -- Nuoc loc
(2, 6, 1, 150000), -- Muc kho
(3, 8, 1, 250000), -- Thit bo dong lanh
(3, 7, 1, 8000),   -- Nuoc loc
(4, 4, 1, 45000),  -- Banh quy
(5, 10, 1, 30000), -- Kem danh rang
(6, 9, 1, 40000),  -- Dau an
(7, 2, 1, 12000),  -- Coca Cola
(8, 5, 10, 20000); -- Khoai tay



INSERT INTO Inventory (Product_ID, Quantity, Last_Updated) VALUES
(1, 50, '2025-02-20'),  -- Sua tuoi
(2, 100, '2025-02-20'), -- Coca Cola
(3, 30, '2025-02-20'),  -- Xa phong
(4, 40, '2025-02-20'),  -- Banh quy
(5, 200, '2025-02-20'), -- Khoai tay
(6, 15, '2025-02-20'),  -- Muc kho
(7, 300, '2025-02-20'), -- Nuoc loc
(8, 20, '2025-02-20'),  -- Thit bo dong lanh
(9, 60, '2025-02-20'),  -- Dau an
(10, 80, '2025-02-20'); -- Kem danh rang


---------------------------------------------------------------------SỬA CẤU TRÚC BẢNG-----------------------------------------------------------------



--Thêm cột Email kiểu varchar(100) vào bảng Employees:
alter table Employees
add Email varchar(50);


--Đổi kiểu dữ liệu cột Salary từ INT thành DECIMAL(10,2):
alter table Employees
alter column Salary decimal(10,2);

--Xóa cột Phone khỏi bảng Employees.
alter table Employees
drop column Phone;


--Thêm khóa chính cho cột EmployeeID trong bảng Employees.
alter table Employees
add constraint PK_Employees PRIMARY KEY (EmployeeID);

--Thêm khóa ngoại cho cột CustomerID trong bảng Invoices, tham chiếu đến bảng Customers.
alter table Invoices
add constraint FK_Invoices_Customers FOREIGN KEY (CustomerID) references Customers(CustomerID);

--Xóa ràng buộc khóa chính PK_Employees.
alter table Employees drop constraint PK_Employees;

--Tắt kiểm tra khóa ngoại FK_Invoices_Customers.
alter table Invoices nocheck constraint FK_Invoices_Customers;

--Xóa cột Phone trong table Employees.
alter table Employees drop column Phone;

--Xóa bảng Employees
drop table Employees;

--Đổi tên cột
alter table Employees add NewName varchar(100); --Tạo cột mới với tên mong muốn.
update Employees set NewName = Phone; --Sao chép dữ liệu từ cột cũ sang.
alter table Employees drop column OldName; -- Xóa cột cũ.

--đổi tên bảng Employees thành Staff
sp_rename 'Employees', 'Staff';


--cập nhật lương của nhân viên có EmployeeID là 1 thành 50,000:
UPDATE Employees
SET Salary = 50000
WHERE EmployeeID = 1;

--thay đổi tên và họ EmployeeID là 1 thành Doe
UPDATE Employees
SET FirstName = 'John', LastName = 'Doe'
WHERE EmployeeID = 1;

--tính toán giá trị mới cho Salary
UPDATE Employees
SET Salary = Salary + 1000
WHERE Department = 'Sales';

--Đặt ManagerID cho nhân viên phòng 'Marketing' thành EmployeeID của người có họ là 'Smith':
UPDATE Employees
SET ManagerID = (SELECT EmployeeID FROM Employees WHERE LastName = 'Smith')
WHERE Department = 'Marketing';


--------------------------------------------------------------------------------VIEW VÀ INDEX-------------------------------------------------------------------------

--View để hiển thị thông tin hóa đơn cùng với thông tin khách hàng và nhân viên.
CREATE VIEW InvoiceDetailsView AS
SELECT 
    i.Invoice_ID,
    i.Invoice_Date,
    c.Customer_Name,
    e.Employee_Name,
    i.Total_Amount
FROM 
    Invoices i
JOIN 
    Customers c ON i.Customer_ID = c.Customer_ID
JOIN 
    Employees e ON i.Employee_ID = e.Employee_ID;

SELECT * FROM InvoiceDetailsView;--Hiện thị table view

-- hiển thị một số dòng cụ thể hoặc áp dụng điều kiện
SELECT * FROM InvoiceDetailsView
WHERE Invoice_Date > '2025-02-05'
ORDER BY Invoice_Date DESC;

-- View để xem thông tin nhà cung cấp
CREATE VIEW vw_SupplierInfo AS
SELECT Supplier_ID, Supplier_Name, Phone, Address
FROM Suppliers;

-- View để xem thông tin hàng tồn kho
CREATE VIEW vw_InventoryInfo AS
SELECT i.Inventory_ID, p.Product_Name, inv.Quantity, inv.Last_Updated
FROM Inventory inv
JOIN Products p ON inv.Product_ID = p.Product_ID;

-- View để xem doanh thu theo ngày
CREATE VIEW vw_DailySales AS
SELECT Invoice_Date, SUM(Total_Amount) AS Total_Sales
FROM Invoices
GROUP BY Invoice_Date;

-- View để xem tổng số sản phẩm theo nhà cung cấp
CREATE VIEW vw_ProductCountBySupplier AS
SELECT s.Supplier_Name, COUNT(p.Product_ID) AS Product_Count
FROM Suppliers s
LEFT JOIN Products p ON s.Supplier_ID = p.Supplier_ID
GROUP BY s.Supplier_Name;

-- View để xem thông tin khách hàng
CREATE VIEW vw_CustomerInfo AS
SELECT Customer_ID, Customer_Name, Phone, Address
FROM Customers;

-- View để xem thông tin nhân viên
CREATE VIEW vw_EmployeeInfo AS
SELECT Employee_ID, Employee_Name, Position, Phone
FROM Employees;

-- View để xem thông tin sản phẩm kèm theo nhà cung cấp
CREATE VIEW vw_ProductSupplier AS
SELECT p.Product_ID, p.Product_Name, p.Price, s.Supplier_Name
FROM Products p
JOIN Suppliers s ON p.Supplier_ID = s.Supplier_ID;

-- View để xem hóa đơn kèm thông tin khách hàng và nhân viên
CREATE VIEW vw_InvoiceDetails AS
SELECT i.Invoice_ID, c.Customer_Name, e.Employee_Name, i.Invoice_Date, i.Total_Amount
FROM Invoices i
JOIN Customers c ON i.Customer_ID = c.Customer_ID
JOIN Employees e ON i.Employee_ID = e.Employee_ID;

-- View để xem chi tiết hóa đơn kèm theo sản phẩm
CREATE VIEW vw_InvoiceProductDetails AS
SELECT id.Detail_ID, i.Invoice_ID, p.Product_Name, id.Quantity, id.Unit_Price
FROM Invoice_Details id
JOIN Invoices i ON id.Invoice_ID = i.Invoice_ID
JOIN Products p ON id.Product_ID = p.Product_ID;

--Index cho bảng Products trên cột Supplier_ID để cải thiện hiệu suất truy vấn.
CREATE INDEX IDX_Products_Supplier ON Products(Supplier_ID);

--Index cho bảng Invoices trên cột Invoice_Date để tăng tốc độ tìm kiếm theo ngày hóa đơn.
CREATE INDEX IDX_Invoices_Date ON Invoices(Invoice_Date);

-- Index cho cột Supplier_Name trong bảng Suppliers
CREATE INDEX idx_Supplier_Name ON Suppliers(Supplier_Name);

-- Index cho cột Product_Name trong bảng Products
CREATE INDEX idx_Product_Name ON Products(Product_Name);

-- Index cho cột Customer_Name trong bảng Customers
CREATE INDEX idx_Customer_Name ON Customers(Customer_Name);

-- Index cho cột Employee_Name trong bảng Employees
CREATE INDEX idx_Employee_Name ON Employees(Employee_Name);

-- Index cho cột Invoice_Date trong bảng Invoices
CREATE INDEX idx_Invoice_Date ON Invoices(Invoice_Date);

-- Index cho cột Total_Amount trong bảng Invoices
CREATE INDEX idx_Total_Amount ON Invoices(Total_Amount);

-- Index cho cột Product_ID trong bảng Invoice_Details
CREATE INDEX idx_Product_ID ON Invoice_Details(Product_ID);

-- Index cho cột Invoice_ID trong bảng Invoice_Details
CREATE INDEX idx_Invoice_ID ON Invoice_Details(Invoice_ID);

-- Index cho cột Product_ID trong bảng Inventory
CREATE INDEX idx_Inventory_Product_ID ON Inventory(Product_ID);

-- Index cho cột Last_Updated trong bảng Inventory
CREATE INDEX idx_Last_Updated ON Inventory(Last_Updated);



----------------------------------------------------------------THỦ TỤC(STORED PROCUDURE)--------------------------------------------------------------------------

--Thủ tục tìm khách hàng mua hàng với tổng giá trị nhiều nhất
CREATE PROCEDURE GetTopCustomer
AS
BEGIN
    SELECT TOP 1
        c.Customer_ID, 
        c.Customer_Name,
        SUM(ii.Unit_Price) AS Total_Quantity
    FROM 
        Customers c
    JOIN 
        Invoices i ON c.Customer_ID = i.Customer_ID
    JOIN 
        Invoice_Details ii ON i.Invoice_ID = ii.Invoice_ID
    GROUP BY 
        c.Customer_ID, c.Customer_Name
    ORDER BY 
        Total_Quantity DESC;
END;
DROP PROCEDURE GetTopCustomer;--Xóa thủ tục
EXEC GetTopCustomer;--Gọi thủ tục


--2. Thêm nhà cung cấp
CREATE PROCEDURE AddSupplier
    @Supplier_Name VARCHAR(100),
    @Phone VARCHAR(15),
    @Address VARCHAR(200)
AS
BEGIN
    INSERT INTO Suppliers (Supplier_Name, Phone, Address)
    VALUES (@Supplier_Name, @Phone, @Address);
END;


--2. Cập nhật thông tin nhà cung cấp
CREATE PROCEDURE UpdateSupplier
    @Supplier_ID INT,
    @Supplier_Name VARCHAR(100),
    @Phone VARCHAR(15),
    @Address VARCHAR(200)
AS
BEGIN
    UPDATE Suppliers
    SET Supplier_Name = @Supplier_Name,
        Phone = @Phone,
        Address = @Address
    WHERE Supplier_ID = @Supplier_ID;
END;

--3. Cập nhật thông tin nhà cung cấp
CREATE PROCEDURE UpdateSupplier
    @Supplier_ID INT,
    @Supplier_Name VARCHAR(100),
    @Phone VARCHAR(15),
    @Address VARCHAR(200)
AS
BEGIN
    UPDATE Suppliers
    SET Supplier_Name = @Supplier_Name,
        Phone = @Phone,
        Address = @Address
    WHERE Supplier_ID = @Supplier_ID;
END;

--4. Xóa nhà cung cấp
CREATE PROCEDURE DeleteSupplier
    @Supplier_ID INT
AS
BEGIN
    DELETE FROM Suppliers WHERE Supplier_ID = @Supplier_ID;
END;
--5.  Thêm sản phẩm
CREATE PROCEDURE AddProduct
    @Product_Name VARCHAR(100),
    @Category VARCHAR(50),
    @Price DECIMAL(10, 2),
    @Supplier_ID INT
AS
BEGIN
    INSERT INTO Products (Product_Name, Category, Price, Supplier_ID)
    VALUES (@Product_Name, @Category, @Price, @Supplier_ID);
END;



--6. Cập nhật thông tin sản phẩm
CREATE PROCEDURE UpdateProduct
    @Product_ID INT,
    @Product_Name VARCHAR(100),
    @Category VARCHAR(50),
    @Price DECIMAL(10, 2),
    @Supplier_ID INT
AS
BEGIN
    UPDATE Products
    SET Product_Name = @Product_Name,
        Category = @Category,
        Price = @Price,
        Supplier_ID = @Supplier_ID
    WHERE Product_ID = @Product_ID;
END;

--7.Xóa sản phẩm
CREATE PROCEDURE DeleteProduct
    @Product_ID INT
AS
BEGIN
    DELETE FROM Products WHERE Product_ID = @Product_ID;
END;

--8.Thêm khách hàng
CREATE PROCEDURE AddCustomer
    @Customer_Name VARCHAR(100),
    @Phone VARCHAR(15),
    @Address VARCHAR(200)
AS
BEGIN
    INSERT INTO Customers (Customer_Name, Phone, Address)
    VALUES (@Customer_Name, @Phone, @Address);
END;

--9.Cập nhật thông tin khách hàng
CREATE PROCEDURE UpdateCustomer
    @Customer_ID INT,
    @Customer_Name VARCHAR(100),
    @Phone VARCHAR(15),
    @Address VARCHAR(200)
AS
BEGIN
    UPDATE Customers
    SET Customer_Name = @Customer_Name,
        Phone = @Phone,
        Address = @Address
    WHERE Customer_ID = @Customer_ID;
END;

--10.Xóa khách hàng
CREATE PROCEDURE DeleteCustomer
    @Customer_ID INT
AS
BEGIN
    DELETE FROM Customers WHERE Customer_ID = @Customer_ID;
END;
----------------------------------------------------------------------CON TRỎ------------------------------------------------------------------------------------

--sử dụng con trỏ để hiển thị tên khách hàng từ bảng Customers.
DECLARE @CustomerName NVARCHAR(100);
DECLARE customer_cursor CURSOR FOR
SELECT Customer_Name FROM Customers;

OPEN customer_cursor;

FETCH NEXT FROM customer_cursor INTO @CustomerName;

WHILE @@FETCH_STATUS = 0
BEGIN
    PRINT @CustomerName; 
    FETCH NEXT FROM customer_cursor INTO @CustomerName;
END

CLOSE customer_cursor;
DEALLOCATE customer_cursor;

--Hàm tính tổng giá trị đơn hàng dựa trên Invoice_ID.
CREATE FUNCTION GetTotalInvoiceValue (@InvoiceID INT)
RETURNS DECIMAL(10, 2)
AS
BEGIN
    DECLARE @Total DECIMAL(10, 2);
    
    SELECT @Total = SUM(Quantity * Unit_Price)
    FROM Invoice_Details
    WHERE Invoice_ID = @InvoiceID;

    RETURN @Total;
END;

SELECT Invoice_ID, dbo.GetTotalInvoiceValue(Invoice_ID) AS TotalValue
FROM Invoices;

 --Thêm nhà cung cấp mới
CREATE PROCEDURE sp_AddSupplier
    @Supplier_Name VARCHAR(100),
    @Phone VARCHAR(15),
    @Address VARCHAR(200)
AS
BEGIN
    INSERT INTO Suppliers (Supplier_Name, Phone, Address)
    VALUES (@Supplier_Name, @Phone, @Address);
END;

--Cập nhật thông tin nhà cung cấp
CREATE PROCEDURE sp_UpdateSupplier
    @Supplier_ID INT,
    @Supplier_Name VARCHAR(100),
    @Phone VARCHAR(15),
    @Address VARCHAR(200)
AS
BEGIN
    UPDATE Suppliers
    SET Supplier_Name = @Supplier_Name,
        Phone = @Phone,
        Address = @Address
    WHERE Supplier_ID = @Supplier_ID;
END;

--Xóa nhà cung cấp
CREATE PROCEDURE sp_DeleteSupplier
    @Supplier_ID INT
AS
BEGIN
    DELETE FROM Suppliers
    WHERE Supplier_ID = @Supplier_ID;
END;

--Thêm sản phẩm mới
CREATE PROCEDURE sp_AddProduct
    @Product_Name VARCHAR(100),
    @Category VARCHAR(50),
    @Price DECIMAL(10, 2),
    @Supplier_ID INT
AS
BEGIN
    INSERT INTO Products (Product_Name, Category, Price, Supplier_ID)
    VALUES (@Product_Name, @Category, @Price, @Supplier_ID);
END;

--Cập nhật thông tin sản phẩm
CREATE PROCEDURE sp_UpdateProduct
    @Product_ID INT,
    @Product_Name VARCHAR(100),
    @Category VARCHAR(50),
    @Price DECIMAL(10, 2),
    @Supplier_ID INT
AS
BEGIN
    UPDATE Products
    SET Product_Name = @Product_Name,
        Category = @Category,
        Price = @Price,
        Supplier_ID = @Supplier_ID
    WHERE Product_ID = @Product_ID;
END;

--Thêm hóa đơn mới
CREATE PROCEDURE sp_AddInvoice
    @Customer_ID INT,
    @Employee_ID INT,
    @Invoice_Date DATE,
    @Total_Amount DECIMAL(10, 2)
AS
BEGIN
    INSERT INTO Invoices (Customer_ID, Employee_ID, Invoice_Date, Total_Amount)
    VALUES (@Customer_ID, @Employee_ID, @Invoice_Date, @Total_Amount);
END;

--Thêm chi tiết hóa đơn
CREATE PROCEDURE sp_AddInvoiceDetail
    @Invoice_ID INT,
    @Product_ID INT,
    @Quantity INT,
    @Unit_Price DECIMAL(10, 2)
AS
BEGIN
    INSERT INTO Invoice_Details (Invoice_ID, Product_ID, Quantity, Unit_Price)
    VALUES (@Invoice_ID, @Product_ID, @Quantity, @Unit_Price);
END;

--Lấy thông tin hóa đơn theo ID
CREATE PROCEDURE sp_GetInvoiceByID
    @Invoice_ID INT
AS
BEGIN
    SELECT * FROM Invoices
    WHERE Invoice_ID = @Invoice_ID;
END;

--Lấy danh sách sản phẩm theo nhà cung cấp
CREATE PROCEDURE sp_GetProductsBySupplier
    @Supplier_ID INT
AS
BEGIN
    SELECT * FROM Products
    WHERE Supplier_ID = @Supplier_ID;
END;

-- 10. Lấy tổng doanh thu theo ngày
CREATE PROCEDURE sp_GetTotalSalesByDate
    @Invoice_Date DATE
AS
BEGIN
    SELECT SUM(Total_Amount) AS Total_Sales
    FROM Invoices
    WHERE Invoice_Date = @Invoice_Date;
END;
  
  ---------------------------------------------------------------------------TRIGGER--------------------------------------------------------------------------



/*
-Khi một chi tiết hóa đơn mới được thêm vào bảng Invoice_Details, trigger này sẽ:
-Kiểm tra xem số lượng sản phẩm trong kho (Inventory) có đủ để đáp ứng số lượng bán hay không.
-Nếu đủ, giảm số lượng sản phẩm trong kho và cập nhật ngày sửa đổi cuối cùng (Last_Updated).
-Nếu không đủ, hủy giao dịch và báo lỗi.
*/
CREATE TRIGGER trg_AfterInsert_InvoiceDetails
ON Invoice_Details
AFTER INSERT
AS
BEGIN
    -- Kiểm tra xem có sản phẩm nào không đủ hàng không
    IF EXISTS (
        SELECT 1
        FROM inserted i
        JOIN Inventory inv ON i.Product_ID = inv.Product_ID
        WHERE inv.Quantity < i.Quantity
    )
    BEGIN
        RAISERROR ('Không đủ hàng trong kho cho một số sản phẩm.', 16, 1);
        ROLLBACK TRANSACTION;
        RETURN;
    END

    -- Cập nhật tồn kho
    UPDATE inv
    SET inv.Quantity = inv.Quantity - i.Quantity,
        inv.Last_Updated = GETDATE()
    FROM Inventory inv
    INNER JOIN inserted i ON inv.Product_ID = i.Product_ID;
END;

--Tự động cập nhật cột Total_Amount trong bảng Invoices khi có thay đổi trong Invoice_Details (thêm, xóa, hoặc sửa chi tiết hóa đơn).
CREATE TRIGGER trg_AfterInsert_InvoiceDetails_UpdateTotal
ON Invoice_Details
AFTER INSERT
AS
BEGIN
    UPDATE inv
    SET inv.Total_Amount = inv.Total_Amount + (i.Quantity * i.Unit_Price)
    FROM Invoices inv
    INNER JOIN inserted i ON inv.Invoice_ID = i.Invoice_ID;
END;

--Trigger khi xóa chi tiết hóa đơn
CREATE TRIGGER trg_AfterDelete_InvoiceDetails_UpdateTotal
ON Invoice_Details
AFTER DELETE
AS
BEGIN
    UPDATE inv
    SET inv.Total_Amount = inv.Total_Amount - (d.Quantity * d.Unit_Price)
    FROM Invoices inv
    INNER JOIN deleted d ON inv.Invoice_ID = d.Invoice_ID;
END;

--Trigger khi sửa chi tiết hóa đơn
CREATE TRIGGER trg_AfterUpdate_InvoiceDetails_UpdateTotal
ON Invoice_Details
AFTER UPDATE
AS
BEGIN
    UPDATE inv
    SET inv.Total_Amount = inv.Total_Amount - (d.Quantity * d.Unit_Price) + (i.Quantity * i.Unit_Price)
    FROM Invoices inv
    INNER JOIN deleted d ON inv.Invoice_ID = d.Invoice_ID
    INNER JOIN inserted i ON inv.Invoice_ID = i.Invoice_ID AND d.Detail_ID = i.Detail_ID;
END;

--Trigger ghi log hoạt động trên bảng Products
--Ghi lại các hoạt động thêm, xóa, sửa trên bảng Products vào một bảng log để theo dõi lịch sử.
--Tạo bảng log
CREATE TABLE Log_Products (
    Log_ID INT PRIMARY KEY IDENTITY(1,1),
    Action VARCHAR(10),  -- INSERT, UPDATE, DELETE
    Product_ID INT,
    Product_Name VARCHAR(100),
    Category VARCHAR(50),
    Price DECIMAL(10, 2),
    Supplier_ID INT,
    Log_Date DATETIME DEFAULT GETDATE()
);

--Trigger khi thêm sản phẩm
CREATE TRIGGER trg_AfterInsert_Products_Log
ON Products
AFTER INSERT
AS
BEGIN
    INSERT INTO Log_Products (Action, Product_ID, Product_Name, Category, Price, Supplier_ID)
    SELECT 'INSERT', i.Product_ID, i.Product_Name, i.Category, i.Price, i.Supplier_ID
    FROM inserted i;
END;

--Trigger khi xóa sản phẩm
CREATE TRIGGER trg_AfterDelete_Products_Log
ON Products
AFTER DELETE
AS
BEGIN
    INSERT INTO Log_Products (Action, Product_ID, Product_Name, Category, Price, Supplier_ID)
    SELECT 'DELETE', d.Product_ID, d.Product_Name, d.Category, d.Price, d.Supplier_ID
    FROM deleted d;
END;

--Trigger khi sửa sản phẩm
CREATE TRIGGER trg_AfterUpdate_Products_Log
ON Products
AFTER UPDATE
AS
BEGIN
    INSERT INTO Log_Products (Action, Product_ID, Product_Name, Category, Price, Supplier_ID)
    SELECT 'UPDATE', i.Product_ID, i.Product_Name, i.Category, i.Price, i.Supplier_ID
    FROM inserted i;
END
------------------------------------------------------------------BẢO MẬT CƠ SỞ DỮ LIỆU----------------------------------------------------------------------------------

-----------------------------------------------------TRANSPARENT DATA ENCRYPTION (TDE)---------------------------------------------------------

-- Bước 1: Kiểm tra và tạo Master Key nếu chưa tồn tại
USE master;
GO

IF NOT EXISTS (SELECT * FROM sys.symmetric_keys WHERE name = '##MS_DatabaseMasterKey##')
BEGIN
    CREATE MASTER KEY ENCRYPTION BY PASSWORD = 'blthqtcsdl';
    PRINT 'Master Key da duoc tao.';
END
ELSE
BEGIN
    PRINT 'Master Key da ton tại, bo qua buoc tao.';
END
GO

-- Bước 2: Kiểm tra và tạo chứng chỉ nếu chưa tồn tại
IF NOT EXISTS (SELECT * FROM sys.certificates WHERE name = 'MyTDECert')
BEGIN
    CREATE CERTIFICATE MyTDECert
    WITH SUBJECT = 'TDE Certificate';
    PRINT 'Certificate MyTDECert da duoc tao.';
END
ELSE
BEGIN
    PRINT 'Certificate MyTDECert da ton tai .bo qua buoc tao.';
END
GO

USE QuanLisieuthi;
GO

-- Bước 4: Tạo Database Khóa Mã Hóa (DEK) với cú pháp đúng
IF NOT EXISTS (SELECT * FROM sys.dm_database_encryption_keys WHERE database_id = DB_ID('QuanLisieuthi'))
BEGIN
    CREATE DATABASE ENCRYPTION KEY
    WITH ALGORITHM = AES_256
    ENCRYPTION BY SERVER CERTIFICATE MyTDECert;
    PRINT 'Database Encryption Key da duoc tao.';
END
ELSE
BEGIN
    PRINT 'Database Encryption Key da ton tai, bo qua buoc tao.';
END
GO

-- Bước 5: Bật mã hóa TDE(Bảo vệ dữ liệu nhạy cảm)
ALTER DATABASE QuanLisieuthi
SET ENCRYPTION ON;
GO

-- Bước 6: Kiểm tra trạng thái mã hóa
SELECT db.name AS DatabaseName,
       db.is_encrypted AS IsEncrypted,
       dek.encryption_state_desc AS EncryptionState
FROM sys.databases db
LEFT JOIN sys.dm_database_encryption_keys dek
    ON db.database_id = dek.database_id
WHERE db.name = 'QuanLisieuthi';
GO


 ------------------------------------------------------------------------MÃ HÓA DỮ LIỆU------------------------------------------------



-- Bước 1: Sao lưu dữ liệu bảng Customers để tránh mất dữ liệu
SELECT * INTO Customers_Backup FROM Customers;

-- Bước 2: Thêm cột tạm thời Phone_Encrypted kiểu VARBINARY để lưu dữ liệu mã hóa
ALTER TABLE Customers ADD Phone_Encrypted VARBINARY(256);

-- Bước 3: Mã hóa dữ liệu từ cột Phone (VARCHAR) và lưu vào cột Phone_Encrypted
UPDATE Customers
SET Phone_Encrypted = ENCRYPTBYPASSPHRASE('12345678', Phone);

-- Bước 4: Xóa cột Phone cũ và đổi tên Phone_Encrypted thành Phone
ALTER TABLE Customers DROP COLUMN Phone;
EXEC sp_rename 'Customers.Phone_Encrypted', 'Phone', 'COLUMN';

-- Bước 5: Ví dụ thêm bản ghi mới với số điện thoại đã mã hóa
INSERT INTO Customers (Customer_Name, Phone, Address)
VALUES ('Khách hàng mới', ENCRYPTBYPASSPHRASE('12345678', '098-765-4321'), 'Địa chỉ mới');

-- Bước 6: Ví dụ cập nhật số điện thoại đã mã hóa cho một bản ghi
UPDATE Customers
SET Phone = ENCRYPTBYPASSPHRASE('12345678', '098-765-4321')
WHERE Customer_ID = 1;

-- Bước 7: Ví dụ truy vấn để xem dữ liệu đã giải mã
SELECT 
    Customer_ID,
    Customer_Name,
    CAST(DECRYPTBYPASSPHRASE('12345678', Phone) AS VARCHAR(15)) AS DecryptedPhone,
    Address
FROM Customers;

DROP TABLE Customers_Backup;


--Phân quyền người dùng trong cơ sở dữ liệu 
--1. Tạo người dùng

-- Tạo tài khoản đăng nhập
CREATE LOGIN [NQT123] WITH PASSWORD = '1223';

-- Chọn cơ sở dữ liệu
USE QuanLiSieuThi;

-- Tạo người dùng
CREATE USER [QuangTrung] FOR LOGIN [NQT123];

-- Tạo vai trò nếu chưa có
CREATE ROLE [YourRoleName];

-- Gán quyền cho vai trò
GRANT SELECT ON Products TO [YourRoleName];


USE QuanLiSieuThi; -- Thay YourDatabaseName bằng tên cơ sở dữ liệu của bạn

SELECT name AS UserName, type_desc AS UserType
FROM sys.database_principals
WHERE type IN ('S', 'U') -- 'S': SQL User, 'U': Windows User
ORDER BY name;



----------------------------------------------------------------------TẠO LƯỢC ĐỒ------------------------------------------------------------


-- Tạo lược đồ SupplyChain
CREATE SCHEMA SupplyChain;

-- Tạo Bảng Nhà cung cấp (Suppliers)
CREATE TABLE SupplyChain.Suppliers (
    Supplier_ID INT PRIMARY KEY IDENTITY(1,1),
    Supplier_Name VARCHAR(100) NOT NULL,
    Phone VARCHAR(15),
    Address VARCHAR(200)
);

-- Tạo Bảng Sản phẩm (Products)
CREATE TABLE SupplyChain.Products (
    Product_ID INT PRIMARY KEY IDENTITY(1,1),
    Product_Name VARCHAR(100) NOT NULL,
    Category VARCHAR(50),
    Price DECIMAL(10, 2) NOT NULL,
    Supplier_ID INT,
    FOREIGN KEY (Supplier_ID) REFERENCES SupplyChain.Suppliers(Supplier_ID)
);

-- Tạo Bảng Khách hàng (Customers)
CREATE TABLE SupplyChain.Customers (
    Customer_ID INT PRIMARY KEY IDENTITY(1,1),
    Customer_Name VARCHAR(100) NOT NULL,
    Phone VARCHAR(15),
    Address VARCHAR(200)
);

-- Tạo Bảng Nhân viên (Employees)
CREATE TABLE SupplyChain.Employees (
    Employee_ID INT PRIMARY KEY IDENTITY(1,1),
    Employee_Name VARCHAR(100) NOT NULL,
    Position VARCHAR(50),
    Phone VARCHAR(15)
);

-- Tạo Bảng Hóa đơn (Invoices)
CREATE TABLE SupplyChain.Invoices (
    Invoice_ID INT PRIMARY KEY IDENTITY(1,1),
    Customer_ID INT,
    Employee_ID INT,
    Invoice_Date DATE NOT NULL,
    Total_Amount DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (Customer_ID) REFERENCES SupplyChain.Customers(Customer_ID),
    FOREIGN KEY (Employee_ID) REFERENCES SupplyChain.Employees(Employee_ID)
);

-- Tạo Bảng Chi tiết hóa đơn (Invoice_Details)
CREATE TABLE SupplyChain.Invoice_Details (
    Detail_ID INT PRIMARY KEY IDENTITY(1,1),
    Invoice_ID INT,
    Product_ID INT,
    Quantity INT NOT NULL,
    Unit_Price DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (Invoice_ID) REFERENCES SupplyChain.Invoices(Invoice_ID),
    FOREIGN KEY (Product_ID) REFERENCES SupplyChain.Products(Product_ID)
);

-- Tạo Bảng Kho hàng (Inventory)
CREATE TABLE SupplyChain.Inventory (
    Inventory_ID INT PRIMARY KEY IDENTITY(1,1),
    Product_ID INT,
    Quantity INT NOT NULL,
    Last_Updated DATE NOT NULL,
    FOREIGN KEY (Product_ID) REFERENCES SupplyChain.Products(Product_ID)
);

SELECT * 
FROM information_schema.tables 
WHERE table_schema = 'SupplyChain';

DROP TABLE SupplyChain.Invoice_Details;
DROP TABLE SupplyChain.Invoices;
DROP TABLE SupplyChain.Inventory;
DROP TABLE SupplyChain.Products;
DROP TABLE SupplyChain.Customers;
DROP TABLE SupplyChain.Employees;
DROP TABLE SupplyChain.Suppliers;
DROP SCHEMA SupplyChain

--tạo view trong lược đồ
CREATE VIEW SupplyChain.CustomerInvoices AS
SELECT 
    c.Customer_Name,
    i.Invoice_ID,
    i.Invoice_Date,
    i.Total_Amount
FROM 
    SupplyChain.Customers c
JOIN 
    SupplyChain.Invoices i ON c.Customer_ID = i.Customer_ID;

SELECT * FROM SupplyChain.CustomerInvoices;



--------------------------------------------------------------------PHÂN QUYỀN VÀ BẢO MẬT VỚI LƯỢC ĐỒ-----------------------------------------------------------------


--1. Tạo Lược Đồ:
CREATE SCHEMA Sale;
--2. Tạo Bảng trong Lược Đồ:
CREATE TABLE Sale.Orders (
    Order_ID INT PRIMARY KEY,
    Customer_Name VARCHAR(100),
    Order_Date DATETIME,
    Total_Amount DECIMAL(10, 2)
);
--3. Tạo Người Dùng:
CREATE LOGIN SaleLogin WITH PASSWORD = '12345678';

CREATE USER User2 FOR LOGIN SaleLogin;

--4. Cấp Quyền Truy Cập:
-- Cấp quyền SELECT
GRANT SELECT ON SCHEMA::Sale TO User2;

-- Cấp quyền INSERT
GRANT INSERT ON SCHEMA::Sale TO User2;

-- Cấp quyền UPDATE
GRANT UPDATE ON SCHEMA::Sale TO User2;

-- Cấp quyền DELETE
GRANT DELETE ON SCHEMA::Sale TO User2;


EXECUTE AS USER = 'User2';
SELECT HAS_PERMS_BY_NAME('Sales.Orders', 'OBJECT', 'SELECT') AS CanSelect;
REVERT;


--1. Tạo Vai Trò Mới
USE QuanLiSieuThi; -- Thay đổi tên cơ sở dữ liệu
GO

CREATE ROLE SalesRole;

--2. Cấp Quyền Truy Cập cho Vai Trò
-- Cấp quyền SELECT
GRANT SELECT ON SCHEMA::Sales TO SalesRole;

-- Cấp quyền INSERT
GRANT INSERT ON SCHEMA::Sales TO SalesRole;

-- Cấp quyền UPDATE
GRANT UPDATE ON SCHEMA::Sales TO SalesRole;

-- Cấp quyền DELETE
GRANT DELETE ON SCHEMA::Sales TO SalesRole;


--3. Thêm Người Dùng vào Vai Trò
EXEC sp_addrolemember 'SalesRole', 'QuangTrung';


---------------------------------------ỦY QUYỀN TRONG SQL SERVER--------------------------------------------------------------------------------------------
--Cấp quyền SELECT cho người dùng QuangTrung trên bảng Orders.
GRANT SELECT ON dbo.Customers TO QuangTrung;
--Cấp quyền INSERT cho vai trò SalesRole trên bảng Products.
GRANT INSERT ON dbo.Products TO SalesRole;
--Cấp quyền truy cập toàn bộ lược đồ Sales cho người dùng SalesUser.
GRANT SELECT, INSERT, UPDATE, DELETE ON SCHEMA::Sales TO SalesRole;





----------------------------------------------THU HỒI QUYỀN VÀ XÓA VAI TRÒ-------------------------------------------------------------------

--Thu hồi quyền SELECT từ người dùng QuangTrung trên bảng Orders.
REVOKE SELECT ON dbo.Customers FROM QuangTrung;

--Xóa vai trò SalesRole
DROP ROLE SalesRole;

--Xóa Người Dùng Khỏi Vai Trò:
EXEC sp_droprolemember 'SalesRole', 'QuangTrung'; -- Thay đổi 'UserName' thành tên người dùng






--------------------------------------------------KIỂM TRA QUYỀN VÀ VAI TRÒ---------------------------------------------------------
--2. Kiểm Tra Các Vai Trò của Người Dùng
SELECT 
    dp.name AS UserName,
    dr.name AS RoleName
FROM 
    sys.database_role_members drm
JOIN 
    sys.database_principals dp ON drm.member_principal_id = dp.principal_id
JOIN 
    sys.database_principals dr ON drm.role_principal_id = dr.principal_id
WHERE 
    dp.name = 'QuangTrung'; 






