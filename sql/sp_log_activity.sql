CREATE OR ALTER PROCEDURE  [Metadata].[spLogActivity] (
	@ProcessName varchar(255),
	@DataSourceid int,
	@StartDateTime datetime,
	@EndDateTime datetime,
	@ProcessStatus varchar(10),
	@PipelineCallerRunID varchar(100),
	@PipelineRunID varchar(100))
AS
IF LOWER(@ProcessStatus) = 'running'
BEGIN
-- INSERT LOG
 INSERT INTO [sql-db-adf-metadata].[Metadata].[ProcessExecutionLog]
 (ProcessName, DataSourceID, StartDateTime, EndDateTime, ProcessStatus, PipelineCallerRunID, PipelineRunID)
 VALUES(@ProcessName, @DataSourceid, @StartDateTime, @EndDateTime, @ProcessStatus, @PipelineCallerRunID ,@PipelineRunID)
END
ELSE IF LOWER(@ProcessStatus) = 'success'
BEGIN
--  UPDATE LOG
UPDATE [sql-db-adf-metadata].[Metadata].[ProcessExecutionLog]
SET ProcessStatus = @ProcessStatus, EndDateTime = GETDATE(), PipelineRunID = @PipelineRunID
WHERE
	EndDateTime IS NULL
	AND ProcessStatus = 'running'
	AND PipelineCallerRunID = @PipelineCallerRunID
END