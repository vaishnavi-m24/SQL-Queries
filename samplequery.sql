CREATE TABLE categories (
  category_id SERIAL NOT NULL PRIMARY KEY,
  category_name VARCHAR(255),
  description VARCHAR(255)
);

INSERT INTO categories (category_name, description) VALUES
('Beverages', 'Soft drinks, coffees, teas, beers, and ales'),
('Condiments', 'Sweet and savory sauces, relishes, spreads, and seasonings'),
('Confections', 'Desserts, candies, and sweet breads'),
('Dairy Products', 'Cheeses and dairy products'),
('Grains/Cereals', 'Breads, crackers, pasta, and cereal'),
('Meat/Poultry', 'Prepared meats'),
('Produce', 'Dried fruit and bean curd'),
('Seafood', 'Seaweed and fish'),
('Snacks', 'Chips and snack foods'),
('Bakery', 'Breads, cakes, and pastries');

CREATE TABLE customers (
  customer_id SERIAL NOT NULL PRIMARY KEY,
  customer_name VARCHAR(255),
  contact_name VARCHAR(255),
  address VARCHAR(255),
  city VARCHAR(255),
  postal_code VARCHAR(255),
  country VARCHAR(255)
);
INSERT INTO customers (customer_name, contact_name, address, city, postal_code, country) VALUES
('John Doe', 'John', '123 Elm St', 'New York', '10001', 'USA'),
('Jane Smith', 'Jane', '456 Oak St', 'Los Angeles', '90001', 'USA'),
('Robert Brown', 'Robert', '789 Pine St', 'Chicago', '60601', 'USA'),
('Michael Johnson', 'Michael', '101 Maple St', 'Houston', '77001', 'USA'),
('Emily Davis', 'Emily', '202 Birch St', 'Phoenix', '85001', 'USA'),
('Sarah Wilson', 'Sarah', '303 Cedar St', 'Philadelphia', '19101', 'USA'),
('David Martinez', 'David', '404 Spruce St', 'San Antonio', '78201', 'USA'),
('Laura Hernandez', 'Laura', '505 Aspen St', 'San Diego', '92101', 'USA'),
('James White', 'James', '606 Fir St', 'Dallas', '75201', 'USA'),
('Linda Thompson', 'Linda', '707 Palm St', 'San Jose', '95101', 'USA');

CREATE TABLE products (
  product_id SERIAL NOT NULL PRIMARY KEY,
  product_name VARCHAR(255),
  category_id INT,
  unit VARCHAR(255),
  price DECIMAL(10, 2),
  CONSTRAINT fk_category
    FOREIGN KEY(category_id) 
    REFERENCES categories(category_id)
    ON DELETE SET NULL
);
INSERT INTO products (product_name, category_id, unit, price) VALUES
('Chai', 1, '10 boxes x 20 bags', 18.00),
('Chang', 1, '24 - 12 oz bottles', 19.00),
('Aniseed Syrup', 2, '12 - 550 ml bottles', 10.00),
('Chef Antons Cajun Seasoning', 2, '48 - 6 oz jars', 22.00),
('Chef Antons Gumbo Mix', 2, '36 boxes', 21.35),
('Grandmas Boysenberry Spread', 2, '12 - 8 oz jars', 25.00),
('Uncle Bobs Organic Dried Pears', 7, '12 - 1 lb pkgs.', 30.00),
('Northwoods Cranberry Sauce', 2, '12 - 12 oz jars', 40.00),
('Mishi Kobe Niku', 6, '18 - 500 g pkgs.', 97.00),
('Ikura', 8, '12 - 200 ml jars', 31.00);

select * from products

CREATE TABLE orders (
  order_id SERIAL NOT NULL PRIMARY KEY,
  customer_id INT,
  order_date DATE,
  CONSTRAINT fk_customer
    FOREIGN KEY(customer_id)
    REFERENCES customers(customer_id)
    ON DELETE CASCADE
);
INSERT INTO orders (customer_id, order_date) VALUES
(1, '2023-01-01'),
(2, '2023-01-05'),
(3, '2023-01-10'),
(4, '2023-01-15'),
(5, '2023-01-20'),
(6, '2023-01-25'),
(7, '2023-01-30'),
(8, '2023-02-01'),
(9, '2023-02-05'),
(10, '2023-02-10');

CREATE TABLE order_details (
  order_detail_id SERIAL NOT NULL PRIMARY KEY,
  order_id INT,
  product_id INT,
  quantity INT,
  CONSTRAINT fk_order
    FOREIGN KEY(order_id)
    REFERENCES orders(order_id)
    ON DELETE CASCADE,
  CONSTRAINT fk_product
    FOREIGN KEY(product_id)
    REFERENCES products(product_id)
    ON DELETE CASCADE
);
INSERT INTO order_details (order_id, product_id, quantity) VALUES
(1, 1, 2),
(2, 2, 1),
(3, 3, 5),
(4, 4, 3),
(5, 5, 4),
(6, 6, 2),
(7, 7, 1),
(8, 8, 3),
(9, 9, 1),
(10, 10, 2);

CREATE TABLE testproducts (
  testproduct_id SERIAL NOT NULL PRIMARY KEY,
  product_name VARCHAR(255),
  category_id INT,
  CONSTRAINT fk_category_test
    FOREIGN KEY(category_id)
    REFERENCES categories(category_id)
    ON DELETE SET NULL
);
INSERT INTO testproducts (product_name, category_id) VALUES
('Test Chai', 1),
('Test Chang', 1),
('Test Aniseed Syrup', 2),
('Test Chef Antons Cajun Seasoning', 2),
('Test Chef Antons Gumbo Mix', 2),
('Test Grandmas Boysenberry Spread', 2),
('Test Uncle Bobs Organic Dried Pears', 7),
('Test Northwoods Cranberry Sauce', 2),
('Test Mishi Kobe Niku', 6),
('Test Ikura', 8);


SELECT distinct product_name, unit from products where length(unit) > 10

select count(distinct order_date),orders.customer_id from orders group by orders.order_id 

select customer_name, country from customers where country = 'USA' group by city

SELECT customer_id, customer_name, city
FROM customers
ORDER BY 2 DESC;

SELECT * FROM customers
ORDER BY contact_name ASC, city DESC, address Desc, postal_code ASC, customer_name ASC;

SELECT customer_id, customer_name
FROM customers
ORDER BY LENGTH(customer_name);

select * from customers

SELECT customer_id, customer_name,
  CASE
    WHEN city = 'New York' OR city = 'Los Angeles' THEN 'Major City'
    ELSE 'Other City'
  END AS city_type
FROM customers;


