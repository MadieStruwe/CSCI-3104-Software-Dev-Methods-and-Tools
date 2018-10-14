/* Madelaine Struwe
Joshuah Nguyen
Blaise Page */

/*1*/
SELECT LastName, FirstName 
FROM nwEmployees
WHERE Country!='USA' AND YEAR(HireDate) < YEAR(DATE_SUB(CURDATE(), INTERVAL 5 YEAR))
ORDER BY LastName ASC;

/*2*/
SELECT ProductID, ProductName, UnitsInStock, UnitPrice
FROM nwProducts
WHERE ReorderLevel >= UnitsInStock
AND Discontinued=0;

/*3*/
SELECT ProductName, UnitPrice
FROM nwProducts
ORDER BY UnitPrice DESC LIMIT 1;

/*4*/
SELECT ProductID, ProductName, (UnitsInStock * UnitPrice)
AS 'Total Inventory Value'
FROM nwProducts
WHERE (UnitsInStock * UnitPrice) > 2000
ORDER BY (UnitsInStock * UnitPrice) DESC;

/*5*/
SELECT ShipCountry, COUNT(ShipCountry)
FROM nwOrders
WHERE ShippedDate BETWEEN '2013/09/01' AND '2013/09/30'
AND ShipCountry!='USA' 
GROUP BY ShipCountry
ORDER BY ShipCountry ASC;

/*6*/
SELECT nwCustomers.CustomerID, CompanyName
FROM nwCustomers, nwOrders
WHERE nwCustomers.CustomerID=nwOrders.CustomerID
GROUP BY CustomerID HAVING COUNT(OrderID) > 20;

/*7*/
SELECT SupplierID, SUM(UnitsInStock * UnitPrice) AS 'value of inventory'
FROM nwProducts
GROUP BY SupplierID HAVING COUNT(SupplierID) > 3;

/*8*/
SELECT CompanyName, ProductName, UnitPrice
FROM nwSuppliers, nwProducts
WHERE nwSuppliers.SupplierID=nwProducts.SupplierID
AND Country='USA'
ORDER BY UnitPrice DESC;

/*9*/
SELECT LastName, FirstName, Title, Extension
FROM nwEmployees, nwOrders
WHERE nwEmployees.EmployeeID = nwOrders.EmployeeID
GROUP BY LastName, FirstName, Title, Extension HAVING COUNT(OrderID) > 100
ORDER BY LastName, FirstName ASC;

/*10*/
SELECT CustomerID
FROM nwCustomers
WHERE CustomerID
NOT In (
SELECT CustomerID
from nwOrders);

/*11*/
SELECT CompanyName, ContactName, CategoryName, Description, ProductName, UnitsOnOrder
FROM nwSuppliers, nwCategories, nwProducts
WHERE nwCategories.CategoryID=nwProducts.CategoryID
AND nwSuppliers.SupplierID=nwProducts.SupplierID
AND UnitsInStock=0
GROUP BY CompanyName, ContactName, CategoryName, Description, ProductName, UnitsOnOrder
ORDER BY 1;

/*12*/
SELECT ProductName, UnitsInStock, CompanyName, Country
FROM nwProducts, nwSuppliers
WHERE QuantityPerUnit like '%bottles%'
AND nwProducts.SupplierID = nwSuppliers.SupplierID;

/*13*/
DROP TABLE IF EXISTS Top_Items;
CREATE TABLE Top_Items
(
ItemID        int          NOT NULL,
ItemCode      int          NOT NULL,
ItemName      varchar(40)  NOT NULL,
InventoryDate date         NOT NULL,
SupplierID    int          NOT NULL,
ItemQuantity  int          NOT NULL    DEFAULT '1',
ItemPrice     decimal(9,2) NOT NULL    DEFAULT '0',

PRIMARY KEY (ItemID)
)
CHARACTER SET utf8 COLLATE utf8_general_ci;

/*14*/

SELECT *
FROM Top_Items;

INSERT INTO Top_Items
(
ItemID,
ItemCode,
ItemName,
InventoryDate,
SupplierID,
ItemQuantity,
ItemPrice
)
SELECT
ProductID, CategoryID, ProductName, (CURDATE()), UnitsInStock, UnitPrice, SupplierID
FROM nwProducts
WHERE (UnitPrice * UnitsInStock) > 2500;

/*15*/
DELETE Top_Items
FROM Top_Items, nwSuppliers
WHERE Top_Items.SupplierID=nwSuppliers.SupplierID
AND Country='Canada';

/*16*/
ALTER TABLE Top_Items
ADD InventoryValue decimal(9,2);
SELECT ItemID,
ItemCode,
ItemName,
InventoryDate,
InventoryValue,
SupplierID,
ItemQuantity,
ItemPrice
FROM Top_Items;

/*17*/
UPDATE Top_Items
SET InventoryValue = (ItemPrice * ItemQuantity);

/*18*/
DROP TABLE Top_Items;