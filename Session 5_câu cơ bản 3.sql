CREATE TABLE DonHang (
MaDonHang INT,
NgayDatHang DATE,
TongGiaTri INT,
ThanhPhoGiaoHang VARCHAR(100)
);
INSERT INTO DonHang (MaDonHang, NgayDatHang, TongGiaTri, ThanhPhoGiaoHang) VALUES
(101, '2023-10-15', 1500000, 'Hà Nội'),
(102, '2023-10-18', 800000, 'Đà Nẵng'),
(103, '2023-10-20', 2200000, 'TP. Hồ Chí Minh'),
(104, '2023-10-22', 750000, 'Hà Nội'),
(105, '2023-10-25', 3100000, 'TP. Hồ Chí Minh');
-- 1. Liệt kê tất cả các đơn hàng có tổng giá trị lớn hơn 1,000,000
select * from DonHang 
where TongGiaTri>1000000;
-- 2. Liệt kê tất cả các đơn hàng được giao đến 'TP. Hồ Chí Minh'
select * from DonHang 
where GiaoDen = 'TP.Hồ Chí Minh';
-- 3. Liệt kê tất cả các đơn hàng, sắp xếp theo TongGiaTri từ cao xuống thấp (giảm dần)
select * from DonHang 
order by TongGiaTri DESC;
-- 4. Liệt kê danh sách các thành phố (duy nhất, không trùng lặp) đã có đơn hàng
select distinct ThanhPhoGiaoHang from DonHang