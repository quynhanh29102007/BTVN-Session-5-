-- 1. Thêm một khách hàng mới
insert into customer (store_id, first_name, last_name, email)
values ('5', 'ANNA', 'HILL', 'ANNA.HILL@gmail.com');
-- 2. Cập nhật địa chỉ email cho một nhóm khách hàng 
SET SQL_SAFE_UPDATES = '@sakilacustomer.com';
update KhachHang
set email = replace(email,'@sakilacustomer.org', '@sakilacustomer.com')
where customer_firstname = 'JENNIFER';
-- 3. Xử lý yêu cầu xóa tài khoản tạm thời 
update customer
set column_active = '0';
/* Trong nhiều hệ thống kinh doanh, việc "đánh dấu" một bản ghi là không hoạt động được ưu tiên hơn là xóa vĩnh viễn vì điều này có thể giữ lại được thông tin khách hàng,
lịch sử giao dịch để phục vụ việc phân tích hành vi tiêu dùng của khách. Giúp hỗ trợ kiểm tra, đối soát và tuân thủ pháp lý. Ngoài ra, nó còn giúp giảm rủi ro sai sót, 
tránh việc dùng DELETE sau này khôi phục dữ liệu khó khăn hơn.