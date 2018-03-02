USE [msdb]
GO

/****** Object:  Job [SQLGREENDREAM AUTODATA]    Script Date: 3/2/2018 9:31:04 AM ******/
EXEC msdb.dbo.sp_delete_job @job_id=N'9b584ff0-9dcc-4214-938a-d5fcf4e5c924', @delete_unused_schedule=1
GO

