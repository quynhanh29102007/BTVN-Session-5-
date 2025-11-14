CREATE TABLE NhanVien (
MaNV VARCHAR(10),
HoTen VARCHAR(255),
PhongBan VARCHAR(100),
ChucVu VARCHAR(100),
NamSinh INT
);
INSERT INTO NhanVien (MaNV, HoTen, PhongBan, ChucVu, NamSinh) VALUES
('NV01', 'Trần Văn Mạnh', 'Kinh doanh', 'Nhân viên', 1995),
('NV02', 'Lê Thị Hoa', 'Marketing', 'Trưởng phòng', 1990),
('NV03', 'Nguyễn Anh Dũng', 'Kinh doanh', 'Nhân viên', 1998),
('NV04', 'Phạm Thị Lan', 'Nhân sự', 'Chuyên viên', 1992),
('NV05', 'Hoàng Minh Tuấn', 'Kỹ thuật', 'Trưởng nhóm', 1991);
-- 1. Tìm tất cả nhân viên thuộc phòng 'Kinh doanh' VÀ có năm sinh trước năm 1996
select * from NhanVien 
where PhongBan = 'KinhDoanh'
AND NamSinh < '1996';
-- 2. Tìm tất cả nhân viên là 'Trưởng phòng' HOẶC là 'Trưởng nhóm'
select * from NhanVien
where ChucVu = 'Trưởng Phòng' 
OR ChucVu = 'Trưởng Nhóm ';
-- 3. Tìm tất cả nhân viên không thuộc phòng 'Kỹ thuật'
select * from NhanVien
where not PhongBan = 'Kỹ thuật';
-- 4. Tìm tất cả nhân viên thuộc phòng 'Marketing' VÀ có chức vụ là 'Trưởng phòng'
select * from NhanVien
where PhongBan = 'Marketing' 
AND ChucVu = 'Trưởng phòng'