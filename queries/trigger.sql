DELIMITER //
CREATE TRIGGER account_check BEFORE INSERT ON account
FOR EACH ROW
BEGIN
    IF EXISTS (SELECT * FROM customer WHERE customerid = NEW.customerid AND is_verified = 'N') THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Customer needs to verify';
    END IF;
END;
//
DELIMITER ;

DELIMITER //
CREATE TRIGGER delete_customer BEFORE DELETE ON customer
FOR EACH ROW
BEGIN
    IF EXISTS (SELECT * FROM account WHERE customerid = OLD.customerid AND account_status = 'ACTIVE') THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Customer cannot be deleted';
    ELSEIF EXISTS (SELECT * FROM loan WHERE accountid IN (SELECT accountid FROM account WHERE customerid = OLD.customerid) AND loan_status != 'Fully Paid') THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Customer cannot be deleted';
    END IF;
    UPDATE customer SET customer_status = 'INACTIVE' WHERE customerid = OLD.customerid;
END;
//
DELIMITER ;

DELIMITER //
CREATE TRIGGER update_customer BEFORE UPDATE ON doc_verification
FOR EACH ROW
BEGIN
    IF NEW.verification_status LIKE 'completed' THEN
        UPDATE customer SET is_verified = 'Y' WHERE customerid = NEW.customerid;
        -- MySQL does not support RAISE NOTICE
    END IF;
END;
//
DELIMITER ;

DELIMITER //
CREATE TRIGGER insert_verification AFTER INSERT ON CUSTOMER
FOR EACH ROW
BEGIN
    INSERT INTO doc_verification (customerid, address, verification_status, validation_status, comments)
    VALUES (NEW.customerid, NEW.address, 'Yet to Start', '', '');
END;
//
DELIMITER ;

call insert_verification();
