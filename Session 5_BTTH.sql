-- Xóa bảng nếu đã tồn tại để đảm bảo dữ liệu sạch
DROP TABLE IF EXISTS Customers;
-- Tạo bảng Khách hàng
CREATE TABLE Customers (
CustomerID INT PRIMARY KEY,
FullName VARCHAR(255),
Email VARCHAR(255),
RegistrationDate DATE,
City VARCHAR(100),
Status VARCHAR(50) -- Ví dụ: 'Active', 'Inactive', 'Potential'
);
-- Chèn dữ liệu mẫu
INSERT INTO Customers (CustomerID, FullName, Email, RegistrationDate, City, Status) VALUES
(1, 'Nguyen Van An', 'an.nguyen@email.com', '2023-01-15', 'Ho Chi Minh', 'Active'),
(2, 'Tran Thi Ba', 'ba.tran@email.com', '2023-02-20', 'Hanoi', 'Active'),
(3, 'Le Van Cuong', 'cuong.le@email.com', '2023-02-25', 'Da Nang', 'Inactive'),
(4, 'Pham Thi Dung', 'dung.pham@email.com', '2023-03-10', 'Hanoi', 'Potential'),
(5, 'Hoang Van Em', 'em.hoang@email.com', '2023-04-01', 'Ho Chi Minh', 'Active');
-- 1. Thêm dữ liệu 
insert into Customers
values(6, 'Ly Thi Giang', 'giang.ly@gmail.com', '2023-05-20', 'Can Tho', 'Potenial');
-- 2. Truy vấn và phan tích dữ liệu
select FullName, Email from Customers;
select distinct City from Customers;
select CustomerID, FullName, Email, RegistrationDate from Customers
order by RegistrationDATE DESC;
select CustomerID, FullName, Email, RegistrationDate, City, CustomerStatus from Customers
where City = 'HaNoi';
select CustomerID, FullName, Email, RegistrationDate, City, CustomerStatus from Customers
where City = 'Ho Chi Minh'
AND status = 'active';
-- 3. Cập nhật và xóa dữ liệu
update Customers 
set CustomerStatus = 'Active'
where CustomerID = 3;
select CustomerID, FullName, CustomerStatus from Customers
where CustomerID = 3;
delete from Customers
where CustomerID = 4 