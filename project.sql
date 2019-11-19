SELECT itemName FROM inventory INNER JOIN transactions ON inventory.itemID=transactions.itemID;

SELECT costumerName FROM purchases INNER JOIN transactions ON purchases.purchaseID=transactions.purchaseID;

SELECT * FROM inventory LEFT JOIN transactions ON inventory.itemID=transactions.itemID;

SELECT * FROM purchases LEFT JOIN transactions ON purchases.purchaseID=transactions.purchaseID;

SELECT itemName FROM inventory WHERE itemID IN (SELECT itemID FROM purchases);

SELECT SUM(quantityPurshased) FROM purchases WHERE purchaseID IN (SELECT purchaseID FROM transactions);

SELECT costumerName,quantityPurshased FROM purchases WHERE purchaseID IN (SELECT purchaseID FROM transactions);

SELECT itemName, purchases.quantityPurshased FROM inventory INNER JOIN transactions ON inventory.itemID=transactions.itemID INNER JOIN purchases ON transactions.purchaseID=purchases.purchaseID;
