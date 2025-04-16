--data loading log (Start and end time of download, status (successful/error)) ETL_Run_Log
CREATE TABLE dbo.ETL_Run_Log (
    RunID INT IDENTITY(1,1) PRIMARY KEY,
    PackageName VARCHAR(100),
    StartTime DATETIME,
    EndTime DATETIME,
    Status VARCHAR(20),
    Message NVARCHAR(MAX)
);
--error log (ETL_Error_Log)
CREATE TABLE dbo.ETL_Error_Log (
    ErrorID INT IDENTITY(1,1) PRIMARY KEY,
    RunID INT,
    TaskName VARCHAR(100),
    ErrorMessage NVARCHAR(MAX),
    ErrorTime DATETIME DEFAULT GETDATE()
);
--Table_Row_Count_Log (How many rows were loaded into each table)
CREATE TABLE dbo.Table_Row_Count_Log (
    LogID INT IDENTITY(1,1) PRIMARY KEY,
    RunID INT,                              -- внешний ключ к ETL_Run_Log.RunID
    TableName VARCHAR(100),
    [RowCount] INT,
    LoggedAt DATETIME DEFAULT GETDATE()
);




----ETL_Config (опционально) ETL settings - paths, parameters, etc.
CREATE TABLE dbo.ETL_Config (
    ConfigKey VARCHAR(100) PRIMARY KEY,
    ConfigValue VARCHAR(500),
    Description NVARCHAR(1000) NULL
);
