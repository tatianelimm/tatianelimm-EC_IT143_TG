-- Comparing function result with ad hoc result
SELECT ContactName,
       LEFT(ContactName, CHARINDEX(' ', ContactName + ' ') - 1) AS AdHoc_FirstName,
       dbo.fn_GetFirstName(ContactName) AS Function_FirstName
FROM dbo.t_w3_schools_customers;
