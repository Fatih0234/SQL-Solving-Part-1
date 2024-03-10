-- Question 1: Select all columns from the customers table and limit the results to 10 rows
SELECT * FROM customers LIMIT 10;

-- Question 2: Select the company name and contact name from the customers table where the country is 'USA', ordered by company name
SELECT company_name, contact_name 
FROM customers 
WHERE country = 'USA' 
ORDER BY company_name;

-- Question 3: Select the product name and unit price from the products table where the unit price is greater than $50, ordered by unit price in descending order
SELECT product_name, unit_price 
FROM products 
WHERE unit_price > 50 
ORDER BY unit_price DESC;

-- Question 4: Select the order date and total freight cost from the orders table where the freight cost is greater than $100, ordered by order date in descending order
SELECT order_date, freight 
FROM orders 
WHERE freight > 100 
ORDER BY order_date DESC;

-- Question 5: Select the company name and the sum of freight costs for each company from the customers and orders tables, limiting the result to the top 5 companies with the highest total freight cost
SELECT company_name, SUM(freight) AS total_freight_cost
FROM customers 
JOIN orders ON customers.customer_id = orders.customer_id
GROUP BY company_name
ORDER BY total_freight_cost DESC
LIMIT 5;

-- Question 6: Select the product name and the minimum unit price from the products table, ordered by product name
SELECT product_name, MIN(unit_price) AS min_unit_price 
FROM products 
GROUP BY product_name 
ORDER BY product_name;

-- Question 7: Select the contact title and the number of customers for each contact title from the customers table, ordered by the number of customers in descending order
SELECT contact_title, COUNT(*) AS num_customers 
FROM customers 
GROUP BY contact_title 
ORDER BY num_customers DESC;

-- Question 8: Select the contact name and phone number of customers where the city is 'London' or 'Berlin', ordered by contact name
SELECT contact_name, phone 
FROM customers 
WHERE city IN ('London', 'Berlin') 
ORDER BY contact_name;

-- Question 9: Select the company name and the maximum units in stock from the products table, ordered by company name
SELECT company_name, MAX(units_in_stock) AS max_units_in_stock 
FROM products 
GROUP BY company_name 
ORDER BY company_name;

-- Question 10: Select the order date and the total number of orders for each order date from the orders table, ordered by order date
SELECT order_date, COUNT(*) AS num_orders 
FROM orders 
GROUP BY order_date 
ORDER BY order_date;

-- Question 11: Select the company name and contact name from the customers table where the contact title is 'Owner' or 'Manager', ordered by company name
SELECT company_name, contact_name 
FROM customers 
WHERE contact_title IN ('Owner', 'Manager') 
ORDER BY company_name;

-- Question 12: Select the product name and unit price from the products table where the unit price is between $10 and $20, ordered by unit price in descending order
SELECT product_name, unit_price 
FROM products 
WHERE unit_price BETWEEN 10 AND 20 
ORDER BY unit_price DESC;

-- Question 13: Select the company name and the count of orders for each company from the customers and orders tables, ordered by the count of orders in descending order
SELECT company_name, COUNT(order_id) AS num_orders 
FROM customers 
LEFT JOIN orders ON customers.customer_id = orders.customer_id
GROUP BY company_name 
ORDER BY num_orders DESC;


SELECT * FROM categories;
select * from products;
-- Question 14: Select the category name and the total number of products in each category from the categories and products tables, ordered by category name
SELECT c.category_name, COUNT(p.product_id) AS num_products 
FROM categories c
LEFT JOIN products p ON c.category_id = p.category_id
GROUP BY c.category_name 
ORDER BY c.category_name;

-- Question 15: Select the shipper company name and the average freight cost for each shipper from the shippers and orders tables, ordered by average freight cost in ascending order
SELECT s.company_name, AVG(o.freight) AS avg_freight_cost 
FROM shippers s
LEFT JOIN orders o ON s.shipper_id = o.ship_via
GROUP BY s.company_name 
ORDER BY avg_freight_cost ASC;
