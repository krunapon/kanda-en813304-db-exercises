-- Insert sample data
USE ecommerce_5829_db; 
INSERT INTO suppliers VALUES
('SUP001', 'Tech Components Ltd', 'John Smith', 'USA', 4.5),
('SUP002', 'Fashion Wholesale Co', 'Sarah Johnson', 'Italy', 4.2),
('SUP003', 'Home Goods Supply', 'Mike Chen', 'China', 3.8);

INSERT INTO products VALUES
('P001', 'Wireless Headphones', 'Electronics', 89.99, 50, 'SUP001'),
('P002', 'Designer T-Shirt', 'Clothing', 29.99, 100, 'SUP002'),
('P003', 'Coffee Maker', 'Appliances', 149.99, 25, 'SUP003'),
('P004', 'Smartphone Case', 'Electronics', 19.99, 200, 'SUP001');
