
CREATE TABLE [sql-db-adf-metadata].[Metadata].[ProcessExecutionLog] (
	LogId int IDENTITY(1,1) NOT NULL,
	ProcessName nvarchar(100) NULL,
	DataSourceID int NULL,
	StartDateTime datetime NULL,
	EndDateTime datetime NULL,
	ProcessStatus nvarchar(10) NULL,
	PipelineCallerRunID nvarchar(100) NULL,
	PipelineRunID nvarchar(100) NULL,
	CONSTRAINT PK_ProcessExecutionLog PRIMARY KEY (LogId)
);


-- foreign keys
ALTER TABLE [sql-db-adf-metadata].[Metadata].[ProcessExecutionLog] ADD CONSTRAINT FK_ProcessExecutionLog_DataSource FOREIGN KEY (DataSourceID) REFERENCES [sql-db-adf-metadata].[Metadata].[DataSource](DataSourceID);
