-- Step 1: How many players are on each team (with team name)?

-- Step 2: To answer this, I need to count the number of players grouped by team, joining tblPlayerDim and tblTeamDim to get the team code.

-- Step 3: Ad hoc query
SELECT t.t_code AS TeamCode, COUNT(*) AS PlayerCount
FROM dbo.tblPlayerDim p
JOIN dbo.tblTeamDim t ON p.t_id = t.t_id
GROUP BY t.t_code;

-- Step 4: Create the view
DROP VIEW IF EXISTS v_PlayerCountPerTeam;
GO
CREATE VIEW v_PlayerCountPerTeam AS
SELECT t.t_code AS TeamCode, COUNT(*) AS PlayerCount
FROM dbo.tblPlayerDim p
JOIN dbo.tblTeamDim t ON p.t_id = t.t_id
GROUP BY t.t_code;
GO

-- Step 5: Create table from the view
DROP TABLE IF EXISTS t_PlayerCountPerTeam;
GO
SELECT * INTO t_PlayerCountPerTeam FROM v_PlayerCountPerTeam;
GO

-- Step 6: Load data from view into the table
TRUNCATE TABLE t_PlayerCountPerTeam;
INSERT INTO t_PlayerCountPerTeam
SELECT * FROM v_PlayerCountPerTeam;
GO

-- Step 7: Create the stored procedure
DROP PROCEDURE IF EXISTS sp_LoadPlayerCountPerTeam;
GO
CREATE PROCEDURE sp_LoadPlayerCountPerTeam
AS
BEGIN
    TRUNCATE TABLE t_PlayerCountPerTeam;
    INSERT INTO t_PlayerCountPerTeam
    SELECT * FROM v_PlayerCountPerTeam;
END
GO

-- Step 8: Call the stored procedure
EXEC sp_LoadPlayerCountPerTeam;