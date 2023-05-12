CREATE ROLE CandidateManager;
GRANT UPDATE, INSERT
ON Recruitment.Candidates TO CandidateManager;
GRANT UPDATE, INSERT
ON Recruitment.CandidatesInfo TO CandidateManager;
GRANT UPDATE, INSERT
ON Recruitment.CandidatesDocuments TO CandidateManager;
ALTER ROLE db_datareader ADD MEMBER CandidateManager

--Role for JobManager
CREATE ROLE JobManager;
GRANT UPDATE, INSERT
ON  Recruitment.JobTypes TO JobManager;
GRANT UPDATE, INSERT
ON  Recruitment.JobMediums TO JobManager;
GRANT UPDATE, INSERT
ON  Recruitment.JobCategories TO JobManager;
GRANT UPDATE, INSERT
ON  Recruitment.JobPositions TO JobManager;
GRANT UPDATE, INSERT
ON  Recruitment.JobOpeningPlatforms TO JobManager;
GRANT UPDATE, INSERT
ON  Recruitment.Jobs TO JobManager;
GRANT UPDATE, INSERT
ON  Recruitment.OpeningJobs TO JobManager;
ALTER ROLE db_datareader ADD MEMBER JobManager
--Role for InterviewManager

CREATE ROLE InterviewManager;
GRANT UPDATE, INSERT
ON  Recruitment.Interviewers TO InterviewManager;
GRANT UPDATE, INSERT
ON  Recruitment.TestTypes TO InterviewManager;
GRANT UPDATE, INSERT
ON  Recruitment.Tests  TO InterviewManager;
GRANT UPDATE, INSERT
ON  Recruitment.InterviewTypes TO InterviewManager;
GRANT UPDATE, INSERT
ON  Recruitment.Interviews TO InterviewManager;
ALTER ROLE db_datareader ADD MEMBER InterviewManager

--Role ReimbursementManager
CREATE ROLE ReimbursementManager;
GRANT UPDATE, INSERT
ON  Recruitment.Reimbursement TO ReimbursementManager;
GRANT UPDATE, INSERT
ON  Recruitment.AirlineReservations TO ReimbursementManager;
GRANT UPDATE, INSERT
ON  Recruitment.HotelReservations TO ReimbursementManager;
GRANT UPDATE, INSERT
ON  Recruitment.CarRentals TO ReimbursementManager;
ALTER ROLE db_datareader ADD MEMBER ReimbursementManager

--Role ApplicationManager
CREATE ROLE  ApplicationManager;
GRANT UPDATE, INSERT
ON  Recruitment.OnCallType TO ApplicationManager ;
GRANT UPDATE, INSERT
ON  Recruitment.RejectType TO ApplicationManager ;
GRANT UPDATE, INSERT
ON  Recruitment.Statues TO ApplicationManager ;
GRANT UPDATE, INSERT
ON  Recruitment.Application TO ApplicationManager ;
GRANT UPDATE, INSERT
ON  Recruitment.OnCallList TO ApplicationManager ;
GRANT UPDATE, INSERT
ON  Recruitment.Onboarding TO ApplicationManager ;
GRANT UPDATE, INSERT
ON  Recruitment.RejectList TO ApplicationManager ;
GRANT UPDATE, INSERT
ON  Recruitment.BlackListed TO ApplicationManager ;
GRANT UPDATE, INSERT
ON  Recruitment.Employee TO ApplicationManager ;
GRANT UPDATE, INSERT
ON  Recruitment.ComplaintHandling TO ApplicationManager ;
GRANT UPDATE, INSERT
ON  Recruitment.Evaluation TO ApplicationManager ;
GRANT UPDATE, INSERT
ON  Recruitment.Review TO ApplicationManager ;
ALTER ROLE db_datareader ADD MEMBER  ApplicationManager
