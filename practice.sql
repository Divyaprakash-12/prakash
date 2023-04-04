create database sqltask15 
use sqltask15

CREATE TABLE Person (
    PersonID int PRIMARY KEY IDENTITY(1,1),
    LastName varchar(255),
    FirstName varchar(255),
    Address varchar(255),
    City varchar(255),
	Age INT
)

INSERT INTO Person VALUES('Hayes', 'Corey','123  Wern Ddu Lane','LUSTLEIGH',23)
INSERT INTO Person VALUES('Macdonald','Charlie','23  Peachfield Road','CEFN EINION',45)
INSERT INTO Person VALUES('Frost','Emma','85  Kingsway North','HOLTON',26)
INSERT INTO Person VALUES('Thomas', 'Tom','59  Dover Road', 'WESTER GRUINARDS',51)
INSERT INTO Person VALUES('Baxter','Cameron','106  Newmarket Road','HAWTHORPE',46)
INSERT INTO Person VALUES('Townsend','Imogen ','100  Shannon Way','CHIPPENHAM',20)
INSERT INTO Person VALUES('Preston','Taylor','14  Pendwyallt Road','BURTON',19)
INSERT INTO Person VALUES('Townsend','Imogen ','100  Shannon Way','CHIPPENHAM',18)
INSERT INTO Person VALUES('Khan','Jacob','72  Ballifeary Road','BANCFFOSFELEN',11)

--IMPLICIT TRANSACTIONS

SET IMPLICIT_TRANSACTIONS ON 
UPDATE 
    Person 
SET 
    Lastname = 'S', 
    Firstname = 'Sam' 
WHERE 
    PersonID = 2 

SELECT 
    IIF(@@OPTIONS & 2 = 2, 
    'Implicit Transaction Mode ON', 
    'Implicit Transaction Mode OFF'
    ) AS 'Transaction Mode' 
SELECT 
    @@TRANCOUNT AS OpenTransactions 
COMMIT TRAN 
SELECT 
    @@TRANCOUNT AS OpenTransactions

SET IMPLICIT_TRANSACTIONS OFF

--EXPLICIT TRANSACTIONS
select * from Person
--WITHOUT COMMIT
BEGIN TRAN
 
UPDATE Person 
SET    Lastname = 'L', 
        Firstname = 'Lucky' 
WHERE  PersonID = 1
 
SELECT @@TRANCOUNT AS OpenTransactions


--WITH COMMIT
BEGIN TRAN
UPDATE Person 
SET    Lastname = 'Leo', 
        Firstname = 'Luckyboy' 
WHERE  PersonID = 1
SELECT @@TRANCOUNT AS OpenTransactions 
COMMIT TRAN 
SELECT @@TRANCOUNT AS OpenTransactions

--ROLLBACK TRANSACTION
BEGIN TRAN
UPDATE Person 
SET    Lastname = 'Donald', 
        Firstname = 'Duck'  WHERE PersonID=2
 
 
SELECT * FROM Person WHERE PersonID=2
 
ROLLBACK TRAN 
 
SELECT * FROM Person WHERE PersonID=2

--SAVEPOINT
BEGIN TRANSACTION 
INSERT INTO Person 
VALUES('Mouse', 'Mini','500 South Buena Vista Street, Burbank','California',43)
SAVE TRANSACTION InsertStatement
DELETE Person WHERE PersonID=9
save transaction
SELECT * FROM Person 
ROLLBACK TRANSACTION InsertStatement
COMMIT
SELECT * FROM Person

--AUTO ROLLBACK
BEGIN TRAN
INSERT INTO Person 
VALUES('Bunny', 'Bugs','742 Evergreen Terrace','Springfield',54)
    
UPDATE Person SET Age='MiddleAge' WHERE PersonID=7
SELECT * FROM Person
 
COMMIT TRAN

--MARKED TRANSACTIONS
BEGIN TRAN DeletePerson WITH MARK 'MarkedTransactionDescription' 
    DELETE Person WHERE PersonID BETWEEN 3 AND 4
    
    COMMIT TRAN DeletePerson

select * from batch35

BEGIN TRAN Deletebatch35 WITH MARK 'MarkedTransactionDescription' 
    DELETE from batch35 WHERE empname='peter'
    
    COMMIT TRAN Deletebatch35