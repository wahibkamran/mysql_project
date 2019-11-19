DROP TABLE IF EXISTS inventory;
DROP TABLE IF EXISTS purchases;
DROP TABLE IF EXISTS transactions;

CREATE TABLE inventory (
  itemID SMALLINT UNSIGNED NOT NULL,
  itemName CHAR(52) NOT NULL DEFAULT '',
  quantity INT(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (itemID)
);

CREATE TABLE purchases (
  purchaseID SMALLINT UNSIGNED NOT NULL,
  costumerName CHAR(52) NOT NULL DEFAULT '',
  quantityPurshased INT(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (purchaseID)
);

CREATE TABLE transactions (
  transactionID SMALLINT UNSIGNED NOT NULL,
  purchaseID SMALLINT UNSIGNED NOT NULL,  
  itemID SMALLINT UNSIGNED NOT NULL,
  PRIMARY KEY(transactionID),
  FOREIGN KEY (purchaseID) REFERENCES purchases(purchaseID),  
  FOREIGN KEY (itemID) REFERENCES inventory(itemID)
);

INSERT INTO inventory VALUES (1,'Eggs',60);
INSERT INTO inventory VALUES (2,'Milk',20);
INSERT INTO inventory VALUES (3,'Bread',15);
INSERT INTO inventory VALUES (4,'Cereal Boxes',11);
INSERT INTO inventory VALUES (5,'Bananas',36);
INSERT INTO inventory VALUES (6,'Biscuits',12);
INSERT INTO inventory VALUES (7,'Chocolate Boxes',9);
INSERT INTO inventory VALUES (8,'Chicken Fillets',17);
INSERT INTO inventory VALUES (9,'Tortilla Chips',16);
INSERT INTO inventory VALUES (10,'Orange Juice',21);

INSERT INTO purchases VALUES (1,'Bob',9);
INSERT INTO purchases VALUES (2,'Mary',3);
INSERT INTO purchases VALUES (3,'Jane',15);
INSERT INTO purchases VALUES (4,'Jack',3);
INSERT INTO purchases VALUES (5,'Ali',5);
INSERT INTO purchases VALUES (6,'Jill',11); 
INSERT INTO purchases VALUES (7,'William',1);
INSERT INTO purchases VALUES (8,'John', 4);
INSERT INTO purchases VALUES (9,'Sophia', 2); 
INSERT INTO purchases VALUES (10,'Brad', 21);
INSERT INTO purchases VALUES (11,'Mia', 12);
INSERT INTO purchases VALUES (12,'Elizabeth', 5);
INSERT INTO purchases VALUES (13,'Emily', 7);
INSERT INTO purchases VALUES (14,'Grace', 6);
INSERT INTO purchases VALUES (15,'Bella', 10);

INSERT INTO transactions VALUES(1,1,3);
INSERT INTO transactions VALUES(2,2,1);
INSERT INTO transactions VALUES(3,3,8);
INSERT INTO transactions VALUES(4,4,2);
INSERT INTO transactions VALUES(5,5,7);
INSERT INTO transactions VALUES(6,6,5);
INSERT INTO transactions VALUES(7,7,10);
INSERT INTO transactions VALUES(8,8,7);
INSERT INTO transactions VALUES(9,9,8);
INSERT INTO transactions VALUES(10,10,5);
INSERT INTO transactions VALUES(11,11,9);
INSERT INTO transactions VALUES(12,12,6);
INSERT INTO transactions VALUES(13,13,6);
INSERT INTO transactions VALUES(14,14,2);
INSERT INTO transactions VALUES(15,15,4);

SELECT itemName FROM inventory INNER JOIN transactions ON inventory.itemID=transactions.itemID;

SELECT costumerName FROM purchases INNER JOIN transactions ON purchases.purchaseID=transactions.purchaseID;

SELECT * FROM inventory LEFT JOIN transactions ON inventory.itemID=transactions.itemID;

SELECT * FROM purchases LEFT JOIN transactions ON purchases.purchaseID=transactions.purchaseID;

SELECT itemName FROM inventory WHERE itemID IN (SELECT itemID FROM purchases);

SELECT SUM(quantityPurshased) FROM purchases WHERE purchaseID IN (SELECT purchaseID FROM transactions);

SELECT costumerName,quantityPurshased FROM purchases WHERE purchaseID IN (SELECT purchaseID FROM transactions);

SELECT itemName, purchases.quantityPurshased FROM inventory INNER JOIN transactions ON inventory.itemID=transactions.itemID INNER JOIN purchases ON transactions.purchaseID=purchases.purchaseID;
