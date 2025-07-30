use ecommerce_5829_db;
-- Create comprehensive business views
-- Customer summary view
CREATE VIEW customer_summary AS
SELECT c.customer_id,
       CONCAT(c.first_name, ' ', c.last_name) AS full_name,
       c.email,
       c.loyalty_level,
       COUNT(DISTINCT o.order_id) AS total_orders,
       COALESCE(SUM(o.total_amount), 0) AS lifetime_value,
       MAX(o.order_date) AS last_order_date,
       DATEDIFF(CURDATE(), MAX(o.order_date)) AS days_since_last_order
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name, c.email, c.loyalty_level;

-- Product performance view
CREATE VIEW product_performance AS
SELECT p.product_id,
       p.product_name,
       p.category,
       p.price,
       p.stock_quantity,
       s.supplier_name,
       s.country AS supplier_country,
       COALESCE(SUM(oi.quantity), 0) AS units_sold,
       COALESCE(SUM(oi.quantity * oi.unit_price), 0) AS gross_revenue,
       COALESCE(SUM(oi.discount_amount), 0) AS total_discounts,
       COALESCE(COUNT(DISTINCT oi.order_id), 0) AS number_of_orders
FROM products p
LEFT JOIN suppliers s ON p.supplier_id = s.supplier_id
LEFT JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY p.product_id, p.product_name, p.category, p.price, p.stock_quantity, s.supplier_name, s.country;

-- Monthly sales summary view
CREATE VIEW monthly_sales_summary AS
SELECT YEAR(o.order_date) AS sales_year,
       MONTH(o.order_date) AS sales_month,
       MONTHNAME(o.order_date) AS month_name,
       COUNT(DISTINCT o.order_id) AS total_orders,
       COUNT(DISTINCT o.customer_id) AS unique_customers,
       SUM(o.total_amount) AS total_revenue,
       AVG(o.total_amount) AS average_order_value,
       SUM(oi.quantity) AS total_items_sold
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
WHERE o.order_status != 'Cancelled'
GROUP BY YEAR(o.order_date), MONTH(o.order_date), MONTHNAME(o.order_date)
ORDER BY sales_year DESC, sales_month DESC;