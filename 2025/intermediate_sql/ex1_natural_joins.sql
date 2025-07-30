-- Natural join example (Note: This requires common column names)
-- Since our tables don't have perfectly matching column names, 
-- let's demonstrate the concept:
USE ecommerce_5829_db; 
SELECT p.product_name, p.category, s.supplier_name, s.country
FROM products p
NATURAL JOIN suppliers s; 

-- Better approach - show what natural join would do if columns matched:
SELECT p.product_name, p.category, s.supplier_name, s.country
FROM products p, suppliers s
WHERE p.supplier_id = s.supplier_id;  -- Manual "natural join"
