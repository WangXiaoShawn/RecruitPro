--User Defined Functions
--UDF1
USE HR
GO

IF OBJECT_ID('fnInterviewsEvaluation') IS NOT NULL--if eixit drop
DROP FUNCTION fnInterviewsEvaluation 
GO


CREATE FUNCTION fnInterviewsEvaluation 
(@HighBar INT,@LowBar INT) -- two inputs , if below the lowbar 'Reject'
-- higher than the highbar 'select'
-- otherwise next round of interview
RETURNS TABLE --return a table

RETURN
(
	SELECT ApplicationID, Decision=
	CASE 
	WHEN AVG(FinalGradeInterview1)>@HighBar THEN 'Select' -- aggerate functions to evluate the solution
	WHEN AVG(FinalGradeInterview1)<@LowBar THEN 'Reject'
	ELSE 'NextRound'
	END
	From dbo.FinalGradeInterview1
	GROUP BY ApplicationID -- group by each applicant
)

GO
--TEST
SELECT*
FROM fnInterviewsEvaluation(80,60)

Query:USE HR
GO

--UDF2
IF OBJECT_ID('fnFinalInterviewsEvaluation') IS NOT NULL--if eixit drop
DROP FUNCTION fnFinalInterviewsEvaluation 
GO


CREATE FUNCTION fnFinalInterviewsEvaluation 
(@Bar INT) -- one inputs , if below the bar 'Reject'  higher than the bar 'select'
RETURNS TABLE --return a table

RETURN
(
	SELECT ApplicationID, Decision=
	CASE 
	WHEN AVG(FinalGradeInterview2)>@Bar THEN 'Select' -- aggerate functions to evluate the solution
	ELSE 'Reject'
	END
	From dbo.FinalGradeInterview2
	GROUP BY ApplicationID -- group by each applicant
)

GO
--TEST
SELECT*
FROM fnFinalInterviewsEvaluation(80)
--UDF3
USE HR
GO

IF OBJECT_ID('JobTest') IS NOT NULL--if eixit drop
DROP FUNCTION JobTest 
GO


CREATE FUNCTION JobTest 
(@jobcode int) 
RETURNS TABLE 

RETURN
(
 --query logic:
-- read my E/R diag, from the diag, link the job-openingjobs to the evaluation from table to table linked by pk-fk
-- Application.ApplicationID,JOBS.JobCode,JobName,OpeningJobs.StartDate,TestTittle are can be grouped together present the relationship we want to explore.
-- use avg present the final grade for each test.
	SELECT Application.ApplicationID,JOBS.JobCode,JobName,OpeningJobs.StartDate AS[JobStartDate],TestTittle, AVG(GRADE) AS [TestResult]
	FROM  Recruitment.Application JOIN Recruitment.OpeningJobs ON  Recruitment.Application.OpeningJobsID=Recruitment.OpeningJobs.OpeningJobsID
      JOIN Recruitment.Jobs ON  Recruitment.Jobs.JobCode= Recruitment.OpeningJobs.JobCode
	  JOIN  Recruitment.Evaluation ON Recruitment.Evaluation.ApplicationID=Recruitment.Application.ApplicationID
	  JOIN Recruitment.Interviews ON Recruitment.Evaluation.InterviewID=Recruitment.Interviews.InterviewID
	  JOIN Recruitment.Tests ON Recruitment.Interviews.TestID=Recruitment.Tests.TestID
	WHERE Recruitment.Jobs.JobCode=@jobcode --only select the input jobcode
	GROUP BY Application.ApplicationID,JOBS.JobCode,JobName,OpeningJobs.StartDate,TestTittle
	
)

GO
--TEST
SELECT*
FROM JobTest (1)

--UDF4
USE HR
GO

IF OBJECT_ID('fnBestApplicant') IS NOT NULL--if eixit drop
DROP FUNCTION fnBestApplicant 
GO


CREATE FUNCTION fnBestApplicant 
(@TESTNAME nvarchar(50)) 
RETURNS TABLE 
-- query logic:
-- read my E/R diag, from the diag, link the job-openingjobs to the evaluation from table to table linked by pk-fk
-- Application.ApplicationID,JOBS.JobCode,JobName,OpeningJobs.StartDate,TestTittle are can be grouped together present the relationship we want to explore.
-- use avg present the final grade for each test.
RETURN
(
SELECT TOP 1 Application.ApplicationID,TestTittle, AVG(GRADE) AS [TestResult]--find the best
FROM  Recruitment.Application JOIN Recruitment.OpeningJobs ON  Recruitment.Application.OpeningJobsID=Recruitment.OpeningJobs.OpeningJobsID
      JOIN Recruitment.Jobs ON  Recruitment.Jobs.JobCode= Recruitment.OpeningJobs.JobCode
	  JOIN  Recruitment.Evaluation ON Recruitment.Evaluation.ApplicationID=Recruitment.Application.ApplicationID
	  JOIN Recruitment.Interviews ON Recruitment.Evaluation.InterviewID=Recruitment.Interviews.InterviewID
	  JOIN Recruitment.Tests ON Recruitment.Interviews.TestID=Recruitment.Tests.TestID
WHERE TestTittle=@TESTNAME --name mactch
GROUP BY Application.ApplicationID,JOBS.JobCode,JobName,OpeningJobs.StartDate,TestTittle
ORDER BY TestResult DESC --order score from high to low
)
GO
--TEST
select*
from fnBestApplicant('Programming1')