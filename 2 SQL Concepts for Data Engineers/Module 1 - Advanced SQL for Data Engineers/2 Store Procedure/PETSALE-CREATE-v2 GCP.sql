-- Create Dataset
DE

-- Drop the table in case it exists

DROP TABLE DE.PETSALE;

-- Create the table

CREATE TABLE DE.PETSALE (
	ID INTEGER NOT NULL,
	ANIMAL STRING(20),
	SALEPRICE DECIMAL(6,2),
	SALEDATE DATE,
	QUANTITY INTEGER
	);

-- Insert sample data into the table

INSERT INTO DE.PETSALE VALUES
(1,'Cat',450.09,'2018-05-29',9),
(2,'Dog',666.66,'2018-06-01',3),
(3,'Parrot',50.00,'2018-06-04',2),
(4,'Hamster',60.60,'2018-06-11',6),
(5,'Goldfish',48.48,'2018-06-14',24);

-- Retrieve all records from the table

SELECT * FROM DE.PETSALE;


-- Store Procedure
CREATE PROCEDURE DE.RETRIEVE_ALL()
BEGIN
    WITH RETURN AS(                 
    SELECT * FROM DE.PETSALE)
    SELECT * FROM RETURN;
END

-- Call Store Procedure
CALL DE.RETRIEVE_ALL();

-- Delete Procedure
DROP PROCEDURE DE.RETRIEVE_ALL();

CALL DE.RETRIEVE_ALL();


-- Exercise 2

CREATE PROCEDURE DE.UPDATE_SALEPRICE ( 
    IN Animal_ID INT64 , IN Animal_Health STRING)     -- ( { IN/OUT type } { parameter-name } { data-type }, ... )

BEGIN 

    IF Animal_Health = 'BAD' THEN                           -- Start of conditional statement
        UPDATE DE.PETSALE
        SET SALEPRICE = SALEPRICE - (SALEPRICE * 0.25)
        WHERE ID = Animal_ID;
    
    ELSEIF Animal_Health = 'WORSE' THEN
        UPDATE DE.PETSALE
        SET SALEPRICE = SALEPRICE - (SALEPRICE * 0.5)
        WHERE ID = Animal_ID;
        
    ELSE
        UPDATE DE.PETSALE
        SET SALEPRICE = SALEPRICE
        WHERE ID = Animal_ID;

    END IF;                                                 -- End of conditional statement
    
END;


-- Check price of ID 1 Animal
CALL DE.RETRIEVE_ALL();

CALL DE.UPDATE_SALEPRICE(1, 'BAD');        -- Caller query

CALL DE.RETRIEVE_ALL();

CALL DE.UPDATE_SALEPRICE(3, 'WORSE');      -- Caller query

CALL DE.RETRIEVE_ALL();

