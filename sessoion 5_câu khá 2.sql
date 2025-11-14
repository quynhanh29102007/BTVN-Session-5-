CREATE TABLE SanPham (
MaSP VARCHAR(10),
TenSP VARCHAR(255),
DanhMuc VARCHAR(100),
SoLuongTon INT,
NhaCungCap VARCHAR(100),
NgayNhapKho DATE,
TrangThai VARCHAR(50)
);
INSERT INTO SanPham (MaSP, TenSP, DanhMuc, SoLuongTon, NhaCungCap, NgayNhapKho, TrangThai) VALUES
('DB001', 'Nồi chiên không dầu', 'Đồ bếp', 25, 'Sunhouse Group', '2023-03-15', 'Bán chạy'),
('DD002', 'Máy sấy tóc', 'Điện gia dụng', 50, 'Philips VN', '2023-09-05', 'Hàng mới'),
('DB003', 'Bộ dao làm bếp', 'Đồ bếp', 15, 'Elmich', '2023-02-20', 'Bán chạy'),
('TT004', 'Bàn ủi hơi nước', 'Thiết bị tiện ích', 30, 'Philips VN', '2023-08-10', 'Bán chạy'),
('DB005', 'Máy xay sinh tố', 'Đồ bếp', 8, 'Sunhouse Group', '2023-04-01', 'Tồn kho');
-- 1. Sửa lỗi dữ liệu
update SanPham
set NhaCungCap = ' Tập Đoàn Sunhouse'
where NhaCungCap = 'Sunhouse Group';
-- 2. Xác định hàng tồn kho
select * from SanPham
where ĐồBếp 
AND NhậpKho <2023-05-01;
-- 3. Cập nhật trạng thái xả hàng
update SanPham
set TrangThai = 'Nhập kho'
where TrangThai = 'Xả hàng tồn kho';
-- 4. Lập báo cáo cuối cùng 
select * from SanPham 
where TrangThai = 'Xả hàng tồn kho'
OR SốLượngTồn <10
order by SốLượngTồn ASC