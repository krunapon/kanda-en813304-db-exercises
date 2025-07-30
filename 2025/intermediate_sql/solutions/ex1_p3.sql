-- Create a report showing order details for Gold and Platinum loyalty customers only.
SELECT c.first_name, c.last_name, c.loyalty_level, 
       o.order_id, o.order_date, o.total_amount, o.order_status,
       p.product_name, oi.quantity, oi.unit_price
FROM customers c
INNER JOIN orders o ON c.customer_id = o.customer_id
INNER JOIN order_items oi ON o.order_id = oi.order_id
INNER JOIN products p ON oi.product_id = p.product_id
WHERE c.loyalty_level IN ('Gold', 'Platinum')
ORDER BY c.loyalty_level DESC, o.order_date;