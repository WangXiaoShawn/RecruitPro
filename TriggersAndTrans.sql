--------TT1
USE HR;
GO

DROP TRIGGER IF EXISTS Recruitment.BlackListInsert;
GO

CREATE TRIGGER BlackListInsert
	ON Recruitment.BlackListed
	AFTER INSERT--when insert into Recruitment.BlackListed trigger run
AS 
	DECLARE @ApID int; --save application ID
	SELECT @ApID=inserted.ApplicationID FROM inserted
	DECLARE @OpJobID int; ---Save OpenjobID need to update
	SELECT  @OpJobID=HR.Recruitment.Application.OpeningJobsID FROM  HR.Recruitment.Application
BEGIN TRY
	BEGIN TRAN --Tran make database consistent
	UPDATE HR.Recruitment.Application
	SET HR.Recruitment.Application.StatueID=10 --change the application statues to 10,which means blacklisted
	WHERE HR.Recruitment.Application.ApplicationID=@ApID 

	UPDATE HR.Recruitment.OpeningJobs
	SET  HR.Recruitment.OpeningJobs.NumPosition=HR.Recruitment.OpeningJobs.NumPosition+1 --change number of openjobs+1
	WHERE HR.Recruitment.OpeningJobs.OpeningJobsID=@OpJobID

	COMMIT TRAN
END TRY
BEGIN CATCH--if any one of the tran cannot work, rollback and throw the error message
	ROLLBACK TRAN
END CATCH
GO
-----------TT2
USE HR;
GO

DROP TRIGGER IF EXISTS Recruitment.Declined;
GO

CREATE TRIGGER Declined
	ON Recruitment.OnCallList
	AFTER INSERT--when insert into Recruitment.BlackListed trigger run
AS 
	DECLARE @ApID int; --save application ID
	SELECT @ApID=inserted.ApplicationID FROM inserted
	DECLARE @OpJobID int; ---Save OpenjobID need to update
	SELECT  @OpJobID=HR.Recruitment.Application.OpeningJobsID FROM  HR.Recruitment.Application
	DECLARE @DeclinedID int
	SET @DeclinedID=3
	
    IF @DeclinedID= (select inserted.OncallTypeID From inserted)
	BEGIN;
		BEGIN TRY
			BEGIN TRAN --Tran make database consistent
				UPDATE HR.Recruitment.Application
				SET HR.Recruitment.Application.StatueID=6 --change the application statues to 6,which means Oncall
				WHERE HR.Recruitment.Application.ApplicationID=@ApID 

				UPDATE HR.Recruitment.OpeningJobs
				SET  HR.Recruitment.OpeningJobs.NumPosition=HR.Recruitment.OpeningJobs.NumPosition+1 --change number of openjobs+1
				WHERE HR.Recruitment.OpeningJobs.OpeningJobsID=@OpJobID

			COMMIT TRAN
		END TRY
		BEGIN CATCH--if any one of the tran cannot work, rollback and throw the error message
			ROLLBACK TRAN
		END CATCH
	END;

GO
------TT3
USE HR;
GO

DROP TRIGGER IF EXISTS Recruitment.Oncalled;
GO

CREATE TRIGGER Oncalled
	ON Recruitment.OnCallList
	AFTER INSERT--when insert into Recruitment.Oncalled.trigger run
AS 
	DECLARE @ApID int; --save application ID
	SELECT @ApID=inserted.ApplicationID FROM inserted
	DECLARE @OpJobID int; ---Save OpenjobID need to update
	SELECT  @OpJobID=HR.Recruitment.Application.OpeningJobsID FROM  HR.Recruitment.Application
	DECLARE @DeclinedID int
	SET @DeclinedID=3
	
    IF @DeclinedID<> (select inserted.OncallTypeID From inserted)
	BEGIN;
		BEGIN TRY
			BEGIN TRAN --Tran make database consistent
				UPDATE HR.Recruitment.Application
				SET HR.Recruitment.Application.StatueID=6 --change the application statues to 6,which means Oncall
				WHERE HR.Recruitment.Application.ApplicationID=@ApID 

			COMMIT TRAN
		END TRY
		BEGIN CATCH--if any one of the tran cannot work, rollback and throw the error message
			ROLLBACK TRAN
		END CATCH
	END;

GO
-----TT4
USE HR;
GO

DROP TRIGGER IF EXISTS Recruitment.Oncalled;
GO

CREATE TRIGGER Oncalled
	ON Recruitment.OnCallList
	AFTER INSERT--when insert into Recruitment.Oncalled.trigger run
AS 
	DECLARE @ApID int; --save application ID
	SELECT @ApID=inserted.ApplicationID FROM inserted
	DECLARE @OpJobID int; ---Save OpenjobID need to update
	SELECT  @OpJobID=HR.Recruitment.Application.OpeningJobsID FROM  HR.Recruitment.Application
	DECLARE @DeclinedID int
	SET @DeclinedID=3
	
    IF @DeclinedID<> (select inserted.OncallTypeID From inserted)
	BEGIN;
		BEGIN TRY
			BEGIN TRAN --Tran make database consistent
				UPDATE HR.Recruitment.Application
				SET HR.Recruitment.Application.StatueID=6 --change the application statues to 6,which means Oncall
				WHERE HR.Recruitment.Application.ApplicationID=@ApID 

			COMMIT TRAN
		END TRY
		BEGIN CATCH--if any one of the tran cannot work, rollback and throw the error message
			ROLLBACK TRAN
		END CATCH
	END;

GO
------------------TT5
USE HR;
GO

DROP TRIGGER IF EXISTS Recruitment.OnboardingFail;
GO

CREATE TRIGGER OnboardingFail
	ON Recruitment.OnCallList
	AFTER INSERT--when insert into Recruitment.BlackListed trigger run
AS 
	DECLARE @ApID int; --save application ID
	SELECT @ApID=inserted.ApplicationID FROM inserted
	DECLARE @OpJobID int; ---Save OpenjobID need to update
	SELECT  @OpJobID=HR.Recruitment.Application.OpeningJobsID FROM  HR.Recruitment.Application
	DECLARE @DeclinedID int
	SET @DeclinedID=2---type=2
	
    IF @DeclinedID= (select inserted.OncallTypeID From inserted)
	BEGIN;
		BEGIN TRY
			BEGIN TRAN --Tran make database consistent
				UPDATE HR.Recruitment.Application
				SET HR.Recruitment.Application.StatueID=6 --change the application statues to 6,which means Oncall
				WHERE HR.Recruitment.Application.ApplicationID=@ApID 

				UPDATE HR.Recruitment.OpeningJobs
				SET  HR.Recruitment.OpeningJobs.NumPosition=HR.Recruitment.OpeningJobs.NumPosition+1 --change number of openjobs+1
				WHERE HR.Recruitment.OpeningJobs.OpeningJobsID=@OpJobID

			COMMIT TRAN
		END TRY
		BEGIN CATCH--if any one of the tran cannot work, rollback and throw the error message
			ROLLBACK TRAN
		END CATCH
	END;

GO
-------TT6
USE HR;
GO

DROP TRIGGER IF EXISTS Recruitment.RejectAdd;
GO

CREATE TRIGGER RejectAdd
	ON Recruitment.RejectList
	AFTER INSERT--when insert into Recruitment.Oncalled.trigger run
AS 
	DECLARE @ApID int; --save application ID
	SELECT @ApID=inserted.ApplicationID FROM inserted
	BEGIN;
		BEGIN TRY
			BEGIN TRAN --Tran make database consistent
				UPDATE HR.Recruitment.Application
				SET HR.Recruitment.Application.StatueID=2 --change the application statues to 2,which means reject
				WHERE HR.Recruitment.Application.ApplicationID=@ApID 

			COMMIT TRAN
		END TRY
		BEGIN CATCH--if any one of the tran cannot work, rollback and throw the error message
			ROLLBACK TRAN
		END CATCH
	END;

GO
-----TT7
USE HR;
GO

DROP TRIGGER IF EXISTS Recruitment.EmployeeAdd;
GO

CREATE TRIGGER EmployeeAdd
	ON Recruitment.Employee
	AFTER INSERT--when insert into Recruitment.Oncalled.trigger run
AS 
	DECLARE @ApID int; --save application ID
	SELECT @ApID=inserted.ApplicationID FROM inserted
	BEGIN;
		BEGIN TRY
			BEGIN TRAN --Tran make database consistent
				UPDATE HR.Recruitment.Application
				SET HR.Recruitment.Application.StatueID=11 --change the application statues to 11,which means employee
				WHERE HR.Recruitment.Application.ApplicationID=@ApID 

			COMMIT TRAN
		END TRY
		BEGIN CATCH--if any one of the tran cannot work, rollback and throw the error message
			ROLLBACK TRAN
		END CATCH
	END;

GO
---------TT8
USE HR;
GO

DROP TRIGGER IF EXISTS Recruitment.ComplainAdd;
GO

CREATE TRIGGER ComplainAdd
	ON Recruitment.ComplaintHandling
	AFTER INSERT--when insert into Recruitment.Oncalled.trigger run
AS 
	DECLARE @ApID int; --save application ID
	SELECT @ApID=inserted.ApplicationID FROM inserted
	BEGIN;
		BEGIN TRY
			BEGIN TRAN --Tran make database consistent
				UPDATE HR.Recruitment.Application
				SET HR.Recruitment.Application.StatueID=4 --change the application statues to 4,which means waiting
				WHERE HR.Recruitment.Application.ApplicationID=@ApID 

			COMMIT TRAN
		END TRY
		BEGIN CATCH--if any one of the tran cannot work, rollback and throw the error message
			ROLLBACK TRAN
		END CATCH
	END;

GO
