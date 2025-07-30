use ecommerce_5829_db;
-- Create a view called supplier_performance that shows supplier information along with the total number of products they supply, total revenue generated, and average product rating


CREATE VIEW supplier_performance AS
SELECT s.supplier_id,
       s.supplier_name,
       s.country,
       s.rating,
       COUNT(p.product_id) AS total_products,
       COALESCE(SUM(oi.quantity * oi.unit_price - oi.discount_amount), 0) AS total_revenue,
       COALESCE(AVG(p.price), 0) AS avg_product_price,
       COALESCE(SUM(oi.quantity), 0) AS total_units_sold
FROM suppliers s
LEFT JOIN products p ON s.supplier_id = p.supplier_id
LEFT JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY s.supplier_id, s.supplier_name, s.country, s.rating
ORDER BY total_revenue DESC;

-- Query the view
SELECT * FROM supplier_performance;