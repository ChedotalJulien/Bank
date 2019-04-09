	-- ------------------------------------------------------------------------------
-- - Reconstruction de la base de données                                     ---
-- ------------------------------------------------------------------------------
DROP DATABASE IF EXISTS Bank;
CREATE DATABASE Bank;
USE Bank;


-- -----------------------------------------------------------------------------
-- - Construction de la table des Customers                                ---
-- -----------------------------------------------------------------------------
CREATE TABLE T_Customers (
	IdCust			int(4)		PRIMARY KEY AUTO_INCREMENT,
	Name			varchar(20)	NOT NULL,
	FirstName		varchar(20)	NOT NULL
	
) ENGINE = InnoDB;

INSERT INTO T_Customers (IdCust, Name, FirstName) VALUES ( 1, 'Makana' ,	'Banjamin' );
INSERT INTO T_Customers (IdCust, Name, FirstName) VALUES ( 2, 'NGOUAMA',	'Jean Pierre' );
INSERT INTO T_Customers (IdCust, Name, FirstName) VALUES ( 3, 'NGOMA' ,		'Prince Deogratias' );
INSERT INTO T_Customers (IdCust, Name, FirstName) VALUES ( 4, 'Rastide',	'jane' );
INSERT INTO T_Customers (IdCust, Name, FirstName) VALUES ( 5, 'Ballois' ,	'Christ' );

SELECT * FROM T_Customers;

-- -----------------------------------------------------------------------------
-- - Construction de la table des Counts 	---
-- -----------------------------------------------------------------------------

CREATE TABLE T_Counts (
	NumCt				int(4) 		PRIMARY KEY AUTO_INCREMENT,  
	DateCreation                    datetime    	NOT NULL DEFAULT CURRENT_TIMESTAMP,       
	Balance                         float(8)        NOT NULL ,
          TypeCount			varchar(20)  	NOT NULL,
	IdCust				int(4)		NOT NULL REFERENCES T_Customers(IdCust)
) ENGINE = InnoDB;

INSERT INTO T_Counts (NumCt,DateCreation, Balance, TypeCount, IdCust) VALUES ( 5,now(),150,'CountCurrent',2);
INSERT INTO T_Counts (NumCt,DateCreation, Balance, TypeCount, IdCust) VALUES ( 6,now(),200,'CountCurrent',2);
INSERT INTO T_Counts (NumCt,DateCreation, Balance, TypeCount, IdCust) VALUES ( 10,now(),100,'CountCurrent',1);
INSERT INTO T_Counts (NumCt,DateCreation, Balance, TypeCount, IdCust) VALUES ( 20,now(),50,'CountCurrent',1);

SELECT * FROM T_Counts;

-- -----------------------------------------------------------------------------
-- - Construction de la table des CountCurrent 	---
-- -----------------------------------------------------------------------------
CREATE TABLE T_CountCurrent(
	NumCt			 int(4) 	PRIMARY KEY AUTO_INCREMENT,  
    	Balance              	 float(8)       NOT NULL REFERENCES T_Counts(Balance),
	Decouvert		 float(8)       NOT NULL
 ) ENGINE = InnoDB;

INSERT INTO T_CountCurrent (NumCt,Balance,Decouvert) VALUES (6 ,3000,500);
INSERT INTO T_CountCurrent (NumCt,Balance,Decouvert) VALUES (7,500,80);
INSERT INTO T_CountCurrent (NumCt,Balance,Decouvert) VALUES (8,45000,0);

SELECT * FROM T_CountCurrent;

-- -----------------------------------------------------------------------------
-- - Construction de la table des CountSaving 	---
-- -----------------------------------------------------------------------------
CREATE TABLE T_CountSaving(
	NumCt			 int(4) 	PRIMARY KEY AUTO_INCREMENT,  
    	Balance              	 float(8)       NOT NULL REFERENCES T_Counts(Balance),
	Taux			 float(8)       NOT NULL  DEFAULT 0
 ) ENGINE = InnoDB;

INSERT INTO T_CountSaving (NumCt,Balance,Taux) VALUES (9 ,13500,5.5);
INSERT INTO T_CountSaving (NumCt,Balance,Taux) VALUES (10,5700,5.5);
INSERT INTO T_CountSaving (NumCt,Balance,Taux) VALUES (11,4500,5.5);

SELECT * FROM T_CountSaving;


-- -----------------------------------------------------------------------------
-- - Construction de la table des Operations 	---
-- -----------------------------------------------------------------------------


CREATE TABLE T_Operations (
        NumOp                          int(4)         	PRIMARY KEY AUTO_INCREMENT, 
	DateOp			       datetime		NOT NULL DEFAULT CURRENT_TIMESTAMP, 
        Amount                         float(8)       	NOT NULL,	
	NumCt                          int(4) 		NOT NULL REFERENCES T_Counts(NumCt)  
) ENGINE = InnoDB; 

INSERT INTO T_Operations (NumOp,DateOp,Amount,NumCt) VALUES ( 1,250,now(),5);
INSERT INTO T_Operations (NumOp,DateOp,Amount,NumCt) VALUES ( 2,50,now(),5);
INSERT INTO T_Operations (NumOp,DateOp,Amount,NumCt) VALUES ( 3,90,now(),6);
INSERT INTO T_Operations (NumOp,DateOp,Amount,NumCt) VALUES ( 4,80,now(),10);
INSERT INTO T_Operations (NumOp,DateOp,Amount,NumCt) VALUES ( 5,200,now(),20);
 
SELECT * FROM T_Operations;


-- -----------------------------------------------------------------------------
-- - Construction de la table des opérations: Versements	---
-- -----------------------------------------------------------------------------

CREATE TABLE T_Payement (
  	NumOp                         int(4)         	PRIMARY KEY AUTO_INCREMENT,  
   	Amount  	               float(8)       	NOT NULL
) ENGINE = InnoDB; 

INSERT INTO T_Payement (NumOp,Amount) VALUES (1,950);
INSERT INTO T_Payement (NumOp,Amount) VALUES (2,20000);
INSERT INTO T_Payement (NumOp,Amount) VALUES (3,6500);
INSERT INTO T_Payement (NumOp,Amount) VALUES (4,8000);

SELECT * FROM T_Payement;

-- -----------------------------------------------------------------------------
-- - Construction de la table des opérations: Retraits	---
-- -----------------------------------------------------------------------------

CREATE TABLE T_Withdrawals (
   	NumOp                          int(4)         	PRIMARY KEY AUTO_INCREMENT,  
   	Amount                         float(8)       	NOT NULL
	 
) ENGINE = InnoDB; 

INSERT INTO T_Withdrawals (NumOp,Amount) VALUES (5,500);
INSERT INTO T_Withdrawals (NumOp,Amount) VALUES (6,1500);
INSERT INTO T_Withdrawals (NumOp,Amount) VALUES (7,450);
INSERT INTO T_Withdrawals (NumOp,Amount) VALUES (8,2000);

SELECT * FROM T_Retraits;


-- -----------------------------------------------------------------------------
-- - Construction de la table des utilisateurs 	---
-- -----------------------------------------------------------------------------

CREATE TABLE T_Users (
	IdUser				int(4)		PRIMARY KEY AUTO_INCREMENT,
	Login				varchar(20)	NOT NULL,
	Password			varchar(20)	NOT NULL,
	ConnectionNumber		int(4)		NOT NULL DEFAULT 0
) ENGINE = InnoDB;

INSERT INTO T_Users (IdUser, Login, Password) VALUES ( 1, 'Francois' ,	'Neo' );
INSERT INTO T_Users (IdUser, Login, Password) VALUES ( 2, 'Yim',	'Luke' );
INSERT INTO T_Users (IdUser, Login, Password) VALUES ( 3, 'Alseny' ,	'Snake' );
INSERT INTO T_Users (IdUser, Login, Password) VALUES ( 4, 'julien'   ,	'Ellen' );

SELECT * FROM T_Users;





















