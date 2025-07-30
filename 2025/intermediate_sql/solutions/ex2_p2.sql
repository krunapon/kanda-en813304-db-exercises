use ecommerce_5829_db;

--  Simulate Full Outer Join for customers and orders.
-- All customers and all orders, showing relationships where they exist
(SELECT c.customer_id, c.first_name, c.last_name, o.order_id, o.order_date, 'Customer-Order Match' as relationship_type
 FROM customers c
 LEFT OUTER JOIN orders o ON c.customer_id = o.customer_id)
UNION
(SELECT c.customer_id, c.first_name, c.last_name, o.order_id, o.order_date, 'Order-Customer Match' as relationship_type
 FROM customers c
 RIGHT OUTER JOIN orders o ON c.customer_id = o.customer_id
 WHERE c.customer_id IS NULL)
ORDER BY customer_id, order_date;