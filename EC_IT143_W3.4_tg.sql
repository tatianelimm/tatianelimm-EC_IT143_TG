-- EC_IT143_W3.4_tg.sql
-- Author: Tatiane Galdino Lima
-- Description: SQL script with answers to 8 AdventureWorks questions.
-- Estimated runtime: varies by query complexity

-- Question 1 (Marginal Complexity) – Created by Tatiane Galdino Lima
-- What are the names and list prices of the top 10 most expensive products?
SELECT TOP 10 Name, ListPrice
FROM Production.Product
ORDER BY ListPrice DESC;

-- Question 2 (Marginal Complexity) – Created by Tatiane Galdino Lima
-- Which employees were hired in 2023?
SELECT BusinessEntityID, JobTitle, HireDate
FROM HumanResources.Employee
WHERE YEAR(HireDate) = 2023;

-- Question 3 (Moderate Complexity) – Created by [Colega 1]
-- What is the total revenue per product category? Please include list price and standard cost for each product.
SELECT 
    pc.Name AS Category,
    SUM(sod.LineTotal) AS TotalRevenue,
    AVG(p.ListPrice) AS AvgListPrice,
    AVG(p.StandardCost) AS AvgStandardCost
FROM Sales.SalesOrderDetail sod
JOIN Production.Product p ON sod.ProductID = p.ProductID
JOIN Production.ProductSubcategory ps ON p.ProductSubcategoryID = ps.ProductSubcategoryID
JOIN Production.ProductCategory pc ON ps.ProductCategoryID = pc.ProductCategoryID
GROUP BY pc.Name;

-- Question 4 (Moderate Complexity) – Created by [Colega 1]
-- Which customers from the United States placed more than three orders in the last year? Include customer ID, name, and order count.
SELECT c.CustomerID, p.FirstName + ' ' + p.LastName AS FullName, COUNT(soh.SalesOrderID) AS OrderCount
FROM Sales.Customer c
JOIN Sales.SalesOrderHeader soh ON c.CustomerID = soh.CustomerID
JOIN Person.Person p ON c.PersonID = p.BusinessEntityID
WHERE soh.OrderDate >= DATEADD(YEAR, -1, GETDATE())
  AND c.TerritoryID IN (
    SELECT TerritoryID FROM Sales.SalesTerritory WHERE CountryRegionCode = 'US'
)
GROUP BY c.CustomerID, p.FirstName, p.LastName
HAVING COUNT(soh.SalesOrderID) > 3;

-- Question 5 (Increased Complexity) – Created by [Colega 2]
-- For 'Mountain Bike' subcategory, what is the total quantity on hand for each product model, ordered by quantity descending?
SELECT pm.Name AS ModelName, SUM(pi.Quantity) AS TotalQuantity
FROM Production.Product p
JOIN Production.ProductInventory pi ON p.ProductID = pi.ProductID
JOIN Production.ProductModel pm ON p.ProductModelID = pm.ProductModelID
JOIN Production.ProductSubcategory ps ON p.ProductSubcategoryID = ps.ProductSubcategoryID
WHERE ps.Name = 'Mountain Bikes'
GROUP BY pm.Name
ORDER BY TotalQuantity DESC;

-- Question 6 (Increased Complexity) – Created by [Colega 2]
-- For all sales orders placed in July 2011, identify the top three sales persons by total order quantity.
SELECT TOP 3 p.FirstName + ' ' + p.LastName AS SalesPersonName, SUM(sod.OrderQty) AS TotalQuantity
FROM Sales.SalesOrderHeader soh
JOIN Sales.SalesOrderDetail sod ON soh.SalesOrderID = sod.SalesOrderID
JOIN Sales.SalesPerson sp ON soh.SalesPersonID = sp.BusinessEntityID
JOIN Person.Person p ON sp.BusinessEntityID = p.BusinessEntityID
WHERE MONTH(soh.OrderDate) = 7 AND YEAR(soh.OrderDate) = 2011
GROUP BY p.FirstName, p.LastName
ORDER BY TotalQuantity DESC;

-- Question 7 (Metadata) – Created by Tatiane Galdino Lima
-- Which tables in the AdventureWorks database contain the column name “ModifiedDate”?
SELECT TABLE_NAME, COLUMN_NAME
FROM INFORMATION_SCHEMA.COLUMNS
WHERE COLUMN_NAME = 'ModifiedDate';

-- Question 8 (Metadata) – Created by Tatiane Galdino Lima
-- List all columns that exist in tables starting with the name “Sales”. Include table name and column name.
SELECT TABLE_NAME, COLUMN_NAME
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME LIKE 'Sales%';
