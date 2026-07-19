CREATE TABLE customers (
    customer_id   INT PRIMARY KEY,
    full_name     VARCHAR(100),
    house_no      VARCHAR(30),
    street_name   VARCHAR(50),
    city          VARCHAR(50),
    province      VARCHAR(50),
    zip_code      VARCHAR(5),
    member_status VARCHAR(20) DEFAULT 'regular'
        CHECK (member_status IN ('regular', 'silver', 'gold')),
    age           INT CHECK (age BETWEEN 16 AND 100),
    reg_date      DATE
);

CREATE TABLE phone_numbers (
    phone_number_id INT PRIMARY KEY,
    customer_id     INT NOT NULL,
    phone_number    VARCHAR(15) NOT NULL,
    phone_type      VARCHAR(10) CHECK (phone_type IN ('mobile', 'home', 'work')),
    is_primary      BOOLEAN DEFAULT 0,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

INSERT INTO customers VALUES
(1, 'นายสมชาย ใจดี', '123', 'ถ.มิตรภาพ', 'เมือง', 'ขอนแก่น', '40002',
 'regular', 30, '2026-07-07');


INSERT INTO phone_numbers VALUES (1, 1, '081-111-2222', 'mobile', 1);

INSERT INTO customers VALUES
(2, 'นางสาวสมหญิง รักเรียน', '45', 'ถ.ศรีจันทร์', 'เมือง', 'ขอนแก่น', '40000',
 'regular', 250, '2026-07-07');

INSERT INTO customers VALUES
(3, 'นายวิชัย ขยันดี', '67', 'ถ.กลางเมือง', 'เมือง', 'ขอนแก่น', '40000',
 'platinum', 25, '2026-07-07');


