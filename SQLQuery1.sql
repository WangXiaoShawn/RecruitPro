USE master
GO

IF SCHEMA_ID('Recruitment') IS NOT NULL
DROP SCHEMA Recruitment
GO

IF DB_ID('HR') IS NOT NULL
DROP DATABASE HR
GO


CREATE DATABASE HR
GO

USE HR
GO

CREATE SCHEMA Recruitment
GO



CREATE TABLE  Recruitment.Candidates
(
	CandidateID int IDENTITY NOT NULL,
	CandidateFName  varchar(100) NOT NULL,
	CandidateLName varchar(100) NOT NULL,
	--constraint and performance
	CONSTRAINT PK_Candidates PRIMARY KEY CLUSTERED(CandidateID)
)

CREATE TABLE  Recruitment.CandidatesInfo
(
	CandidateInfoID int IDENTITY NOT NULL,
	Email varchar(100) NOT NULL,
	Phone varchar(100) NOT NULL,
	ShortProfile varchar (200) NULL,
	Citizenship varchar(100) NOT NULL,
	Education varchar(100) NOT NULL,
	LocationInfo varchar(100) NOT NULL,
	CandidateID int NOT NULL
	--constraint and performance
	CONSTRAINT PK_CandidatesInfo PRIMARY KEY CLUSTERED(CandidateInfoID)
	--FK Address potential integrity
	CONSTRAINT FK_CandidatesInfo_Candidates FOREIGN KEY(CandidateID) REFERENCES Recruitment.Candidates(CandidateID)
)

CREATE TABLE  Recruitment.CandidatesDocuments
(
	CandidateDocumentID int IDENTITY NOT NULL,
	CV varchar(2000) NOT NULL,
	ReferenceLetter varchar(2000)NULL,
	CoverLetter varchar (2000) NULL,
	CandidateID int NOT NULL
	--constraint and performance
	CONSTRAINT PK_CandidatesDocuments PRIMARY KEY CLUSTERED(CandidateDocumentID)
	--FK Address potential integrity
	CONSTRAINT FK_CandidatesDocuments_Candidates FOREIGN KEY(CandidateID) REFERENCES Recruitment.Candidates(CandidateID)
)


CREATE TABLE Recruitment.JobTypes (
   JobTypeID int IDENTITY NOT NULL,
   JobType nvarchar(50)  NOT NULL,
   JobTypeDescription nvarchar(200)  NOT NULL,
   CONSTRAINT JobTypes_pk PRIMARY KEY  (JobTypeID)
);

CREATE TABLE Recruitment.JobMediums  (
   JobMediumID int IDENTITY  NOT NULL,
   JobMedium nvarchar(50)  NOT NULL,
   JobMediumDescription varchar(100)  NOT NULL,
   CONSTRAINT JobMediums_pk PRIMARY KEY  (JobMediumID)
);

CREATE TABLE Recruitment.JobCategories (
   JobCategoryID int IDENTITY NOT NULL,
   JobCategory nvarchar(50)  NOT NULL,
   JobCategoryDescription nvarchar(200)  NOT NULL,
   CONSTRAINT JobCategories_pk PRIMARY KEY  (JobCategoryID)
);
CREATE TABLE Recruitment.JobPositions  (
   JobPositionID int IDENTITY NOT NULL,
   JobPosition nvarchar(50)  NOT NULL,
   JobMediumDescription nvarchar(100)  NOT NULL,
   CONSTRAINT JobPositions_pk PRIMARY KEY  (JobPositionID)
);
CREATE TABLE Recruitment.JobOpeningPlatforms (
   JobOpeningPlatformID int IDENTITY NOT NULL,
   PlatformName nvarchar(50)  NOT NULL,
   CONSTRAINT JobOpeningPlatforms_pk PRIMARY KEY  (JobOpeningPlatformID)
);

CREATE TABLE Recruitment.Jobs (
   JobCode int IDENTITY NOT NULL,
   JobName nvarchar(50)  NOT NULL,
   JobDescription nvarchar(200)  NOT NULL,
   JobTypeID int  NOT NULL,
   JobCategoryID int  NOT NULL,
   JobPositionID int  NOT NULL,
   JobMediumID int  NOT NULL,
   CONSTRAINT Jobs_pk PRIMARY KEY CLUSTERED (JobCode),--Increase performance
   CONSTRAINT FK_Jobs_JobTypes FOREIGN KEY(JobTypeID) REFERENCES Recruitment.JobTypes(JobTypeID),--interity constrains
   CONSTRAINT FK_Jobs_JobCategories FOREIGN KEY(JobCategoryID) REFERENCES Recruitment.JobCategories(JobCategoryID),
   CONSTRAINT FK_Jobs_JobPositions FOREIGN KEY(JobPositionID) REFERENCES Recruitment.JobPositions(JobPositionID),
   CONSTRAINT FK_Jobs_JobMediums FOREIGN KEY(JobMediumID) REFERENCES Recruitment.JobMediums(JobMediumID)
);

CREATE TABLE Recruitment.OpeningJobs (
   OpeningJobsID  int IDENTITY NOT NULL,
   StartDate  datetime  NOT NULL,
   NumPosition  int  NOT NULL CHECK(NumPosition>=0),--Avoid mistake
   JobCode int  NOT NULL,
   JobJobOpeningPlatformID int  NOT NULL,
   CONSTRAINT OpeningJobs_pk PRIMARY KEY CLUSTERED (OpeningJobsID ),
   CONSTRAINT OpeningJobs_Jobs FOREIGN KEY (JobCode) REFERENCES Recruitment.Jobs (JobCode),
   CONSTRAINT OpeningJobs_JobOpeningPlatforms FOREIGN KEY (JobJobOpeningPlatformID) REFERENCES Recruitment.JobOpeningPlatforms (JobOpeningPlatformID)
);


CREATE TABLE Recruitment.Interviewers (
   InterviewerID int  IDENTITY  NOT NULL,
   InviewerFname nvarchar(50)  NOT NULL,
   InviewerLname nvarchar(50)  NOT NULL,
   Titles  nvarchar(100)  NOT NULL,
   CONSTRAINT Interviewers_pk PRIMARY KEY CLUSTERED (InterviewerID)
);

CREATE TABLE Recruitment.TestTypes (
   TestTypeID int IDENTITY NOT NULL,
   TestType nvarchar(50)  NOT NULL,
   CONSTRAINT TestTypes_pk PRIMARY KEY  (TestTypeID)
);


CREATE TABLE Recruitment.Tests (
   TestID int  IDENTITY  NOT NULL,
   TestStartTime datetime  NOT NULL,
   TestEendTime datetime  NOT NULL,
   TestTittle nvarchar(50)  NOT NULL ,
   TestTypeID int  NOT NULL,
   CONSTRAINT Test_pk PRIMARY KEY  (TestID),
   CONSTRAINT Test_TestTypes FOREIGN KEY (TestTypeID) REFERENCES Recruitment.TestTypes (TestTypeID)
);

CREATE TABLE Recruitment.InterviewTypes (
   InterviewTypeID int IDENTITY    NOT NULL,
   InterviewType nvarchar(50)  NOT NULL,
   CONSTRAINT InterviewTypes_pk PRIMARY KEY  (InterviewTypeID)
);

CREATE TABLE Recruitment.Interviews (
   InterviewID int IDENTITY  NOT NULL,
   InterviewStartTime datetime  NOT NULL,
   InterviewEndTime datetime  NOT NULL,
   InterviewLocation nvarchar(50)  NOT NULL,
   InterviewTypeID int  NOT NULL,
   TestID int  NOT NULL,
   InterviewerID int  NOT NULL,
   CONSTRAINT Interviews_pk PRIMARY KEY CLUSTERED (InterviewID),
   CONSTRAINT Interviews_Test FOREIGN KEY (TestID) REFERENCES Recruitment.Tests (TestID),
   CONSTRAINT Interviews_InterviewTypes FOREIGN KEY (InterviewTypeID)REFERENCES Recruitment.InterviewTypes (InterviewTypeID),
   CONSTRAINT Interviews_Interviewers FOREIGN KEY (InterviewerID) REFERENCES Recruitment.Interviewers (InterviewerID)
);

CREATE TABLE Recruitment.Reimbursement (
   ReimbursementID int IDENTITY   NOT NULL,
   SpendTotal int  NOT NULL CHECK(SpendTotal >=0),
   CONSTRAINT Reimbursement_pk PRIMARY KEY  (ReimbursementID)
);

CREATE TABLE  Recruitment.AirlineReservations (
   AirlineReservationID int IDENTITY   NOT NULL,
   AirlineName nvarchar(50)  NOT NULL,
   AirlineTrackNumber nvarchar(50)  NOT NULL,
   AirLineCost int  NOT NULL CHECK(AirLineCost >=0),
   ReimbursementID int  NOT NULL,
   CONSTRAINT  AirlineReservations_pk PRIMARY KEY  (AirlineReservationID),
   CONSTRAINT  AirlineReservations_Reimbursement FOREIGN KEY (ReimbursementID) REFERENCES Recruitment.Reimbursement (ReimbursementID)
);
CREATE TABLE Recruitment.HotelReservations (
   HotelReservationID  int IDENTITY    NOT NULL,
   HotelName nvarchar(50)  NOT NULL,
   HotelTrackNumber nvarchar(50)  NOT NULL,
   HotelCost int  NOT NULL CHECK(HotelCost >=0),
   ReimbursementID int  NOT NULL,
   CONSTRAINT HotelReservations_pk PRIMARY KEY  (HotelReservationID ),
   CONSTRAINT HotelReservations_Reimbursement FOREIGN KEY (ReimbursementID) REFERENCES Recruitment.Reimbursement (ReimbursementID)
);

CREATE TABLE Recruitment.CarRentals (
   CarRentalID int IDENTITY    NOT NULL,
   CarRentalName nvarchar(50)  NOT NULL,
   CarRentalTrackNumber nvarchar(50)  NOT NULL,
   CarRentCost int  NOT NULL CHECK(CarRentCost >=0),
   ReimbursementID int  NOT NULL,
   CONSTRAINT CarRentals_pk PRIMARY KEY  (CarRentalID),
   CONSTRAINT CarRentals_Reimbursement FOREIGN KEY (ReimbursementID)REFERENCES Recruitment.Reimbursement (ReimbursementID)
);



CREATE TABLE Recruitment.OnCallType (
   OncallTypeID int IDENTITY  NOT NULL,
   OncallReason nvarchar(50)  NOT NULL,
   CONSTRAINT OnCallType_pk PRIMARY KEY  (OncallTypeID)
);

CREATE TABLE Recruitment.RejectType (
   RejectTypeID int IDENTITY  NOT NULL,
   RejectType nvarchar(50)  NOT NULL,
   CONSTRAINT RejectType_pk PRIMARY KEY  (RejectTypeID)
);

CREATE TABLE Recruitment.Statues (
   StatueID int IDENTITY NOT NULL,
   StatueName nvarchar(50)  NOT NULL,
   CONSTRAINT Statues_pk PRIMARY KEY  (StatueID)
);

CREATE TABLE Recruitment.Application (
   ApplicationID int IDENTITY NOT NULL,
   OpeningJobsID  int  NOT NULL,
   StatueID int  NOT NULL,
   CandidateID  int  NOT NULL,
   ReimbursementID int  NOT NULL,
   CONSTRAINT Application_pk PRIMARY KEY CLUSTERED (ApplicationID),
   CONSTRAINT Application_OpeningJobs FOREIGN KEY (OpeningJobsID ) REFERENCES Recruitment.OpeningJobs (OpeningJobsID ),
   CONSTRAINT Application_Statues FOREIGN KEY (StatueID) REFERENCES Recruitment.Statues (StatueID),
   CONSTRAINT Application_Candidates FOREIGN KEY (CandidateID )REFERENCES Recruitment.Candidates (CandidateID ),
   CONSTRAINT Application_Reimbursement FOREIGN KEY (ReimbursementID) REFERENCES Recruitment.Reimbursement (ReimbursementID)

);

CREATE TABLE Recruitment.OnCallList (
   OncallCode int IDENTITY  NOT NULL,
   OncallTypeID int  NOT NULL,
   ApplicationID int  NOT NULL,
   CONSTRAINT OnCallList_pk PRIMARY KEY  (OncallCode),
   CONSTRAINT OnCall_OnCallType FOREIGN KEY (OncallTypeID)REFERENCES Recruitment.OnCallType (OncallTypeID),
   CONSTRAINT OnCallList_Application FOREIGN KEY (ApplicationID) REFERENCES Recruitment.Application (ApplicationID)
);

CREATE TABLE Recruitment.Onboarding (
   OnboardingID int IDENTITY  NOT NULL,
   ApplicationID int  NOT NULL,
   EducationCheck nvarchar(50)  NOT NULL,
   Legitimacy nvarchar(50)  NOT NULL,
   CONSTRAINT Onboarding_pk PRIMARY KEY  (OnboardingID),
   CONSTRAINT Onboarding_Application FOREIGN KEY (ApplicationID) REFERENCES Recruitment.Application (ApplicationID)
);


CREATE TABLE Recruitment.RejectList (
   RejectCode int IDENTITY  NOT NULL,
   ApplicationID int  NOT NULL,
   RejectTypeID int  NOT NULL,
   CONSTRAINT RejectList_pk PRIMARY KEY  (RejectCode),
   CONSTRAINT RejectList_RejectType FOREIGN KEY (RejectTypeID) REFERENCES Recruitment.RejectType (RejectTypeID),
   CONSTRAINT RejectList_Application FOREIGN KEY (ApplicationID) REFERENCES Recruitment.Application (ApplicationID)
   )


CREATE TABLE Recruitment.BlackListed (
   BlackListedID int IDENTITY NOT NULL,
   ApplicationID int  NOT NULL,
   CONSTRAINT BlackListed_pk PRIMARY KEY  (BlackListedID),
   CONSTRAINT BlackListed_Application FOREIGN KEY (ApplicationID) REFERENCES Recruitment.Application (ApplicationID)
);


CREATE TABLE Recruitment.Employee (
   EmployeeID int IDENTITY NOT NULL,
   ApplicationID int  NOT NULL,
   CONSTRAINT Employee_pk PRIMARY KEY  (EmployeeID),
   CONSTRAINT Employee_Application FOREIGN KEY (ApplicationID) REFERENCES Recruitment.Application (ApplicationID)
);

CREATE TABLE Recruitment.ComplaintHandling (
   ComplaintID int IDENTITY NOT NULL,
   ApplicationID int  NOT NULL,
   ComplainDesc nvarchar(2000)  NOT NULL,
   CONSTRAINT ComplaintHandling_pk PRIMARY KEY  (ComplaintID),
   CONSTRAINT ComplaintHandling_Application FOREIGN KEY (ApplicationID) REFERENCES Recruitment.Application (ApplicationID)
);

CREATE TABLE Recruitment.Evaluation (
   EvaluationID int IDENTITY NOT NULL,
   InterviewID int  NOT NULL,
   ApplicationID int  NOT NULL,
   GRADE int  NOT NULL CHECK(GRADE>=0 and GRADE<=100) ,
   CONSTRAINT Evaluation_pk PRIMARY KEY CLUSTERED (EvaluationID),
   CONSTRAINT Evaluation_Application FOREIGN KEY (ApplicationID) REFERENCES Recruitment.Application (ApplicationID),
   CONSTRAINT Evaluation_Interviews FOREIGN KEY (InterviewID) REFERENCES Recruitment.Interviews (InterviewID)
);



CREATE TABLE Recruitment.Review (
   ReviewID int  IDENTITY NOT NULL,
   EvaluationID int  NOT NULL,
   CandReview nvarchar(2000)   NULL,
   InterReview nvarchar(2000)   NULL,
   CONSTRAINT Review_pk PRIMARY KEY  (ReviewID),
   CONSTRAINT Review_Evaluation FOREIGN KEY (EvaluationID) REFERENCES Recruitment.Evaluation (EvaluationID)
);