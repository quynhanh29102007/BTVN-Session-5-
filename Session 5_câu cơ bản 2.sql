CREATE TABLE Sach (
MaSach VARCHAR(10),
TenSach VARCHAR(255),
TacGia VARCHAR(255),
TheLoai VARCHAR(100),
GiaBan INT
);
INSERT INTO Sach (MaSach, TenSach, TacGia, TheLoai, GiaBan) VALUES
('SGK01', 'Đắc Nhân Tâm', 'Dale Carnegie', 'Kỹ năng sống', 120000),
('SVK02', 'Nhà Giả Kim', 'Paulo Coelho', 'Văn học', 89000),
('STN03', 'Lược Sử Loài Người', 'Yuval Noah Harari', 'Lịch sử', 150000),
('SKD04', 'Tư Duy Nhanh và Chậm', 'Daniel Kahneman', 'Kinh doanh', 99000);
-- 1. Cập nhật giá bán của sách Tư duy nhanh và chậm
SET SQL_SAFE_UPDATE = 180000;
update GiaBan 
set GiaBan = '1800000'
where Sach = 'SKD04';
-- 2. Cập nhật tên tác giả
SET SQL_SAFE_UPDATE = 'Paulo Coelho';
update TacGia
set TacGia = 'Paulo Coelho'
where Sach = 'SVK02';
-- 3. Xóa cuốn Đắc Nhân Tâm khỏi bảng
delete from Sách 
where Sách = 'Đắc Nhân Tâm';
-- 4. Hiển thị toàn bộ danh sách còn lại 
select * from Sách 