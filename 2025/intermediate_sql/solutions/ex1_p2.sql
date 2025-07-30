-- List suppliers whose products have been ordered, along with the total revenue generated from their products.
SELECT s.supplier_name, s.country, 
       SUM(oi.quantity * oi.unit_price - oi.discount_amount) as total_revenue,
       COUNT(DISTINCT oi.order_id) as number_of_orders
FROM suppliers s
INNER JOIN products p ON s.supplier_id = p.supplier_id
INNER JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY s.supplier_id, s.supplier_name, s.country
ORDER BY total_revenue DESC;