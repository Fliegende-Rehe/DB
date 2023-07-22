CREATE OR REPLACE FUNCTION retrieveCustomers(start INT, finish INT)
    RETURNS TABLE
            (
                customer_id INT,
                first_name  VARCHAR(45),
                last_name   VARCHAR(45),
                email       VARCHAR(50),
                address_id  INT
            )
AS
$$
BEGIN
    IF start < 0 OR start > 600 OR finish < 0 OR finish > 600 THEN
        RAISE EXCEPTION 'Invalid start or end parameter.';
    END IF;

    RETURN QUERY SELECT customer_id, first_name, last_name, email, address_id
                 FROM customer
                 ORDER BY address_id
                 LIMIT (finish - start + 1) OFFSET (start - 1);
END;
$$ LANGUAGE plpgsql;

-- example of usage: SELECT * FROM retrieveCustomers(10, 40);