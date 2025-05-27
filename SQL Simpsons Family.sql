-- Step 1: How many different job titles are there in the Simpson family?

-- Step 2: To answer this, I need to count the distinct values in the Job_Title column from the SimpsonFamily table.
-- Next, I will write a SQL query to find this number.

-- Step 3: Ad hoc query
SELECT COUNT(DISTINCT Job_Title) AS UniqueJobTitles FROM SimpsonFamily;

-- Step 4: Create the view
DROP VIEW IF EXISTS v_SimpsonJobTitles;
GO
CREATE VIEW v_SimpsonJobTitles AS
SELECT DISTINCT Job_Title FROM SimpsonFamily;
GO

-- Step 5: Create table from the view
DROP TABLE IF EXISTS t_UniqueSimpsonJobs;
GO
SELECT COUNT(*) AS UniqueJobTitles INTO t_UniqueSimpsonJobs FROM v_SimpsonJobTitles;
GO

-- Step 6: Load data from the view into the table
TRUNCATE TABLE t_UniqueSimpsonJobs;
INSERT INTO t_UniqueSimpsonJobs
SELECT COUNT(*) AS UniqueJobTitles FROM v_SimpsonJobTitles;
GO

-- Step 7: Create the stored procedure
DROP PROCEDURE IF EXISTS sp_LoadUniqueSimpsonJobs;
GO
CREATE PROCEDURE sp_LoadUniqueSimpsonJobs
AS
BEGIN
    TRUNCATE TABLE t_UniqueSimpsonJobs;
    INSERT INTO t_UniqueSimpsonJobs
    SELECT COUNT(*) AS UniqueJobTitles FROM v_SimpsonJobTitles;
END
GO

-- Step 8: Call the stored procedure
EXEC sp_LoadUniqueSimpsonJobs;
