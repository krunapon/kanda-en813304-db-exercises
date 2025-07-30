use ecommerce_5829_db;

-- Left outer join examples
-- All customers with their order information (including customers who haven't ordered)
SELECT c.first_name, c.last_name, c.loyalty_level, 
       o.order_id, o.order_date, o.total_amount, o.order_status
FROM customers c
LEFT OUTER JOIN orders o ON c.customer_id = o.customer_id
ORDER BY c.last_name, o.order_date;

-- All products with their sales information (including unsold products)
SELECT p.product_name, p.category, p.price, 
       COALESCE(SUM(oi.quantity), 0) as total_sold,
       COALESCE(SUM(oi.quantity * oi.unit_price), 0) as total_revenue
FROM products p
LEFT OUTER JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY p.product_id, p.product_name, p.category, p.price
ORDER BY total_sold DESC;

-- Find customers who haven't placed any orders
SELECT c.first_name, c.last_name, c.email, c.registration_date, c.loyalty_level
FROM customers c
LEFT OUTER JOIN orders o ON c.customer_id = o.customer_id
WHERE o.customer_id IS NULL;
