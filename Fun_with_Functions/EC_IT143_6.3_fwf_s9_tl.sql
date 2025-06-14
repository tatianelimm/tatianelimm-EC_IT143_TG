GO
-- Scalar function: extract last name
CREATE FUNCTION dbo.fn_GetLastName (@ContactName VARCHAR(50))
RETURNS VARCHAR(50)
AS
BEGIN
    RETURN LTRIM(RIGHT(@ContactName, LEN(@ContactName) - CHARINDEX(' ', @ContactName + ' ')))
END;
GO
