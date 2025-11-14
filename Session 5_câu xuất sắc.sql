CREATE TABLE film (
  film_id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
  title VARCHAR(255) NOT NULL,
  description TEXT DEFAULT NULL,
  release_year YEAR DEFAULT NULL,
  language_id TINYINT UNSIGNED NOT NULL,
  original_language_id TINYINT UNSIGNED DEFAULT NULL,
  rental_duration TINYINT UNSIGNED NOT NULL DEFAULT 3,
  rental_rate DECIMAL(4,2) NOT NULL DEFAULT 4.99,
  length SMALLINT UNSIGNED DEFAULT NULL,
  replacement_cost DECIMAL(5,2) NOT NULL DEFAULT 19.99,
  rating ENUM('G','PG','PG-13','R','NC-17') DEFAULT 'G',
  special_features SET('Trailers','Commentaries','Deleted Scenes','Behind the Scenes') DEFAULT NULL,
  last_update TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY  (film_id),
  KEY idx_title (title),
  KEY idx_fk_language_id (language_id),
  KEY idx_fk_original_language_id (original_language_id),
  CONSTRAINT fk_film_language FOREIGN KEY (language_id) REFERENCES language (language_id) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT fk_film_language_original FOREIGN KEY (original_language_id) REFERENCES language (language_id) ON DELETE RESTRICT ON UPDATE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 1. Xác định Danh sách Phim Áp dụng Khuyến mãi
select film_id, title, rating, length, rental_rate from film
where rating = 'PG' OR rating ='G'
AND leng>100
AND rental_date >=2.99
order by rental_date DESC;
-- 2. Thực thi chiến dịch giảm giá
update film
set rental_rate = rental_rate/2
where rating ='PG' OR rating ='G'
AND leng>100
AND rental_date>=2.99
order by rental_date DESC;
-- 3. Thiết kế Kế hoạch "Hoàn tác" và Phân tích Rủi ro
/* Rủi ro lớn nhất khi chạy câu lệnh UPDATE ở Nhiệm vụ 2 mà không có mệnh đề WHERE hoặc mệnh đề WHERE bị sai, hậu quả đối với doanh thu của công ty sẽ bị xóa hết tất
cả dữ liệu./*
/* Nếu lệnh UPDATE bị sai, giá thuê của toàn bộ phim có thể bị thay đổi ngoài ý muốn. Để khôi phục giá thuê ban đầu, ta sẽ dùng lệnh UPDATE: UPDATE film
SET rental_rate = rental_rate * 2
WHERE (rating = 'PG' OR rating = 'G')
  AND length > 100
  AND rental_rate >= 2.99. Việc có một kế hoạch hoàn tác lại là một phần không thể thiếu vì nó sẽ đảm bảo tính bảo mật và minh bạch của dữ liệu,
  vì nó giúp đảm bảo an toàn, toàn vẹn và khả năng phục hồi dữ liệu khi xảy ra sai sót.