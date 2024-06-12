SELECT TOP 
FROM products
ORDER BY price DESC;

select customer_name from customers
where city Like 'N__ Y___'


select * from products
where product_name like 'C%'

select * from products
where product_name like '%'


select * from categories where category_id in(select category_id from products where category_name = 'Beverages')

select * from customers where country like 'USA'

SELECT * FROM customers
WHERE city LIKE '%';

SELECT * FROM customers
WHERE country <> 'USA';

SELECT * FROM customers
WHERE city IN ('New York', 'Los Angeles');


SELECT * FROM products
WHERE price BETWEEN 10 AND 20;

SELECT * FROM orders
WHERE order_date BETWEEN '2023-01-01' AND '2023-01-05';

select * from products
where price between 30 and 40


