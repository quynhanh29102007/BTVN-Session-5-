CREATE TABLE KhachHangThanThiet (
MaKH INT,
HoTen VARCHAR(255),
ThanhPho VARCHAR(100),
TongChiTieu INT,
SoDonHang INT,
LanCuoiMuaHang DATE
);
INSERT INTO KhachHangThanThiet (MaKH, HoTen, ThanhPho, TongChiTieu, SoDonHang, LanCuoiMuaHang) VALUES
(1, 'Nguyễn Thị Mai', 'Hà Nội', 15000000, 12, '2023-10-28'),
(2, 'Trần Văn Nam', 'TP. Hồ Chí Minh', 25000000, 20, '2023-10-15'),
(3, 'Lê Minh Anh', 'Hà Nội', 3000000, 2, '2023-10-05'),
(4, 'Phạm Hồng Nhung', 'Đà Nẵng', 8000000, 8, '2023-05-20'),
(5, 'Hoàng Tuấn Kiệt', 'Hà Nội', 18000000, 15, '2023-09-30'),
(6, 'Vũ Bích Phương', 'TP. Hồ Chí Minh', 4500000, 3, '2023-04-11');
-- 1. Xác định khách hàng VIP
select * from KhachHangThanThiet
where TongChiTieu >10000000 
AND SoDonHang >10 
order by TongChiTieu DESC;
-- 2. Xác định khách hàng mới tiềm năng
select * from KhachHangThanThiet 
where ThanhPho IN( 'Hà Nội') 
AND SoDonHang <5
AND TongChiTieu >2000000;
-- 3. Xác định khách hàng cần "hâm nóng"
select * from KhachHangThanThiet
where LanCuoiMuaHang < 2023-09-01;
-- 4. Cập nhật trạng thái
SET SQL_SAFE_UPDATE = 'Khách Hàng Cũ';
update ThanhPho
set ThanhPho = ' Khách Hàng Cũ'
where LanMuaHangCuoiCung <2023-09-01