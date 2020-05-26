DROP TRIGGER IF EXISTS customer_name;
DROP TRIGGER IF EXISTS book_return_fine;
DROP TRIGGER IF EXISTS branch_manager_name;
DROP TRIGGER IF EXISTS author_name;

DELIMITER //

CREATE TRIGGER customer_name
    BEFORE INSERT ON customer
    FOR EACH ROW
BEGIN
    SET NEW.firstName = CONCAT(UPPER(SUBSTRING(NEW.firstName, 1, 1)), LOWER(SUBSTRING(NEW.firstName, 2)));
    IF NEW.lastName IS NOT NULL THEN
        SET NEW.lastName = CONCAT(UPPER(SUBSTRING(NEW.lastName, 1, 1)), LOWER(SUBSTRING(NEW.lastName, 2)));
    END IF;
END//

CREATE TRIGGER author_name
    BEFORE INSERT ON author
    FOR EACH ROW
BEGIN
    SET NEW.firstName = CONCAT(UPPER(SUBSTRING(NEW.firstName, 1, 1)), LOWER(SUBSTRING(NEW.firstName, 2)));
    IF NEW.lastName IS NOT NULL THEN
        SET NEW.lastName = CONCAT(UPPER(SUBSTRING(NEW.lastName, 1, 1)), LOWER(SUBSTRING(NEW.lastName, 2)));
    END IF;
END//

CREATE TRIGGER book_return_fine
    BEFORE UPDATE ON borrowed
    FOR EACH ROW
BEGIN
    IF NEW.dateReturned IS NOT NULL THEN
        SET NEW.payFine = 10*DATEDIFF (NEW.dateReturned, OLD.borrowedDate);
    END IF;
END//

DELIMITER ;
