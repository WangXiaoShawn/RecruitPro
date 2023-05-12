CREATE LOGIN Lord WITH PASSWORD = '12345678',
DEFAULT_DATABASE = HR;
GO

CREATE USER WANGXIAO FOR LOGIN [Lord];
ALTER ROLE CandidateManager ADD MEMBER WANGXIAO
ALTER ROLE InterviewManager ADD MEMBER WANGXIAO
ALTER ROLE ReimbursementManager ADD MEMBER WANGXIAO
ALTER ROLE ApplicationManager ADD MEMBER WANGXIAO
ALTER ROLE JobManager ADD MEMBER WANGXIAO

------------------
CREATE LOGIN CandidateGroup WITH PASSWORD = '12345678',
DEFAULT_DATABASE = HR;
GO

CREATE USER DongLu FOR LOGIN [CandidateGroup];
ALTER ROLE CandidateManager ADD MEMBER DongLu
------------------------
CREATE LOGIN JobGroup WITH PASSWORD = '12345678',
DEFAULT_DATABASE = HR;
GO

CREATE USER WangPiPi FOR LOGIN [JobGroup];
ALTER ROLE JobManager ADD MEMBER WangPiPi
-------------------------
CREATE LOGIN InterviewGroup WITH PASSWORD = '12345678',
DEFAULT_DATABASE = HR;
GO

CREATE USER Shawn FOR LOGIN [InterviewGroup];
ALTER ROLE InterviewManager ADD MEMBER Shawn
-----------------------------
CREATE LOGIN ReimbursementGroup WITH PASSWORD = '12345678',
DEFAULT_DATABASE = HR;
GO

CREATE USER Robin FOR LOGIN [ReimbursementGroup];
ALTER ROLE ReimbursementManager ADD MEMBER Robin
--------------------------------
CREATE LOGIN ApplicationGroup WITH PASSWORD = '12345678',
DEFAULT_DATABASE = HR;
GO

CREATE USER Jack FOR LOGIN [ApplicationGroup];
ALTER ROLE ApplicationManager ADD MEMBER Jack
-----------------------------------