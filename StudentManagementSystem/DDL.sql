/*
			SQL Project Name	: Student Management System
			Trainee Name		: Khairuzzaman   
			Trainee ID			: 1278830 
			Batch ID			: WADA/PNTL-A/56/01 

 --------------------------------------------------------------------------------

Table of Contents: DDL
			=> SECTION 01: CREATE a Database [SMS]
			=> SECTION 02: CREATE Appropriate Tables with column definition, Schema
			=> SECTION 03: ALTER, DROP AND MODIFY TABLES & COLUMNS
			=> SECTION 04: CREATE CLUSTERED AND NONCLUSTERED INDEX
			=> SECTION 05: CREATE SEQUENCE & ALTER SEQUENCE
			=> SECTION 06: CREATE A VIEW & ALTER VIEW
			=> SECTION 07: CREATE STORED PROCEDURE & ALTER STORED PROCEDURE
			=> SECTION 08: CREATE FUNCTION(SCALAR, SIMPLE TABLE VALUED, MULTISTATEMENT TABLE VALUED) & ALTER FUNCTION
			=> SECTION 09: CREATE TRIGGER (FOR/AFTER TRIGGER and INSTEAD OF TRIGGER)
*/







/*
---************	=> Section 01 => Created a Database [SMS]
*/


CREATE DATABASE SQL_PROJECT
ON
(
	NAME = 'SQL_PROJECT_DataFile',
	FILENAME = 'D:\SQL_PROJECT.mdf',
	SIZE = 2MB,
	MAXSIZE = 50MB,
	FILEGROWTH = 5%
)
LOG ON 
(
	NAME = 'SQL_PROJECT_LogFile',
	FILENAME = 'D:\SQL_PROJECT.ldf',
	SIZE = 2MB,
	MAXSIZE = 50MB,
	FILEGROWTH = 5%
)
GO

USE SQL_PROJECT
GO



/*
---************ => Section 02 => Created Appropriate Tables with column definition, Schema
*/



-- Department Information Table
CREATE TABLE Department_Information (
	SL INT IDENTITY,
	DepartmentID VARCHAR(10),
	DepartmentName VARCHAR(50),
	PRIMARY KEY (DepartmentID)
);
GO

-- Subject Information Table
CREATE TABLE Subject_Information (
	SL INT IDENTITY,
	SubjectCode VARCHAR(20) PRIMARY KEY NOT NULL,
	SubjectName VARCHAR(50) NOT NULL,
	InstructorID INT NOT NULL,
	DepartmentID VARCHAR(10) NULL,
	SemesterCode VARCHAR(20) NOT NULL
);
GO

-- Semester Information Table
CREATE TABLE Semester_Information (
	SL INT IDENTITY,
	SemesterCode VARCHAR(20) PRIMARY KEY NOT NULL,
	SemesterName VARCHAR(20) NOT NULL,
	SubjectCode VARCHAR(20) NOT NULL
);
GO

-- Course Information Table
CREATE TABLE Course_Information (
	SL INT IDENTITY,
	CourseID VARCHAR(10) PRIMARY KEY NOT NULL,
	CourseName VARCHAR(50) NOT NULL,
	Duration VARCHAR(20) NULL,
	InstructorID INT NULL
);
GO


-- Students Information Table
CREATE TABLE Students_Information (
	SL INT IDENTITY,
	StudentID INT PRIMARY KEY,
	StudentName VARCHAR(50) NOT NULL,
	FathersName VARCHAR(50) NOT NULL,
	MothersName VARCHAR(50) NOT NULL,
	Gender VARCHAR(10) NOT NULL,
	Date_of_Birth DATE NOT NULL,
	Email VARCHAR(50) UNIQUE CONSTRAINT Email_Check CHECK (Email LIKE '%@%') NOT NULL,
	ContactNumber VARCHAR(250) UNIQUE NOT NULL,
	[Address] VARCHAR(150) NOT NULL,
	CurrentSemester VARCHAR(10) NOT NULL,
	DepartmentID VARCHAR(10),
	CourseID VARCHAR(10) REFERENCES Course_Information(CourseID)
);
GO

-- Instructors Information Table
CREATE TABLE Instructors_Information (
	SL INT IDENTITY,
	InstructorID INT PRIMARY KEY NOT NULL,
	InstructorName VARCHAR(50) NOT NULL,
	Gender VARCHAR(10) NOT NULL,
	Email VARCHAR(50) UNIQUE CHECK (Email LIKE '%@%') NOT NULL,
	ContactNumber VARCHAR(20) UNIQUE NOT NULL,
	[Address] VARCHAR(150) NOT NULL,
	SubjectCode VARCHAR(20) NULL,
	DepartmentID VARCHAR(10) NOT NULL,
	SemesterCode VARCHAR(20) REFERENCES Semester_Information(SemesterCode) NOT NULL,
	CourseID VARCHAR(10) REFERENCES Course_Information(CourseID) NULL
);
GO

-- Results Table
CREATE TABLE Results (
	SL INT IDENTITY,
	StudentID INT NOT NULL, 
	SemesterCode VARCHAR(20) REFERENCES Semester_Information(SemesterCode) NOT NULL,
	SubjectCode VARCHAR(20) REFERENCES Subject_Information(SubjectCode) NOT NULL,
	Result DECIMAL(5, 2) NULL
);
GO

-- Attendance Information Table
CREATE TABLE Attendance_Information (
	SL INT IDENTITY,
	StudentID INT,
	[Date] DATE,
	Attendance VARCHAR(10),
	Comment VARCHAR(50),
	PRIMARY KEY (StudentID,[Date])
);
GO


-- Creating SCHEMA

--Creating Scema
CREATE SCHEMA scem
GO
	
CREATE TABLE scem.Attendance_Information
(
	SL INT IDENTITY,
	StudentID INT PRIMARY KEY,
	[Date] DATE,
	Comment VARCHAR(50),
)
GO



/*
---************ => Section 03 => ALTER, DROP AND MODIFY TABLES & COLUMNS
*/


--Update Colum

ALTER TABLE Attendance_Information
ALTER COLUMN Attendance CHAR(1) NOT NULL
GO

ALTER TABLE Students_Information
ALTER COLUMN StudentID INT
GO

--Update CHECK CONSTRAINT
ALTER TABLE Attendance_Information
ADD CONSTRAINT CK_Attandance CHECK(Attendance LIKE '[A,P]')
GO

--DROP COLUM
ALTER TABLE Attendance_Information
DROP COLUMN Comment
GO

--DROP TABLE
IF OBJECT_ID('Attendance_Information') IS NOT NULL
DROP TABLE Attendance_Information
GO

--DROP SCHEMA
DROP SCHEMA scem
GO



---************ => SECTION 04 => CREATE CLUSTERED AND NONCLUSTERED INDEX


CREATE INDEX Instructors_Information_Index
ON Instructors_Information(InstructorID)
GO

CREATE NONCLUSTERED INDEX Results_Index
ON Results (SL)
GO


/*
---************ => Section 05 => CREATE SEQUENCE & ALTER SEQUENCE
*/

--===========CREATE SEQUENCE

CREATE SEQUENCE Student_ID
	AS INT
	START WITH 102023001
	INCREMENT BY 1
	MINVALUE 102023001
	MAXVALUE 102023999
GO

CREATE SEQUENCE Instructor_ID
	AS INT
	START WITH 202023001
	INCREMENT BY 1
	MINVALUE 202023001
	MAXVALUE 202023999
GO

--============== ALTER SEQUENCE ============--

ALTER SEQUENCE Student_ID
	RESTART WITH 102024001
	MINVALUE 102024001
	MAXVALUE 102024999
GO




---************ => Section 06 => CREATE A VIEW

CREATE VIEW tempViews
AS 
SELECT sub.SL,sub.SubjectCode,sub.SubjectName,i.InstructorName,d.DepartmentName,sem.SemesterName FROM Subject_Information sub
JOIN Instructors_Information i ON sub.InstructorID=i.InstructorID
JOIN Department_Information d ON sub.DepartmentID=d.DepartmentID
JOIN Semester_Information sem ON sub.SemesterCode = sem.SemesterCode
GO



	
---************ =>Section 07 => STORE PROCEDURE INSERT, UPDATE and DELETE
		--=> INSERT with STORE PROCEDURE
CREATE PROC insertSP @StudentID INT, @Attendance VARCHAR(10), @Comment VARCHAR(50)
AS
INSERT INTO Attendance_Information (StudentID,[Date],Attendance,Comment) VALUES
(@StudentID, @Attendance, @Comment)
GO

EXEC insertSP 202023005, 2023-07-15,'Present','On Time'
GO

			--=> UPDATE with STORE PROCEDURE
CREATE PROC Update_SP @SL INT,@StudentID INT, @Attendance VARCHAR(10), @Comment VARCHAR(50)
AS
UPDATE Attendance_Information SET
StudentID = @StudentID,Attendance = @Attendance,Comment = @Comment
WHERE SL = @SL
GO

EXEC Update_SP 1,202023005,'Absent','Sick'
GO

			--=> Delete with STORE PROCEDURE
CREATE PROC Delete_SP @SL INT
AS
DELETE FROM Attendance_Information
WHERE SL=@SL
GO

EXEC Delete_SP 2
GO



---************ => SECTION 08 => CREATE FUNCTION(SCALER VALUED FUNCTION & TABLE VALUED FUNCTION)
		--Scaler Functions

CREATE FUNCTION Result (@num1 INT, @num2 INT)
RETURNS FLOAT
AS
BEGIN
	DECLARE @sum INT
	SET @sum = @num1 + @num2
	RETURN @sum
END
GO
SELECT dbo.Result(5,6) 
GO

		--Table Valued Functions

CREATE FUNCTION ResultSearch (@StudentId INT)
RETURNS TABLE
AS
RETURN (SELECT StudentID,Result FROM Results WHERE StudentID=@StudentId)
GO
SELECT * FROM ResultSearch(102023001)
GO


---************ => Section 09 => CREATE TRIGGER (FOR/AFTER TRIGGER and INSTEAD OF TRIGGER)

	-- => FOR TRIGGER
CREATE TRIGGER UpdateDelete 
ON Results 
FOR UPDATE,DELETE 
AS 
BEGIN 
PRINT 'Update And Delete For This Table is Restricted'
ROLLBACK TRANSACTION
END 
GO
UPDATE Results SET Result=90.87
WHERE StudentID=102023002

DELETE FROM Results WHERE StudentID=102023003
GO


				
	-- => INSTEAD OF TRIGGER

CREATE TRIGGER InsteadOfTrigger
ON Attendance_Information
INSTEAD OF INSERT
AS 
BEGIN
    INSERT INTO Attendance_Information (StudentID,[Date],Attandance,Comment)
    SELECT *
    FROM inserted;
END
GO
INSERT INTO Attendance_Information
VALUES (102023007,'2023-06-21','Present','On time'
GO


