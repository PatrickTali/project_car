CREATE FUNCTION add_car(car_id INTEGER, make VARCHAR, model VARCHAR, year_ INTEGER)
RETURNS void
AS $MAIN$
BEGIN
	INSERT INTO car
	VALUES(car_id, make, model, year_);
END;
$MAIN$
LANGUAGE plpgsql;

SELECT add_car(200, 'Toyota', 'Camry', 2024);

SELECT *
FROM car;


CREATE FUNCTION add_customer(customer_id INTEGER, firstname VARCHAR, lastname VARCHAR, phone_number BIGINT)
RETURNS void
AS $MAIN$
BEGIN
	INSERT INTO customer
	VALUES(customer_id, firstname, lastname, phone_number);
END;
$MAIN$
LANGUAGE plpgsql;

SELECT add_customer(300, 'Steph', 'Fox', 901-234-5678);

SELECT *
FROM customer;



CREATE FUNCTION add_invoice(invoice_id INTEGER, invoice_date DATE, total_amount NUMERIC, tax NUMERIC)
RETURNS void
AS $MAIN$
BEGIN
	INSERT INTO invoice
	VALUES(invoice_id, invoice_date, total_amount, tax);
END;
$MAIN$
LANGUAGE plpgsql;

SELECT add_invoice (24, 04-14-2022, 700.00, 87.00);

SELECT *
FROM invoice;


CREATE FUNCTION mechanic(mechanic_id INTEGER, firstname VARCHAR, lastname VARCHAR, phone_number BIGINT)
RETURNS void
AS $MAIN$
BEGIN
	INSERT INTO mechanic
	VALUES(mechanic_id, firstname, lastname, phone_number);
END;
$MAIN$
LANGUAGE plpgsql;

SELECT mechanic(65, 'Klay', 'Fox', 901-284-8004);

SELECT *
FROM mechanic;



CREATE FUNCTION parts(parts_id INTEGER, parts_name VARCHAR, price NUMERIC, quantity INTEGER)
RETURNS void
AS $MAIN$
BEGIN
	INSERT INTO parts
	VALUES(parts_id, parts_name, price, quantity);
END;
$MAIN$
LANGUAGE plpgsql;

SELECT parts(55, 'oil filter', 59.99, 1);

SELECT *
FROM parts;

ALTER TABLE car
ADD COLUMN is_serviced BOOLEAN;


CREATE OR REPLACE PROCEDURE serviced(IN p_car_id INT)
LANGUAGE plpgsql
AS $$
DECLARE
v_serviced BOOLEAN;
BEGIN


SELECT car.is_serviced
INTO v_serviced
FROM car
WHERE car.car_id = p_car_id ;
IF NOT FOUND THEN
UPDATE car
SET is_serviced = TRUE
WHERE car.car_id = p_car_id;
END IF;
END;
$$;

CALL serviced(200);

SELECT *
FROM car;

--

 




 
   

	









