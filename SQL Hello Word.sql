-- Step 1: The Question
-- What is the message 'Hello, World!'?

-- Step 2: The Initial Answer
-- I wrote a query that returns the text 'Hello, World!'.

-- Step 3: Ad hoc query
SELECT 'Hello, World!' AS Message;

-- Step 4: Create the view
DROP VIEW IF EXISTS v_HelloWorld;
GO
CREATE VIEW v_HelloWorld AS
SELECT 'Hello, World!' AS Message;
GO

-- Step 5: Create a table from the view
DROP TABLE IF EXISTS t_HelloWorld;
GO
SELECT * INTO t_HelloWorld FROM v_HelloWorld;
GO

-- Step 6: Load data from the view into the table
TRUNCATE TABLE t_HelloWorld;
INSERT INTO t_HelloWorld
SELECT * FROM v_HelloWorld;
GO

-- Step 7: Stored procedure
DROP PROCEDURE IF EXISTS sp_LoadHelloWorld;
GO
CREATE PROCEDURE sp_LoadHelloWorld
AS
BEGIN
    TRUNCATE TABLE t_HelloWorld;
    INSERT INTO t_HelloWorld
    SELECT * FROM v_HelloWorld;
END
GO

-- Step 8: Call the Procedure
EXEC sp_LoadHelloWorld;
