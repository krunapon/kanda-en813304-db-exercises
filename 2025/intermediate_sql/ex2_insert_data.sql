use ecommerce_5829_db;
-- Add customers with no orders for demonstration
INSERT INTO customers VALUES
('C005', 'Emma', 'Johnson', 'emma.j@email.com', '555-0105', '2024-03-15', 'Bronze'),
('C006', 'Frank', 'Anderson', 'frank.a@email.com', '555-0106', '2024-03-20', 'Silver');

-- Add products with no sales
INSERT INTO products VALUES
('P005', 'Bluetooth Speaker', 'Electronics', 79.99, 30, 'SUP001'),
('P006', 'Leather Wallet', 'Accessories', 39.99, 75, 'SUP002');