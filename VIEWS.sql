--VIEWS
---VIEW1
USE HR;
GO
--If EXIST DROP
IF OBJECT_ID('FinalGradeInterview1') IS NOT NULL
DROP VIEW FinalGradeInterview1;
GO

CREATE VIEW FinalGradeInterview1 AS
SELECT Recruitment.Evaluation.ApplicationID,Recruitment.Tests.TestTittle,AVG(Recruitment.Evaluation.GRADE)AS [FinalGradeInterview1]
--Use average grade of three grader as the final grade
FROM  Recruitment.Evaluation JOIN Recruitment.Interviews ON Recruitment.Evaluation.InterviewID=Recruitment.Interviews.InterviewID
		JOIN Recruitment.Tests ON Recruitment.Interviews.TestID=Recruitment.Tests.TestID
WHERE Recruitment.Tests.TestTittle='Programming1' or Recruitment.Tests.TestTittle='SystemDesign1'--2 TESTS in interview1
GROUP BY  Recruitment.Evaluation.ApplicationID, Recruitment.Tests.TestTittle
GO
--TEST
SELECT*
FROM FinalGradeInterview1;

--VIEW2
--If EXIST DROP
USE HR;
GO
IF OBJECT_ID('FinalGradeInterview2') IS NOT NULL
DROP VIEW FinalGradeInterview2;
GO

CREATE VIEW FinalGradeInterview2 AS
SELECT Recruitment.Evaluation.ApplicationID,Recruitment.Tests.TestTittle,AVG(Recruitment.Evaluation.GRADE)AS [FinalGradeInterview2]
--Use average grade of three grader as the final grade
FROM  Recruitment.Evaluation JOIN Recruitment.Interviews ON Recruitment.Evaluation.InterviewID=Recruitment.Interviews.InterviewID
		JOIN Recruitment.Tests ON Recruitment.Interviews.TestID=Recruitment.Tests.TestID
WHERE Recruitment.Tests.TestTittle='Programming2' or Recruitment.Tests.TestTittle='SystemDesign2'--2 TESTS in interview1
GROUP BY  Recruitment.Evaluation.ApplicationID, Recruitment.Tests.TestTittle
GO
--TEST
SELECT*
FROM FinalGradeInterview2;

--VIEW3
USE HR;
GO
--If EXIST DROP
IF OBJECT_ID('JobTestScore') IS NOT NULL
DROP VIEW JobTestScore ;
GO
-- query logic:
-- read my E/R diag, from the diag, link the job-openingjobs to the evaluation from table to table linked by pk-fk
-- Application.ApplicationID,JOBS.JobCode,JobName,OpeningJobs.StartDate,TestTittle are can be grouped together present the relationship we want to explore.
-- use avg present the final grade for each test.
CREATE VIEW JobTestScore AS
SELECT Application.ApplicationID,JOBS.JobCode,JobName,OpeningJobs.StartDate AS[JobStartDate],TestTittle, AVG(GRADE) AS [TestResult]
FROM  Recruitment.Application JOIN Recruitment.OpeningJobs ON  Recruitment.Application.OpeningJobsID=Recruitment.OpeningJobs.OpeningJobsID
      JOIN Recruitment.Jobs ON  Recruitment.Jobs.JobCode= Recruitment.OpeningJobs.JobCode
	  JOIN  Recruitment.Evaluation ON Recruitment.Evaluation.ApplicationID=Recruitment.Application.ApplicationID
	  JOIN Recruitment.Interviews ON Recruitment.Evaluation.InterviewID=Recruitment.Interviews.InterviewID
	  JOIN Recruitment.Tests ON Recruitment.Interviews.TestID=Recruitment.Tests.TestID
GROUP BY Application.ApplicationID,JOBS.JobCode,JobName,OpeningJobs.StartDate,TestTittle
GO
--TEST3
SELECT *
FROM JobTestScore

--VIEW4
USE HR;
GO

IF OBJECT_ID('EligbleReimbursement') IS NOT NULL
DROP VIEW EligbleReimbursement;
GO
-- query logic:
--1. location of candidate cannot near to the interview
--2  the interview must be onesite interview
-- read my E/R diag, from the diag, link the candidateInfo to the interview Type from table to table linked by pk-fk

CREATE VIEW EligbleReimbursement AS
SELECT distinct Recruitment.Application.ApplicationID
FROM 
Recruitment.Application JOIN Recruitment.Candidates ON Recruitment.Candidates.CandidateID=Recruitment.Application.CandidateID
JOIN Recruitment.CandidatesInfo ON Recruitment.Candidates.CandidateID=Recruitment.CandidatesInfo.CandidateID
JOIN Recruitment.Evaluation ON Recruitment.Evaluation.ApplicationID=Recruitment.Application.ApplicationID
JOIN Recruitment.Interviews ON Recruitment.Evaluation.InterviewID=Recruitment.Interviews.InterviewID
JOIN Recruitment.InterviewTypes ON Recruitment.Interviews.InterviewTypeID=Recruitment.InterviewTypes.InterviewTypeID
WHERE Recruitment.CandidatesInfo.LocationInfo<>Recruitment.Interviews.InterviewLocation AND InterviewType='Onsite'
GO
--TEST
SELECT*
FROM EligbleReimbursement;