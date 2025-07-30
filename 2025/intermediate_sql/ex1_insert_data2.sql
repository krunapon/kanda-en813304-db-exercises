-- Insert customer and order data
USE ecommerce_5829_db; 
INSERT INTO customers VALUES
('C001', 'Alice', 'Brown', 'alice.b@email.com', '555-0101', '2024-01-15', 'Gold'),
('C002', 'Bob', 'Wilson', 'bob.w@email.com', '555-0102', '2024-02-20', 'Silver'),
('C003', 'Carol', 'Davis', 'carol.d@email.com', '555-0103', '2024-03-10', 'Bronze'),
('C004', 'David', 'Miller', 'david.m@email.com', '555-0104', '2024-01-25', 'Platinum');

INSERT INTO orders VALUES
('ORD001', 'C001', '2024-03-01', 159.98, 'Delivered', '123 Main St'),
('ORD002', 'C002', '2024-03-05', 29.99, 'Shipped', '456 Oak Ave'),
('ORD003', 'C001', '2024-03-10', 149.99, 'Processing', '123 Main St'),
('ORD004', 'C004', '2024-03-12', 109.98, 'Pending', '789 Pine Rd');

INSERT INTO order_items VALUES
(NULL, 'ORD001', 'P001', 1, 89.99, 0.00),
(NULL, 'ORD001', 'P004', 3, 19.99, 5.00),
(NULL, 'ORD002', 'P002', 1, 29.99, 0.00),
(NULL, 'ORD003', 'P003', 1, 149.99, 0.00),
(NULL, 'ORD004', 'P001', 1, 89.99, 10.00),
(NULL, 'ORD004', 'P004', 1, 19.99, 0.00);
