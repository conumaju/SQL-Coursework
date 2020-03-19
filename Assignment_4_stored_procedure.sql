USE forestgleninn_a4;

DROP PROCEDURE IF EXISTS Set_VIP_status;

DELIMITER //
/* 
	ForestGlenInn has a VIP progam. Set the status for a given guest, based on number of reservations
		- If the guest has stayed more than 3 times, they get GOLD status
        - If the guest has stayed 3 times, they get SILVER status
		- If the guest has stayed twice, they get a BRONZE status
        - If they have not stayed or have only stayed once, they are not a VIP
*/
CREATE PROCEDURE Set_VIP_status
(
    /* one input parameters for guest ID  */
	guest_id_param INT
)
BEGIN
	DECLARE sql_error INT DEFAULT FALSE;
	DECLARE num_stays_var INT;
	DECLARE VIP_status_var VARCHAR(10);
    
	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    SET sql_error = TRUE;
    
    /* Default to 'Not a VIP' */
    SET VIP_status_var = 'Not a VIP';
    
	/* calculate the number of reservations */
	/* HINT: write a SELECT statement which queries the reservations table using the guest_id parameter. 
	Use the INTO keyword to store the number of stays into the local variable num_stays_var declared above */
	SELECT COUNT(*)
    INTO num_stays_var
    FROM reservations
    WHERE guest_id = guest_id_param
    GROUP BY reservations.guest_id;
    
    
    /* calculate the VIP status */
    /* HINT: use a sequence of IF/ELSEIF statements to assign the VIP_status_var based on num_stays */
	IF num_stays_var > 3 THEN
		SET VIP_status_var = 'GOLD';
	ELSEIF num_stays_var = 3 THEN
		SET VIP_status_var = 'SILVER';
	ELSEIF num_stays_var = 2 THEN
		SET VIP_status_var = 'BRONZE';
	ELSE
		SET VIP_status_var = 'Not a VIP';
	END IF;

	START TRANSACTION;  

	/* update the VIP status for this guest */
    /* HINT: write an UPDATE statement against the guests table using VIP_status_var and guest_id_param */
	UPDATE guests
    SET VIP_status = VIP_status_var
    WHERE guest_id = guest_id_param;

END//

DELIMITER ;