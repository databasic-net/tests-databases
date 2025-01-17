USE DatabasicDemoCompany;
GO


IF OBJECT_ID('FK_Person_Person') IS NOT NULL 				ALTER TABLE Persons 	DROP CONSTRAINT FK_Person_Person
IF OBJECT_ID('FK_Person_Department') IS NOT NULL 			ALTER TABLE Persons 	DROP CONSTRAINT FK_Person_Department
IF OBJECT_ID('FK_Contacts_ContactsCategories') IS NOT NULL 	ALTER TABLE Contacts 	DROP CONSTRAINT FK_Contacts_ContactsCategories
IF OBJECT_ID('FK_Contact_Person') IS NOT NULL 				ALTER TABLE Contacts 	DROP CONSTRAINT FK_Contact_Person
IF OBJECT_ID('FK_Attendance_Persons') IS NOT NULL 			ALTER TABLE Attendance 	DROP CONSTRAINT FK_Attendance_Persons
IF OBJECT_ID('Persons') IS NOT NULL							DROP TABLE Persons
IF OBJECT_ID('Departments') IS NOT NULL						DROP TABLE Departments
IF OBJECT_ID('ContactsCategories') IS NOT NULL				DROP TABLE ContactsCategories
IF OBJECT_ID('Contacts') IS NOT NULL						DROP TABLE Contacts
IF OBJECT_ID('Attendance') IS NOT NULL						DROP TABLE Attendance
IF OBJECT_ID('SecondsToTime') IS NOT NULL					DROP FUNCTION SecondsToTime
GO


CREATE TABLE Attendance (
	IdPerson INT NOT NULL,
	Date DATE NOT NULL,
	Time TIME(0) NOT NULL
)
CREATE TABLE Contacts (
	IdPerson INT NOT NULL,
	IdContactCategory INT NOT NULL,
	Value VARCHAR(100) NOT NULL
)
CREATE TABLE ContactsCategories (
	IdContactCategory INT IDENTITY(1,1) NOT NULL,
	Name VARCHAR(50) NOT NULL,
	CONSTRAINT PK_ContactsCategories PRIMARY KEY CLUSTERED (
		IdContactCategory ASC
	)
)
CREATE TABLE Departments (
	IdDepartment INT IDENTITY(1,1) NOT NULL,
	Name NVARCHAR(100) NOT NULL,
	Description [ntext] NULL,
	CONSTRAINT PK_Departments PRIMARY KEY CLUSTERED (
		IdDepartment ASC
	)
)
CREATE TABLE Persons (
	IdPerson INT IDENTITY(1,1) NOT NULL,
	IdParent INT NULL,
	IdDepartment INT NOT NULL,
	Name NVARCHAR(100) NOT NULL,
	Surname NVARCHAR(100) NULL,
	Salary DECIMAL(9, 2) NOT NULL DEFAULT 0,
	Gender CHAR(1) NOT NULL DEFAULT 'O',
	CONSTRAINT PK_Persons PRIMARY KEY CLUSTERED (
		IdPerson ASC
	)
)
GO


CREATE FUNCTION SecondsToTime (@totalSeconds INT)
RETURNS TIME(0) AS BEGIN
	DECLARE 
		@hoursInt INT,
		@hoursFloat FLOAT,
		@minutesInt INT,
		@minutesFloat FLOAT,
		@secondsInt INT;
		
	SET @hoursFloat = @totalSeconds / 3600.;
	SET @hoursInt = @hoursFloat;
	SET @minutesFloat = (@hoursFloat - @hoursInt) * 60;
	SET @minutesInt = (@hoursFloat - @hoursInt) * 60;
	SET @secondsInt = (@minutesFloat - @minutesInt) * 60;

	RETURN TIMEFROMPARTS(@hoursInt, @minutesInt, @secondsInt, 0, 0)
END
GO