-- Teste para 0 resultados
WITH Test AS (
    SELECT ContactName
    FROM dbo.t_w3_schools_customers
    WHERE dbo.fn_GetFirstName(ContactName) <> LEFT(ContactName, CHARINDEX(' ', ContactName + ' ') - 1)
)
SELECT * FROM Test;
