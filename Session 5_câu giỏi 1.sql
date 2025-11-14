-- 1. Lập danh sách giao dịch có giá trị cao 
select customer_id, amount, payment_date from sakila.payment
where payment_date >'2005-08-01'
AND amount >9.00
order by amount DESC;
--  2. Tìm kiếm các giao dịch bất thường 
select * from sakila.payment
where amount = 0.00
OR staff_id = '1'
AND amount >10.00;
select payment_id, customer_id, staff_id, amount from sakila.payment
order by customer_id ASC;
-- 3. Phân tích và nhận định
/* Khách Hàng VIP chi tiêu nhiều là những khách hàng có mức chi tiêu lớn hơn mức bình thường. Là những khách hàng mang lại giá trị và doanh thu cao cho cửa hàng. Khi kết quả được sắp xếp 
từ cao xuống thấp, giúp cửa hàng nhanh chóng nhận ra được khách hàng nào chi tiêu nhiều nhất và sẽ nhận diện được khách hàng quan trọng. Từ đó có thể đưa ra những chiến lược kinh doanh phù
hợp. */
/* Các giao dịch có amount bằng 0.00 có thể là dấu hiệu của việc lỗi hệ thống, chương trình khuyến mãi hoặc các chiến dịch hoàn tiền,... Quản lý cửa hàng cần quan tâm đến vấn đề này để có 
thể kiểm soát và đảm bảo hoạt động kinh doanh ổn định, tránh rủi ro và tối ưu được chiến lược khuyến mãi. */
/* Kết quả từ Nhiệm vụ 2 cho thấy nhân viên staff_id = 1 có xử lý các giao dịch giá trị rất cao, đây là một dấu hiệu tốt. Tuy nhiên, ta cần thêm thông tin như số lượng giao dịch, so sánh
với các nhân viên khác, tỷ lệ thành công và sai sót, phản hồi của khách hàng,.../*