Select Education,COUNT(*) AS NUM--count
---JOIN APPLICATION-candidate-candidate information
From Recruitment.Application JOIN Recruitment.Candidates ON Recruitment.Application.CandidateID=Recruitment.Candidates.CandidateID
JOIN Recruitment.CandidatesInfo ON Recruitment.Candidates.CandidateID=Recruitment.CandidatesInfo.CandidateID
GROUP BY Education --use aggregate 


Select Education,COUNT(*) AS NUM 
---Join employee--APPLICATION-candidate-candidate information
From Recruitment.Application JOIN Recruitment.Employee ON Recruitment.Application.ApplicationID=  Recruitment.Employee.ApplicationID
JOIN Recruitment.Candidates ON Recruitment.Application.CandidateID=Recruitment.Candidates.CandidateID
JOIN Recruitment.CandidatesInfo ON Recruitment.Candidates.CandidateID=Recruitment.CandidatesInfo.CandidateID
GROUP BY Education
--------------
Select Education,AVG(GRADE) AS GRADE
---JOIN APPLICATION-candidate-candidate information-evaluation
From Recruitment.Application JOIN Recruitment.Candidates ON Recruitment.Application.CandidateID=Recruitment.Candidates.CandidateID
JOIN Recruitment.CandidatesInfo ON Recruitment.Candidates.CandidateID=Recruitment.CandidatesInfo.CandidateID
JOIN Recruitment.Evaluation ON Recruitment.Application.ApplicationID=Recruitment.Evaluation.ApplicationID
Group by Education
ORDER BY GRADE DESC
-------------------
select PlatformName, COUNT(*) AS NUMS
--JOIN-Application-- OPENJOBS---OPENJOBSPLATEFORM
from Recruitment.Application 
join Recruitment.OpeningJobs on Recruitment.Application.OpeningJobsID=Recruitment.OpeningJobs.OpeningJobsID
join Recruitment.JobOpeningPlatforms on Recruitment.OpeningJobs.JobJobOpeningPlatformID=Recruitment.JobOpeningPlatforms.JobOpeningPlatformID
group by PlatformName
-------------------------
SELECT*
FROM Recruitment.ComplaintHandling

SELECT AVG(GRADE) AS GRADE
FROM Recruitment.Application 
JOIN Recruitment.Evaluation ON Recruitment.Application.ApplicationID=Recruitment.Evaluation.ApplicationID
WHERE Recruitment.Application.ApplicationID<>6

SELECT Recruitment.Application.ApplicationID,AVG(GRADE) AS GRADE
FROM Recruitment.Application 
JOIN Recruitment.Evaluation ON Recruitment.Application.ApplicationID=Recruitment.Evaluation.ApplicationID
WHERE Recruitment.Application.ApplicationID=6
GROUP BY Recruitment.Application.ApplicationID



