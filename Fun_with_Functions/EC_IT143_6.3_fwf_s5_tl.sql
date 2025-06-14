-- Scalar function: extract first name
CREATE FUNCTION dbo.fn_GetFirstName (@ContactName VARCHAR(50))
RETURNS VARCHAR(50)
AS
BEGIN
    RETURN LEFT(@ContactName, CHARINDEX(' ', @ContactName + ' ') - 1)
END;
