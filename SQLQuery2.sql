USE HR;

SET IDENTITY_INSERT  Recruitment.Candidates ON
INSERT INTO Recruitment.Candidates(CandidateID,CandidateFName,CandidateLName) VALUES
(1,'Wang','Xiao'),
(2,'Wang','YuChen'),
(3,'He','XiangYu'),
(4,'Krishna','Jash'),
(5,'Robbin','Rosan'),
(6,'John','Cena'),
(7,'Tianlu','Jacoob'),
(8,'MengNan','Hong'),
(9,'XiaoXiao','Peng'),
(10,'MengYing','Wang')

SET IDENTITY_INSERT Recruitment.Candidates OFF

SET IDENTITY_INSERT  Recruitment.CandidatesInfo ON
INSERT INTO Recruitment.CandidatesInfo(CandidateInfoID,Email,Phone,ShortProfile,Citizenship,Education,LocationInfo,CandidateID) VALUES
(1,'xwang99@syr.edu','375-88689','C++ Expert & OS design','CHN','Master','NY',1),
(2,'yuchen@syr.edu','375-88690','Java Expert','CHN','Master','NY',2),
(3,'xiangyu@syr.edu','375-88691','C++ Expert','CHN','Master','NY',3),
(4,'Donglu@bufflo.edu','375-88692','AI& DeepLearning','CHN','Doctor','NY',4),
(5,'Krishna@huawei.edu','375-88693','C Expert','IND','HighSchool','MASS',5),
(6,'John@gmail.com','375-88694','C++ Expert','USA','UnderGraduate','NY',6),
(7,'tianlu@bentley.edu','375-89689','C++ Expert','USA','UnderGraduate','NY',7),
(8,'scarlletHong@bentley.edu','375-88989','C++ Expert','CHN','UnderGraduate','NY',8),
(9,'xiaoxiao@syr.edu','375-88289','C++ Expert','CHN','Master','CA',9),
(10,'mengying@syr.edu','375-81689','C++ Expert','CHN','Master','CA',10)
SET IDENTITY_INSERT Recruitment.CandidatesInfo OFF

SET IDENTITY_INSERT  Recruitment.CandidatesDocuments ON
INSERT INTO Recruitment.CandidatesDocuments(CandidateDocumentID,CV,ReferenceLetter,CoverLetter,CandidateID) VALUES
(1,'url//resume_abcdefghijklmn123456781','url//RefenceLetter_abcdefghijklmn123456780','url//coverletter_abcdefghijklmn123456780',1),
(2,'url//resume_abcdefghijklmn123456782','url//RefenceLetter_abcdefghijklmn123456781','url//coverletter_abcdefghijklmn123456781',2),
(3,'url//resume_abcdefghijklmn123456783','url//RefenceLetter_abcdefghijklmn123456782','url//coverletter_abcdefghijklmn123456782',3),
(4,'url//resume_abcdefghijklmn123456784','url//RefenceLetter_abcdefghijklmn123456783','url//coverletter_abcdefghijklmn123456783',4),
(5,'url//resume_abcdefghijklmn123456785','url//RefenceLetter_abcdefghijklmn123456784','url//coverletter_abcdefghijklmn123456784',5),
(6,'url//resume_abcdefghijklmn123456786','url//RefenceLetter_abcdefghijklmn123456785','url//coverletter_abcdefghijklmn123456785',6),
(7,'url//resume_abcdefghijklmn123456787','url//RefenceLetter_abcdefghijklmn123456786','url//coverletter_abcdefghijklmn123456786',7),
(8,'url//resume_abcdefghijklmn123456788','url//RefenceLetter_abcdefghijklmn123456787','url//coverletter_abcdefghijklmn123456787',8),
(9,'url//resume_abcdefghijklmn123456789','url//RefenceLetter_abcdefghijklmn123456788','url//coverletter_abcdefghijklmn123456788',9),
(10,'url//resume_abcdefghijklmn123456780','url//RefenceLetter_abcdefghijklmn12345679','url//coverletter_abcdefghijklmn123456789',10)
SET IDENTITY_INSERT Recruitment.CandidatesDocuments OFF

SET IDENTITY_INSERT  Recruitment.JobTypes ON
INSERT INTO Recruitment.JobTypes(JobTypeID,JobType,JobTypeDescription) VALUES
(1,'Summer Internship','Candidate works for 2- 3 months as intern'),
(2,'Full Time ','Candidate must work at least 9 hours per day'),
(3,'Part Time','Candidate must work at most 3 hours per day'),
(4,'Contract','Candidate sign with the company and get paid based on workload')
SET IDENTITY_INSERT Recruitment.JobTypes OFF

SET IDENTITY_INSERT  Recruitment.JobCategories ON
INSERT INTO Recruitment.JobCategories(JobCategoryID,JobCategory,JobCategoryDescription) VALUES
(1,'IT','installing, maintaining and repairing hardware & software components of the organization computers'),
(2,'Software Design ','Transfer customer requirements into services'),
(3,'Software Test','responsible for the quality of software development and deployment')
SET IDENTITY_INSERT Recruitment.JobCategories OFF

SET IDENTITY_INSERT  Recruitment.JobMediums  ON
INSERT INTO Recruitment.JobMediums (JobMediumID,JobMedium,JobMediumDescription) VALUES
(1,'Online','Work at home'),
(2,'Onsite','Work at office')
SET IDENTITY_INSERT Recruitment.JobMediums OFF

SET IDENTITY_INSERT  Recruitment.JobPositions ON
INSERT INTO Recruitment.JobPositions (JobPositionID,JobPosition,JobMediumDescription) VALUES
(1,'Manager','10 years+ working experience'),
(2,'Senior','3 years+ working experience'),
(3,'Entry-level ','0-3 years working experience')
SET IDENTITY_INSERT Recruitment.JobPositions OFF

SET IDENTITY_INSERT  Recruitment.JobOpeningPlatforms ON
INSERT INTO Recruitment.JobOpeningPlatforms (JobOpeningPlatformID,PlatformName) VALUES
(1,'Company Webpage'),
(2,'LinkedIn'),
(3,'HandShake')
SET IDENTITY_INSERT Recruitment.JobOpeningPlatforms OFF

SET IDENTITY_INSERT  Recruitment.Jobs ON
INSERT INTO Recruitment.Jobs (JobCode,JobName,JobDescription,JobTypeID,JobCategoryID,JobMediumID,JobPositionID) VALUES
(1,'FullStack designer','Use c++ maintain the OS system and design websit',2,2,2,2),
(2,'Backend designer','Use x-86 architecture improve performance of the software',2,2,2,2),
(3,'Softer-ware test','Test softerware and design test cases',4,3,1,3),
(4,'IT Guys','Do some trivial works',1,1,2,3)
SET IDENTITY_INSERT Recruitment.Jobs OFF

SET IDENTITY_INSERT  Recruitment.OpeningJobs ON
INSERT INTO Recruitment.OpeningJobs (OpeningJobsID,StartDate,NumPosition,JobCode,JobJobOpeningPlatformID) VALUES
(1,'2023-1-1',2,1,1),
(2,'2023-1-1',2,2,1),
(3,'2023-1-1',1,3,2),
(4,'2023-1-1',1,4,3)

SET IDENTITY_INSERT Recruitment.OpeningJobs OFF

SET IDENTITY_INSERT  Recruitment.Interviewers ON
INSERT INTO Recruitment.Interviewers (InterviewerID,InviewerFname,InviewerLname,Titles) VALUES
(1,'Wang','Pipi','Chief Technology Officer'),
(2,'Ehat ','Ercanli','Technical Consulting'),
(3,'Lee','Robin','Chief Engineer')

SET IDENTITY_INSERT Recruitment.Interviewers  OFF

SET IDENTITY_INSERT  Recruitment.TestTypes ON
INSERT INTO Recruitment.TestTypes (TestTypeID ,TestType) VALUES
(1,'Onsite'),
(2,'Online')
SET IDENTITY_INSERT Recruitment.TestTypes  OFF

SET IDENTITY_INSERT  Recruitment.Tests ON
INSERT INTO Recruitment.Tests (TestID ,TestStartTime,TestEendTime,TestTittle,TestTypeID) VALUES
(1,'2022-11-15 09:00:00','2022-11-15 11:00:00','Programming1',1),
(2,'2022-11-15 14:00:00','2022-11-15 16:00:00','SystemDesign1',1),
(3,'2022-12-15 09:00:00','2022-12-15 11:00:00','Programming2',1),
(4,'2022-12-15 14:00:00','2022-12-15 16:00:00','SystemDesign2',1)
SET IDENTITY_INSERT Recruitment.Tests  OFF

SET IDENTITY_INSERT  Recruitment.InterviewTypes  ON
INSERT INTO Recruitment.InterviewTypes  (InterviewTypeID ,InterviewType) VALUES
(1,'Onsite'),
(2,'Online')
SET IDENTITY_INSERT  Recruitment.InterviewTypes   OFF

SET IDENTITY_INSERT  Recruitment.Interviews  ON
INSERT INTO Recruitment.Interviews  (InterviewID ,InterviewStartTime,InterviewEndTime,InterviewLocation,InterviewTypeID,TestID,InterviewerID) VALUES
(1,'2022-11-15','2022-11-16','NY',1,1,1),
(2,'2022-11-15','2022-11-16','NY',1,1,2),
(3,'2022-11-15','2022-11-16','NY',1,1,3),
(4,'2022-11-15','2022-11-16','NY',1,2,1),
(5,'2022-11-15','2022-11-16','NY',1,2,2),
(6,'2022-11-15','2022-11-16','NY',1,2,3),
(7,'2022-12-15','2022-12-16','NY',1,3,1),
(8,'2022-12-15','2022-12-16','NY',1,3,2),
(9,'2022-12-15','2022-12-16','NY',1,3,3),
(10,'2022-12-15','2022-12-16','NY',1,4,1),
(11,'2022-12-15','2022-12-16','NY',1,4,2),
(12,'2022-12-15','2022-12-16','NY',1,4,3)
SET IDENTITY_INSERT  Recruitment.Interviews   OFF

SET IDENTITY_INSERT  Recruitment.Reimbursement ON
INSERT INTO Recruitment.Reimbursement (ReimbursementID,SpendTotal) VALUES
(1,0),
(2,0),
(3,0),
(4,0),
(5,0),
(6,0),
(7,0),
(8,0),
(9,700),
(10,9348)

SET IDENTITY_INSERT Recruitment.Reimbursement  OFF



SET IDENTITY_INSERT  Recruitment.AirlineReservations ON
INSERT INTO Recruitment.AirlineReservations (AirlineReservationID,AirlineName,AirlineTrackNumber,AirLineCost,ReimbursementID) VALUES
(1,'JetBlue','TN359462YH',300,9),
(2,'Delta','TN359432YH',330,10),
(3,'UltraLuxury','TN358888YH',1888,10)
SET IDENTITY_INSERT Recruitment.AirlineReservations  OFF

SET IDENTITY_INSERT  Recruitment.HotelReservations ON
INSERT INTO Recruitment.HotelReservations (HotelReservationID,HotelName,HotelTrackNumber,HotelCost,ReimbursementID) VALUES
(1,'Hilton','HT359462YH',300,9),
(2,'Hilton','HT359432YH',310,10),
(3,'The Ranch at Rock Creek','HT358888YH',4700,10)
SET IDENTITY_INSERT Recruitment.HotelReservations  OFF

SET IDENTITY_INSERT  Recruitment.CarRentals ON
INSERT INTO Recruitment.CarRentals  (CarRentalID,CarRentalName,CarRentalTrackNumber,CarRentCost,ReimbursementID) VALUES
(1,'Toyota','CAR359462YH',100,9),
(2,'Toyota','CAR359432YH',120,10),
(3,'Benltley','CAR358888YH',2000,10)
SET IDENTITY_INSERT Recruitment.CarRentals  OFF

SET IDENTITY_INSERT  Recruitment.OnCallType ON
INSERT INTO Recruitment.OnCallType  (OncallTypeID,OncallReason) VALUES
(1,'Select but no more job openings '),
(2,'Onboarding  is unsuccessful'),
(3,'Onboarding  is unsuccessful')
SET IDENTITY_INSERT Recruitment.OnCallType  OFF

SET IDENTITY_INSERT  Recruitment.RejectType ON
INSERT INTO Recruitment.RejectType  (RejectTypeID,RejectType) VALUES
(1,'SApplication scanning is not met '),
(2,'Fail in the interview')
SET IDENTITY_INSERT Recruitment.RejectType  OFF

SET IDENTITY_INSERT  Recruitment.Statues ON
INSERT INTO Recruitment.Statues  (StatueID,StatueName) VALUES
(1,'Submitted'),
(2,'Reject'),
(3,'Select'),
(4,'Waiting'),
(5,'Re-interview'),
(6,'OnCall'),
(7,'Negotiating'),
(8,'Accept'),
(9,'Onboarding'),
(10,'BlackListed'),
(11,'Employee'),
(12,'NextRound')
SET IDENTITY_INSERT Recruitment.Statues  OFF


SET IDENTITY_INSERT  Recruitment.Application ON
INSERT INTO Recruitment.Application  (ApplicationID,OpeningJobsID,StatueID,CandidateID,ReimbursementID) VALUES
(1,1,11,1,1),
(2,1,11,2,2),
(3,1,6,3,3),
(4,2,2,4,4),
(5,2,2,5,5),
(6,2,2,6,6),
(7,2,6,7,7),
(8,2,6,8,8),
(9,2,11,9,9),
(10,2,10,10,10)

SET IDENTITY_INSERT Recruitment.Application  OFF

SET IDENTITY_INSERT  Recruitment.BlackListed ON
INSERT INTO Recruitment.BlackListed  (BlackListedID,ApplicationID) VALUES
(1,1)
SET IDENTITY_INSERT Recruitment.BlackListed  OFF

SET IDENTITY_INSERT  Recruitment.OnCallList ON
INSERT INTO Recruitment.OnCallList  (OncallCode,OncallTypeID,ApplicationID) VALUES
(1,1,3),
(2,2,7),
(3,3,8)
SET IDENTITY_INSERT Recruitment.OnCallList  OFF

SET IDENTITY_INSERT  Recruitment.Onboarding ON
INSERT INTO Recruitment.Onboarding  (OnboardingID,ApplicationID,EducationCheck,Legitimacy) VALUES
(1,1,'PASS','PASS'),
(2,2,'PASS','PASS'),
(3,9,'PASS','PASS')
SET IDENTITY_INSERT Recruitment.Onboarding  OFF


SET IDENTITY_INSERT  Recruitment.RejectList ON
INSERT INTO Recruitment.RejectList  (RejectCode,ApplicationID,RejectTypeID) VALUES
(1,4,2),
(2,5,1),
(3,6,2)
SET IDENTITY_INSERT Recruitment.RejectList  OFF

SET IDENTITY_INSERT  Recruitment.Employee ON
INSERT INTO Recruitment.Employee  (EmployeeID,ApplicationID) VALUES
(1,1),
(2,2),
(3,9)
SET IDENTITY_INSERT Recruitment.Employee  OFF


SET IDENTITY_INSERT  Recruitment.ComplaintHandling ON
INSERT INTO Recruitment.ComplaintHandling  (ComplaintID,ApplicationID,ComplainDesc) VALUES
(1,6,'This test is so hard that I think the company is making things difficult.')
SET IDENTITY_INSERT Recruitment.ComplaintHandling  OFF

SET IDENTITY_INSERT  Recruitment.Evaluation ON
INSERT INTO Recruitment.Evaluation  (EvaluationID,InterviewID,ApplicationID,GRADE) VALUES
(1,1,1,100),
(2,2,1,100),
(3,3,1,100),
(4,4,1,100),
(5,5,1,100),
(6,6,1,100),
(7,1,2,70),
(8,2,2,70),
(9,3,2,80),
(10,4,2,70),
(11,5,2,70),
(12,6,2,80),
(13,7,2,100),
(14,8,2,100),
(15,9,2,100),
(16,10,2,100),
(17,11,2,100),
(18,12,2,100),
(19,1,3,100),
(20,2,3,100),
(21,3,3,100),
(22,4,3,100),
(23,5,3,100),
(24,6,3,100),
(25,1,4,30),
(26,2,4,25),
(27,3,4,40),
(28,4,4,0),
(29,5,4,0),
(30,6,4,0),
(31,1,6,45),
(32,2,6,55),
(33,3,6,60),
(34,4,6,45),
(35,5,6,30),
(36,6,6,27),
(37,1,7,100),
(38,2,7,98),
(39,3,7,100),
(40,4,7,100),
(41,5,7,98),
(42,6,7,100),
(43,1,8,80),
(44,2,8,98),
(45,3,8,90),
(46,4,8,100),
(47,5,8,100),
(48,6,8,100),
(49,1,9,100),
(50,2,9,98),
(51,3,9,100),
(52,4,9,100),
(53,5,9,100),
(54,6,9,100),
(55,1,10,80),
(56,2,10,70),
(57,3,10,80),
(58,4,10,80),
(59,5,10,70),
(60,6,10,80),
(61,7,10,100),
(62,8,10,70),
(63,9,10,80),
(64,10,10,100),
(65,11,10,70),
(66,12,10,80)
SET IDENTITY_INSERT Recruitment.Evaluation  OFF

SET IDENTITY_INSERT  Recruitment.Review ON
INSERT INTO Recruitment.Review  (ReviewID,EvaluationID,CandReview,InterReview) VALUES
(1,55,'I could not believe that the examiner said my breasts stood beautiful and that if I could have a one-night stand with him, he could pass me straight away.','Strong applicant!'),
(2,61,'There is no one in your company to deal with this matter, and there has no handling mechanism. Just wait for my fireback!!!','Very Strong applicant!')
SET IDENTITY_INSERT Recruitment.Review  OFF