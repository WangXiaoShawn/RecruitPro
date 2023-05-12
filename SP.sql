--Stored procedures
--SP1
USE HR;
GO
IF OBJECT_ID('spReimbursementInformation') IS NOT NULL
DROP PROC spReimbursementInformation
GO

CREATE PROC spReimbursementInformation
AS
-- JOIN ALL TABLES CAN PROVIDE Reimbursement information (E/R)
-- ONLY SELECT THOSE APPLICANT WHO CAN Reimbursement their cost by the VIEW EligbleReimbursement
select*
from Recruitment.Reimbursement JOIN Recruitment.HotelReservations ON Recruitment.Reimbursement.ReimbursementID=Recruitment.HotelReservations.ReimbursementID
JOIN Recruitment.CarRentals ON  Recruitment.Reimbursement.ReimbursementID=Recruitment.CarRentals.ReimbursementID
JOIN Recruitment.AirlineReservations ON Recruitment.AirlineReservations.ReimbursementID=Recruitment.Reimbursement.ReimbursementID
WHERE Recruitment.Reimbursement.ReimbursementID IN
(
	select Recruitment.Application.ReimbursementID 
	from Recruitment.Application JOIN EligbleReimbursement ON Recruitment.Application.ApplicationID=EligbleReimbursement.ApplicationID
)
GO
--TEST1
EXEC spReimbursementInformation

--SP2
USE HR;
GO
IF OBJECT_ID('spReimbursementTest') IS NOT NULL
DROP PROC spReimbursementTest
GO

CREATE PROC spReimbursementTest
	@Range int =0
AS
	IF @Range <0 --- avoid possible logical mistake
		THROW 50001,'Range must be postive interger',1;
-- When the spReimbursement is eligibe and the difference between
-- real spend (get from database)and asked Reimbursement less then the rage
-- Accept else Reject
	Select Recruitment.Reimbursement.ReimbursementID,Decision=
CASE
WHEN SpendTotal-TotalSpend<=@Range THEN 'Accept'
ELSE 'Reject'
END
from Recruitment.Reimbursement JOIN
(
	select ReimbursementID,SUM(Cost) as TotalSpend
	from 
	(
		-- USE UNION function aggregate all information relate to Reimbursement
		SELECT Recruitment.AirlineReservations.ReimbursementID,
		Recruitment.AirlineReservations.AirlineName AS[NAME],  Recruitment.AirlineReservations.AirlineTrackNumber AS[TrackNumber],
		Recruitment.AirlineReservations.AirLineCost[Cost], Recruitment.AirlineReservations.AirlineReservationID AS[ServiceID]
		FROM Recruitment.AirlineReservations
		UNION ALL
		SELECT Recruitment.CarRentals.ReimbursementID,
		Recruitment.CarRentals.[CarRentalName] AS[NAME],  Recruitment.CarRentals.[CarRentalTrackNumber] AS[TrackNumber],
		Recruitment.CarRentals.[CarRentCost][Cost], Recruitment.CarRentals.CarRentalID AS[ServiceID]
		FROM Recruitment.CarRentals
		UNION ALL
		SELECT  Recruitment.HotelReservations.ReimbursementID,
		Recruitment.HotelReservations.[HotelName] AS[NAME],  Recruitment.HotelReservations.[HotelTrackNumber] AS[TrackNumber],
		Recruitment.HotelReservations.[HotelCost][Cost], Recruitment.HotelReservations.[HotelReservationID] AS[ServiceID]
		FROM Recruitment.HotelReservations
		) AS TEMP--save the result in the TEMP table
		WHERE TEMP.ReimbursementID IN--use the EligbleReimbursement view check the Reimbursement is Eligble or not
		(
		select Recruitment.Application.ReimbursementID 
		from Recruitment.Application JOIN EligbleReimbursement ON Recruitment.Application.ApplicationID=EligbleReimbursement.ApplicationID
		)
	group by ReimbursementID
) AS TEMP2 ON TEMP2.ReimbursementID=Recruitment.Reimbursement.ReimbursementID

GO
----test2

EXEC spReimbursementTest @Range =200
GO

--SP3
USE HR;
GO
IF OBJECT_ID('spOnCallOreder') IS NOT NULL
DROP PROC spOnCallOreder
GO

CREATE PROC spOnCallOreder
AS
SELECT Recruitment.OnCallList.ApplicationID,AVG(TestResult) AS [Performance] --USE Test performance as evidence of the order
FROM Recruitment.OnCallList JOIN HR.dbo.JobTestScore --USE view JobTestScore get peformance of onlist candidate
ON Recruitment.OnCallList.ApplicationID=HR.dbo.JobTestScore.ApplicationID
group by Recruitment.OnCallList.ApplicationID
GO

--test3
EXEC spOnCallOreder

--SP4
USE HR;
GO
IF OBJECT_ID('spOnCallOrederJob') IS NOT NULL
DROP PROC spOnCallOrederJob
GO

CREATE PROC spOnCallOrederJob
 @JobID int =0
AS
IF(@JobID=0)
	THROW 50002,'invalid jobID',1;
SELECT  Recruitment.OnCallList.ApplicationID,HR.dbo.JobTestScore.JobCode,AVG(TestResult) AS[Performance]
FROM Recruitment.OnCallList JOIN HR.dbo.JobTestScore --USE view JobTestScore get peformance of onlist candidate
ON Recruitment.OnCallList.ApplicationID=HR.dbo.JobTestScore.ApplicationID
WHERE HR.dbo.JobTestScore.JobCode=@JobID --use the input id 
group by Recruitment.OnCallList.ApplicationID,HR.dbo.JobTestScore.JobCode
GO

--test4
EXEC spOnCallOrederJob @JobID=2