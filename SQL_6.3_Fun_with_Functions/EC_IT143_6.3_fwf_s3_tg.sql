-- Ad hoc query para extrair primeiro nome
SELECT ContactName, LEFT(ContactName, CHARINDEX(' ', ContactName + ' ') - 1) AS FirstName
FROM dbo.t_w3_schools_customers;
