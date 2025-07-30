use ecommerce_5829_db;
-- Create views that depend on other views
-- High-value customers (based on customer_summary view)
CREATE VIEW high_value_customers AS
SELECT customer_id, full_name, email, loyalty_level, lifetime_value, total_orders
FROM customer_summary
WHERE lifetime_value > 100 OR total_orders >= 2
ORDER BY lifetime_value DESC;

-- Top performing products (based on product_performance view)
CREATE VIEW top_products AS
SELECT product_id, product_name, category, supplier_name, units_sold, gross_revenue
FROM product_performance
WHERE units_sold > 0
ORDER BY gross_revenue DESC
LIMIT 10;

-- Customer activity analysis (depends on customer_summary)
CREATE VIEW customer_activity_analysis AS
SELECT 
    loyalty_level,
    COUNT(*) AS customer_count,
    AVG(total_orders) AS avg_orders_per_customer,
    AVG(lifetime_value) AS avg_lifetime_value,
    SUM(lifetime_value) AS total_segment_value,
    CASE 
        WHEN AVG(days_since_last_order) <= 30 THEN 'Active'
        WHEN AVG(days_since_last_order) <= 90 THEN 'Moderate'
        ELSE 'Inactive'
    END AS segment_activity_status
FROM customer_summary
GROUP BY loyalty_level
ORDER BY avg_lifetime_value DESC;
