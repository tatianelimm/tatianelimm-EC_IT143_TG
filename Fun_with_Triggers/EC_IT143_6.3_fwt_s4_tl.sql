GO
-- AFTER UPDATE trigger
CREATE TRIGGER trg_AfterUpdate_Customers
ON dbo.t_w3_schools_customers
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE c
    SET 
        c.LastModified = GETDATE(),
        c.ModifiedBy = SUSER_NAME()
    FROM dbo.t_w3_schools_customers c
    INNER JOIN inserted i ON c.CustomerID = i.CustomerID;
END;
GO
