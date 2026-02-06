CREATE TABLE employee (
    emp_id INT,
    name VARCHAR(50),
    salary DECIMAL(10,2)
);

DELIMITER //
CREATE TRIGGER prevent_negative_salary
BEFORE INSERT OR UPDATE ON employee
FOR EACH ROW
BEGIN
    IF NEW.salary < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Salary cannot be negative';
    END IF;
END;
//
DELIMITER ;
