USE forestgleninn_a4;

DROP FUNCTION IF EXISTS CalcRoomPrice;

DELIMITER //

/* 
	Calculate the room price using the room type and the length of stay:
		- Determine the base price using the room type.
		- If the length of stay is greater than 3 days, apply a 10% discount to the base price.
		- Return a value that represents the price for the full reservation: multiply the (possibly discounted) base price by the length of stay.
*/
 
CREATE FUNCTION CalcRoomPrice
(
    /* two input parameters for room type_code, number of days */
	room_type_code_param VARCHAR(10),
    length_of_stay_param INT
)
RETURNS DECIMAL(6,2)
BEGIN
	DECLARE base_price_var DECIMAL(6,2);
	DECLARE price_var INT;
  
	SET price_var = 0;
  
	/* query the database to get the base price of the room type */
    /* HINT: write a SELECT statement which queries the room_type table using the room type parameter. Use the INTO keyword to store the price into the local variable base_price_var declared above */
	SELECT base_price
    INTO base_price_var
    FROM room_types
    WHERE room_type_code = room_type_code_param;
  
	/* Calculate the full price of the person's reservation using the base price and the length of stay */
    /* HINT: first SET the price_var to base price, then use an IF statement to conditionally apply the discount. Then multiply by the number of days (length of stay).*/
    IF length_of_stay_param > 3 THEN
		SET price_var = (base_price_var - (base_price_var * .10)) * length_of_stay_param;
	ELSEIF length_of_stay_param <= 3 THEN
		SET price_var = base_price_var * length_of_stay_param;
	END IF;
	/* Don't forget to return the value! */
    RETURN price_var;
    
END//

DELIMITER ;
