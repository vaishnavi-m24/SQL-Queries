
CREATE PROCEDURE SelectAllCustomers(IN p_city VARCHAR(30))
LANGUAGE plpgsql
AS $$
BEGIN
    -- Dynamic SQL to handle the city parameter
    PERFORM *
    FROM customers
    WHERE city = p_city;
END;
$$;
CALL SelectAllCustomers('London');

