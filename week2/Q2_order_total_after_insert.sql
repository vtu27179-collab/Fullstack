CREATE TABLE dishes (
    dish_id INT PRIMARY KEY,
    price DECIMAL(10,2)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    total_amount DECIMAL(10,2) DEFAULT 0
);

CREATE TABLE order_items (
    order_id INT,
    dish_id INT,
    quantity INT
);

DELIMITER //
CREATE TRIGGER update_order_total
AFTER INSERT ON order_items
FOR EACH ROW
BEGIN
    UPDATE orders
    SET total_amount = total_amount +
        (SELECT price FROM dishes WHERE dish_id = NEW.dish_id) * NEW.quantity
    WHERE order_id = NEW.order_id;
END;
//
DELIMITER ;
