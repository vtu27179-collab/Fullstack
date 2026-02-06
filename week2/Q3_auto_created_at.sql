CREATE TABLE users (
    id INT,
    name VARCHAR(50),
    created_at DATETIME
);

DELIMITER //
CREATE TRIGGER set_created_at
BEFORE INSERT ON users
FOR EACH ROW
BEGIN
    SET NEW.created_at = NOW();
END;
//
DELIMITER ;
