use ecommerce_5829_db;

-- Find all suppliers and their products, including suppliers who have no products in the catalog.

SELECT s.supplier_name, s.country, s.rating,
       p.product_name, p.category, p.price, p.stock_quantity
FROM products p
RIGHT OUTER JOIN suppliers s ON p.supplier_id = s.supplier_id
ORDER BY s.supplier_name, p.product_name;