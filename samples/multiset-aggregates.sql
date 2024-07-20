-- Create a sample table
CREATE TABLE sales (
    id INT,
    product VARCHAR(50),
    quantity INT,
    price DECIMAL(10, 2)
);

-- Insert sample data (note the duplicates)
INSERT INTO sales (id, product, quantity, price) VALUES
(1, 'Apple', 5, 0.50),
(2, 'Banana', 3, 0.30),
(3, 'Apple', 5, 0.50),
(4, 'Orange', 2, 0.75),
(5, 'Banana', 4, 0.30);

-- Example 1: COUNT with and without DISTINCT
SELECT COUNT(*) AS total_rows,
       COUNT(DISTINCT product) AS unique_products
FROM sales;

-- Example 2: SUM and AVG considering duplicates
SELECT SUM(quantity) AS total_quantity,
       AVG(price) AS average_price
FROM sales;

INSERT INTO sales (id, product, quantity, price) VALUES
(1, 'Grapes', Null, 0.8);

-- Example 3: GROUP BY creating multisets
SELECT product,
       COUNT(*) AS sales_count,
       SUM(quantity) AS total_quantity,
       AVG(price) AS average_price
FROM sales
GROUP BY product;

-- Example 4: Find products with total sales quantity greater than 100
SELECT product, SUM(quantity) as total_quantity
FROM sales
GROUP BY product
HAVING SUM(quantity) > 5;

-- Example 5: Find average price of products, but only for products with more than 5 sales
SELECT product, AVG(price) as avg_price, COUNT(*) as sale_count
FROM sales
GROUP BY product
HAVING COUNT(*) > 1;

