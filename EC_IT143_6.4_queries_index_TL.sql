-- Deliverable 6.4 - Performance Analysis (Corrected)
-- Author: Tati Lima

-- STEP 1: Poor performing query (no index on City column)
SELECT * 
FROM dbo.t_w3_schools_customers
WHERE City = 'Berlin';
GO

-- STEP 2: View Execution Plan before creating the index

-- STEP 3: Create index on City to improve performance
CREATE NONCLUSTERED INDEX idx_customers_city
ON dbo.t_w3_schools_customers (City);
GO

-- STEP 4: Rerun the query after index creation
SELECT * 
FROM dbo.t_w3_schools_customers
WHERE City = 'Berlin';
GO

-- STEP 5: Poor performing query #2 (no index on Country)
SELECT * 
FROM dbo.t_w3_schools_customers
WHERE Country = 'Germany';
GO

-- STEP 6: View Execution Plan before index

-- STEP 7: Create index on Country
CREATE NONCLUSTERED INDEX idx_customers_country
ON dbo.t_w3_schools_customers (Country);
GO

-- STEP 8: Rerun the query after index creation
SELECT * 
FROM dbo.t_w3_schools_customers
WHERE Country = 'Germany';
GO
