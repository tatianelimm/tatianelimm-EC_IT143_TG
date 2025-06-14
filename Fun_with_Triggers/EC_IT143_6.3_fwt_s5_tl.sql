-- Trigger test
UPDATE dbo.t_w3_schools_customers
SET ContactName = 'Maria Souza'
WHERE CustomerID = 1;

SELECT CustomerID, ContactName, LastModified, ModifiedBy
FROM dbo.t_w3_schools_customers
WHERE CustomerID = 1;
