DROP TRIGGER IF EXISTS customer_name;
DROP TRIGGER IF EXISTS book_return_trigger;
DROP TRIGGER IF EXISTS branch_manager_name;
DROP TRIGGER IF EXISTS author_name;
DROP TRIGGER IF EXISTS set_due_date;
DROP TRIGGER IF EXISTS return_status_modify;
DROP TRIGGER IF EXISTS date_violation;
DROP TRIGGER IF EXISTS borrow_limit;
DROP TRIGGER IF EXISTS book_constraints;

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

CREATE TRIGGER book_constraints
    BEFORE INSERT ON borrowed
    FOR EACH ROW
BEGIN
    DECLARE nBooks int(1);
    SET nBooks= (SELECT COUNT(bookID) FROM borrowed WHERE customerID = NEW.customerID AND returnStatus = 'NOT RETURNED');
    IF (nBooks > 7) THEN
        SIGNAL SQLSTATE '46000'
            SET MESSAGE_TEXT = 'Cannot borrow more than 7 books.';
    END IF;
END//

CREATE TRIGGER borrow_limit
    BEFORE INSERT ON borrowed
    FOR EACH ROW
BEGIN
    DECLARE bID varchar(10);
    SET bID = (SELECT bookID FROM borrowed WHERE bookID = NEW.bookID AND returnStatus = 'NOT RETURNED');
    IF bID IS NOT NULL THEN
        SIGNAL SQLSTATE '47000'
            SET MESSAGE_TEXT = 'Cannot borrow book. Already borrowed and not yet returned.';
    END IF;
END//

CREATE TRIGGER set_due_date
    BEFORE INSERT ON borrowed
    FOR EACH ROW
BEGIN
    SET NEW.dueDate = DATE_ADD(NEW.borrowedDate, interval 14 day);
END//

CREATE TRIGGER book_return_trigger
    BEFORE UPDATE ON borrowed
    FOR EACH ROW
BEGIN
    IF NEW.dateReturned IS NOT NULL THEN
        IF NEW.dateReturned > OLD.dueDate THEN
            SET NEW.payFine = 10 * DATEDIFF (NEW.dateReturned, OLD.dueDate);
        END IF;
        IF NEW.dateReturned < OLD.dueDate THEN
            SET NEW.payFine = 0;
        END IF;
        SET NEW.returnStatus = 'RETURNED';
    END IF;
END//

CREATE TRIGGER date_violation
    BEFORE INSERT ON borrowed
    FOR EACH ROW
BEGIN
    IF (NEW.borrowedDate > NOW()) THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Cannot insert a borrowed date that is in the future.';
    END IF;
END//

DELIMITER ;
