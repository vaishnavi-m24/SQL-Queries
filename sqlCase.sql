SELECT order_id, quantity,
CASE
    WHEN quantity > 30 THEN 'The quantity is greater than 30'
    WHEN quantity = 30 THEN 'The quantity is 30'
    ELSE 'The quantity is under 30'
END AS QuantityText
FROM order_details;

SELECT customer_name, city, country
FROM customers
ORDER BY
(CASE
    WHEN city IS NULL THEN country
    ELSE city
END);