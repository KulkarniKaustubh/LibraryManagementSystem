DROP TRIGGER IF EXISTS customer_name;
DROP TRIGGER IF EXISTS book_return_trigger;
DROP TRIGGER IF EXISTS branch_manager_name;
DROP TRIGGER IF EXISTS author_name;
DROP TRIGGER IF EXISTS set_due_date;
DROP TRIGGER IF EXISTS return_status_modify;

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

CREATE TRIGGER branch_manager_name
    BEFORE INSERT ON branch
    FOR EACH ROW
BEGIN
    SET NEW.branchManager = UPPER(NEW.branchManager);
END//

CREATE TRIGGER book_return_trigger
    BEFORE UPDATE ON borrowed
    FOR EACH ROW
BEGIN
    IF NEW.dateReturned IS NOT NULL THEN
        IF NEW.dateReturned > OLD.dueDate THEN
            SET NEW.payFine = 10*DATEDIFF (NEW.dateReturned, OLD.borrowedDate);
        END IF;
        SET NEW.returnStatus = 'RETURNED';
    END IF;
END//

CREATE TRIGGER set_due_date
    BEFORE INSERT ON borrowed
    FOR EACH ROW
BEGIN
    SET NEW.dueDate = DATE_ADD(NEW.borrowedDate, interval 14 day);
END//

DELIMITER ;
