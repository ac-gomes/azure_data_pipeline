--Criar scehma
CREATE SCHEMA Metadata;


--Criar tabela
CREATE TABLE [sql-db-adf-metadata].[Metadata].[DataSource] (
	DataSourceID int IDENTITY(1,1) NOT NULL,
	ProcessName nvarchar(100) NOT NULL,
	EnvironmentName char(3) NOT NULL,
	DataSourceName nvarchar(200) NULL,
	DataSourceType nvarchar(50) NULL,
	DatabaseServerName nvarchar(200) NULL,
	DatabaseName nvarchar(50) NULL,
	DatabaseSchemaName nvarchar(50) NULL,
	DatabaseTableName nvarchar(100) NULL,
	SourceFileName nvarchar(200) NULL,
	SourceFilePath nvarchar(200) NULL,
	SourceConectionStringSecret nvarchar(300) NULL,
	SourceLoginSecret nvarchar(100) NULL,
	SourcePasswordSecret nvarchar(100) NULL,
	IsActive int NOT NULL,
	IsIncremental int NOT NULL,
	CreatedAt datetime DEFAULT getdate() NOT NULL,
	CONSTRAINT PK_DataSource PRIMARY KEY (DataSourceID)
);




INSERT INTO [sql-db-adf-metadata].[Metadata].[DataSource]
(ProcessName, EnvironmentName, DataSourceName, DataSourceType, DatabaseServerName, DatabaseName, DatabaseSchemaName, DatabaseTableName, SourceFileName, SourceFilePath, SourceConectionStringSecret, SourceLoginSecret, SourcePasswordSecret, IsActive, IsIncremental)
VALUES
('Sales','dev', 'SQL Server', 'DBMS', 'ACG-NOTE\MSSQLSERVER_SSAS', 'AdventureWorksDW2019', 'dbo', 'FactInternetSales', NULL, NULL, 'kv-dev-servername', 'kv-dev-datasource-user', 'kv-dev-datasource-pass', 1, 0),
('Sales','prd', 'SQL Server', 'DBMS', 'ACG-NOTE\MSSQLSERVER_SSAS', 'AdventureWorksDW2019', 'dbo', 'FactInternetSales', NULL, NULL, 'kv-dev-servername', 'kv-dev-datasource-user', 'kv-dev-datasource-pass', 0, 0),
('Inventory','dev', 'SQL Server', 'DBMS', 'ACG-NOTE\MSSQLSERVER_SSAS', 'AdventureWorksDW2019', 'dbo', 'FactProductInventory', NULL, NULL, 'kv-dev-servername', 'kv-dev-datasource-user', 'kv-dev-datasource-pass', 1, 0),
('Inventory','prd', 'SQL Server', 'DBMS', 'ACG-NOTE\MSSQLSERVER_SSAS', 'AdventureWorksDW2019', 'dbo', 'FactProductInventory', NULL, NULL, 'kv-dev-servername', 'kv-dev-datasource-user', 'kv-dev-datasource-pass', 0, 0);
