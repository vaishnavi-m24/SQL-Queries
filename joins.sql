select * from categories
select * from orders
select * from order_details

select * from customers
select * from products

select * from products p
inner join categories  c on
p.category_id = c.category_id

select * from products p
left join categories  c on
p.category_id = c.category_id

select * from products p
right join categories c on
p.category_id = c.category_id

select * from products p
full outer join categories  c on
p.category_id = c.category_id

select p.product_name, c.category_name from categories c
inner join products p on
p.category_id = c.category_id

SELECT o.order_id, o.order_date, c.customer_name
FROM orders o
INNER JOIN customers c ON o.customer_id = c.customer_id
WHERE c.customer_name = 'John Doe';

select p.product_name, o.quantity