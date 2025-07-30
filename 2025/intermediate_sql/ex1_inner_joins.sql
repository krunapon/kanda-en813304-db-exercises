-- Inner join examples
-- Customer order history with product details
SELECT c.first_name, c.last_name, o.order_date, p.product_name, oi.quantity, oi.unit_price
FROM customers c
INNER JOIN orders o ON c.customer_id = o.customer_id
INNER JOIN order_items oi ON o.order_id = oi.order_id
INNER JOIN products p ON oi.product_id = p.product_id
ORDER BY c.last_name, o.order_date;

-- Products sold with supplier information
SELECT p.product_name, s.supplier_name, s.country, SUM(oi.quantity) as total_sold
FROM products p
INNER JOIN suppliers s ON p.supplier_id = s.supplier_id
INNER JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY p.product_id, p.product_name, s.supplier_name, s.country
ORDER BY total_sold DESC;
