CREATE TABLE driver (
    driver_id INT,
    name VARCHAR(50),
    otp INT
);

DELIMITER //
CREATE TRIGGER check_driver_otp
BEFORE INSERT OR UPDATE OR DELETE
ON driver
FOR EACH ROW
BEGIN
    IF NEW.otp <> 1234 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Invalid OTP. Operation denied';
    END IF;
END;
//
DELIMITER ;
