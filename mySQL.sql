USE hw_1;
SELECT * FROM phones;

SELECT ProductName, Manufacture, price 
FROM phones
WHERE ProductCount >2;

SELECT * FROM phones
WHERE Manufacture = "Samsung";

SELECT * FROM phones
WHERE ProductName LIKE "%iPhone%";

SELECT * FROM phones
WHERE Manufacture LIKE "%Samsung%";

SELECT * FROM phones
WHERE ProductName LIKE '%[0-9]%';

SELECT * FROM phones
WHERE ProductName LIKE '%8';