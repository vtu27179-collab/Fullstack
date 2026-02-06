CREATE TABLE employee (
    emp_id INT,
    name VARCHAR(50),
    salary DECIMAL(10,2)
);

CREATE TABLE employee_audit (
    emp_id INT,
    old_name VARCHAR(50),
    old_salary DECIMAL(10,2),
    updated_at DATETIME
);

DELIMITER //
CREATE TRIGGER employee_update_audit
BEFORE UPDATE ON employee
FOR EACH ROW
BEGIN
    INSERT INTO employee_audit
    VALUES (OLD.emp_id, OLD.name, OLD.salary, NOW());
END;
//
DELIMITER ;
