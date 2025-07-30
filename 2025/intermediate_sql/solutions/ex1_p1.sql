-- Find all customers who have purchased electronics products, showing customer name, product name, and order date
SELECT c.first_name, c.last_name, p.product_name, o.order_date
FROM customers c
INNER JOIN orders o ON c.customer_id = o.customer_id
INNER JOIN order_items oi ON o.order_id = oi.order_id
INNER JOIN products p ON oi.product_id = p.product_id
WHERE p.category = 'Electronics'
ORDER BY c.last_name, o.order_date;