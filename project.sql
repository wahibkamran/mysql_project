DROP TABLE IF EXISTS inventory;
DROP TABLE IF EXISTS purchases;
DROP TABLE IF EXISTS transactions;

CREATE TABLE inventory (
  itemID SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
  itemName CHAR(52) NOT NULL DEFAULT '',
  quantity INT(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (itemID)
);

CREATE TABLE purchases (
  purchaseID SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
  costumerName CHAR(52) NOT NULL DEFAULT '',
  quantityPurshased INT(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (purchaseID)
);

CREATE TABLE transactions (
  transactionID SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
  purchaseID SMALLINT UNSIGNED NOT NULL,  
  itemID SMALLINT UNSIGNED NOT NULL,
  PRIMARY KEY(transactionID),
  FOREIGN KEY (purchaseID) REFERENCES purchases(purchaseID),  
  FOREIGN KEY (itemID) REFERENCES inventory(itemID)
);

INSERT INTO inventory VALUES ('Eggs',60);
INSERT INTO inventory VALUES ('Milk',20);
INSERT INTO inventory VALUES ('Bread',15);
INSERT INTO inventory VALUES ('Cereal Boxes',11);
INSERT INTO inventory VALUES ('Bananas',36);
INSERT INTO inventory VALUES ('Biscuits',12);
INSERT INTO inventory VALUES ('Chocolate Boxes',9);
INSERT INTO inventory VALUES ('Chicken Fillets',17);
INSERT INTO inventory VALUES ('Tortilla Chips',16);
INSERT INTO inventory VALUES ('Orange Juice',21);

INSERT INTO purchases VALUES ('Bob',9);
INSERT INTO purchases VALUES ('Mary',3);
INSERT INTO purchases VALUES ('Jane',15);
INSERT INTO purchases VALUES ('Jack',3);
INSERT INTO purchases VALUES ('Ali',5);
INSERT INTO purchases VALUES ('Jill',11); 
INSERT INTO purchases VALUES ('William',1);
INSERT INTO purchases VALUES ('John', 4);
INSERT INTO purchases VALUES ('Sophia', 2); 
INSERT INTO purchases VALUES ('Brad', 21);
INSERT INTO purchases VALUES ('Mia', 12);
INSERT INTO purchases VALUES ('Elizabeth', 5);
INSERT INTO purchases VALUES ('Emily', 7);
INSERT INTO purchases VALUES ('Grace', 6);
INSERT INTO purchases VALUES ('Bella', 10);

INSERT INTO transactions VALUES(1,3);
INSERT INTO transactions VALUES(2,1);
INSERT INTO transactions VALUES(3,8);
INSERT INTO transactions VALUES(4,2);
INSERT INTO transactions VALUES(5,7);
INSERT INTO transactions VALUES(6,5);
INSERT INTO transactions VALUES(7,10);
INSERT INTO transactions VALUES(8,7);
INSERT INTO transactions VALUES(9,8);
INSERT INTO transactions VALUES(10,5);
INSERT INTO transactions VALUES(11,9);
INSERT INTO transactions VALUES(12,6);
INSERT INTO transactions VALUES(13,6);
INSERT INTO transactions VALUES(14,2);
INSERT INTO transactions VALUES(15,4);

SELECT itemName FROM inventory INNER JOIN transactions ON inventory.itemID=transactions.itemID;

SELECT costumerName FROM purchases INNER JOIN transactions ON purchases.purchaseID=transactions.purchaseID;

SELECT * FROM inventory LEFT JOIN transactions ON inventory.itemID=transactions.itemID;

SELECT * FROM purchases LEFT JOIN transactions ON purchases.purchaseID=transactions.purchaseID;

SELECT itemName FROM inventory WHERE itemID IN (SELECT itemID FROM purchases);

SELECT SUM(quantityPurshased) FROM purchases WHERE purchaseID IN (SELECT purchaseID FROM transactions);

SELECT costumerName,quantityPurshased FROM purchases WHERE purchaseID IN (SELECT purchaseID FROM transactions);

SELECT itemName, purchases.quantityPurshased FROM inventory INNER JOIN transactions ON inventory.itemID=transactions.itemID INNER JOIN purchases ON transactions.purchaseID=purchases.purchaseID;