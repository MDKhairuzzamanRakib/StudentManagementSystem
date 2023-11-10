/*

			SQL Project Name	: Student Management System
			Trainee Name		: Khairuzzaman   
			Trainee ID			: 1278830 
			Batch ID			: WADA/PNTL-A/56/01 

 --------------------------------------------------------------------------------
Table of Contents: DML

			Section: 01 => Using INSERT INTO KEYWORD Insert data into Current TABLE.
			Section: 02 => Using SELECT FROM Keyword View TABLE and their Data
			Section: 03 => Using SELECT INTO Keyword Copy all TABLE Data into another TABLE
			Section: 04 => IMPLICIT INNER JOIN, OUTER JOIN and CROSS JOIN
			Section: 05 => IMPLICIT WHERE CLAUSE, Order BY, DISTINCT, TOP ,BETWEEN and Comparison Operator (AND, OR, NOT), 
			Section: 06 => LIKE,IN,IS NULL Operator
			Section: 07 => OFFSET, FETCH, AGGREGATE FUNCTIONS
			Section: 08 => ROLLUP, CUBE, GROUP BY, GROUPING SETS AND HAVING
			Section: 09 => Union
			Section: 10 => SubQuerie (subqueries,and co-related subqueries)
			Section: 11 => EXISTS CLAUSE 
			Section: 12 => CTE for CombinedData
			Section: 13 => MERGE
			Section: 14 => IIF,CASE,CHOOSE
			Section: 15 => COALESCE & ISNULL
			Section: 16 => GROPING FUNCTION
			Section: 17 => RANKING FUNCTION(RANK,DENSE RANK)
			Section: 18 => BUILD IN FUNCTIONS (GETDATE,CAST,CONVERT,TRY_CONVERT,DATEDIFF,DATENAME)
			Section: 19 => IF ELSE & PRINT
			Section: 20 => WHILE, TRY CATCH
			Section: 21 => WAITFOR
			Section: 22 => sp_helptext
*/



USE SQL_PROJECT



---************ Section: 01 => Using INSERT INTO KEYWORD Insert data into Current TABLE.
INSERT INTO Department_Information (DepartmentID, DepartmentName)
VALUES
    ('Dep001', 'Computer Science'),
    ('Dep002', 'Electrical Engineering'),
    ('Dep003', 'Mechanical Engineering'),
    ('Dep004', 'Civil Engineering'),
    ('Dep005', 'Business Administration'),
    ('Dep006', 'Psychology'),
    ('Dep007', 'Information Technology'),
    ('Dep008', 'Biology'),
    ('Dep009', 'Chemistry'),
    ('Dep010', 'English Literature');
GO


INSERT INTO Subject_Information (SubjectCode, SubjectName, InstructorID, DepartmentID, SemesterCode)
VALUES
    ('Sub001', 'Introduction to Programming', 202023005, 'Dep007', 'SEM001'),
    ('Sub002', 'Digital Electronics', 202023002, 'Dep002', 'SEM002'),
    ('Sub003', 'Introduction to Psychology', 202023001, 'Dep006', 'SEM003'),
    ('Sub004', 'Data Structures and Algorithms', 202023009, 'Dep005', 'SEM002'),
    ('Sub005', 'Signals and Systems', 202023004, 'Dep003', 'SEM001'),
    ('Sub006', 'Database Management', 202023010, 'Dep010', 'SEM003'),
    ('Sub007', 'Electromagnetic Theory', 202023003, 'Dep004', 'SEM001'),
    ('Sub008', 'Artificial Intelligence', 202023006, 'Dep008', 'SEM004'),
    ('Sub009', 'Introduction to Economics', 202023008, 'Dep009', 'SEM001'),
    ('Sub010', 'Web Development', 202023007, 'Dep001', 'SEM003');
GO

INSERT INTO Semester_Information (SemesterCode,SemesterName,SubjectCode)
VALUES
    ('SEM001','1st Semester' ,'Sub001'),
    ('SEM002','2nd Semester' ,'Sub003'),
    ('SEM003','3rd Semester' ,'Sub007'),
    ('SEM004','4th Semester' ,'Sub005'),
    ('SEM005','5th Semester' ,'Sub009'),
    ('SEM006','6th Semester' ,'Sub008'),
    ('SEM007','7th Semester' ,'Sub002'),
    ('SEM008','8th Semester' ,'Sub004'),
    ('SEM009','9th Semester' ,'Sub006'),
    ('SEM010','10th Semester', 'Sub010');
GO

INSERT INTO Course_Information (CourseID, CourseName, Duration, InstructorID)
VALUES
    ('C001', 'Bachelor of Computer Science', '4 years', 202023005),
    ('C002', 'Bachelor of Electrical Engineering', '4 years', 202023010),
    ('C003', 'Bachelor of Psychology', '3 years', 202023007),
    ('C004', 'Bachelor of Business Administration', '4 years', 202023001),
    ('C005', 'Bachelor of Mechanical Engineering', '4 years', 202023004),
    ('C006', 'Bachelor of Information Technology', '3 years', 202023003),
    ('C007', 'Bachelor of Biology', '3 years', 202023009),
    ('C008', 'Bachelor of Chemistry', '4 years', 202023006),
    ('C009', 'Bachelor of English Literature', '3 years', 202023002),
    ('C010', 'Bachelor of Mathematics', '4 years', 202023008);
GO

INSERT INTO Students_Information (StudentID, StudentName, FathersName, MothersName, Gender,Date_of_Birth, Email, ContactNumber, [Address], CurrentSemester,DepartmentID, CourseID)
VALUES
    (NEXT VALUE FOR Student_ID, 'John Doe', 'Mike Doe', 'Emily Doe', 'Male','2000-05-15', 'john.doe@example.com', '1234427890', '123 Main St., City', 'SEM001','D001', 'C008'),
    (NEXT VALUE FOR Student_ID, 'Jane Smith', 'David Smith', 'Mary Smith', 'Female','2001-02-28', 'jane.smith@example.com', '98765453210', '456 Elm St., Town', 'SEM008','D002', 'C004'),
    (NEXT VALUE FOR Student_ID, 'Michael Johnson', 'Robert Johnson', 'Linda Johnson', 'Male','1999-09-10', 'michael.johnson@example.com', '55512434567', '789 Oak St., Village', 'SEM003','D003', 'C003'),
    (NEXT VALUE FOR Student_ID, 'Emily Davis', 'Daniel Davis', 'Sarah Davis', 'Female','2002-07-12', 'emily.davis@example.com', '98765843219', '321 Maple St., County', 'SEM001','D001', 'C002'),
    (NEXT VALUE FOR Student_ID, 'William Brown', 'James Brown', 'Elizabeth Brown', 'Male','2000-11-30', 'william.brown@example.com', '90687654321', '654 Pine St., District', 'SEM001','D002', 'C008'),
    (NEXT VALUE FOR Student_ID, 'Olivia Wilson', 'Charles Wilson', 'Patricia Wilson', 'Female','2003-04-19', 'olivia.wilson@example.com', '23457678901', '987 Cedar St., State', 'SEM004','D003', 'C006'),
    (NEXT VALUE FOR Student_ID, 'Noah Lee', 'Michael Lee', 'Jennifer Lee', 'Male','2001-08-25', 'noah.lee@example.com', '87654382109', '765 Birch St., Country', 'SEM003','D001', 'C001'),
    (NEXT VALUE FOR Student_ID, 'Emma Johnson', 'John Johnson', 'Susan Johnson', 'Female','2000-06-05', 'emma.johnson@example.com', '67894012345', '543 Willow St., Kingdom', 'SEM001','D002', 'C003'),
    (NEXT VALUE FOR Student_ID, 'Liam Martinez', 'David Martinez', 'Maria Martinez', 'Male','2002-03-14', 'liam.martinez@example.com', '76549321098', '876 Oak St., Republic', 'SEM001','D003', 'C009'),
    (NEXT VALUE FOR Student_ID, 'Ava Anderson', 'William Anderson', 'Michelle Anderson', 'Female','2003-01-09', 'ava.anderson@example.com', '12345677890', '234 Elm St., Union', 'SEM004','D001', 'C010');
GO


INSERT INTO Instructors_Information (InstructorID, InstructorName, Gender, Email,ContactNumber, [Address], SubjectCode,DepartmentID, SemesterCode, CourseID)
VALUES
    (NEXT VALUE FOR Instructor_ID, 'John Smith', 'Male', 'john.smith@example.com','12374567890', '123 Main St., City', 'Sub003','Dep006', 'SEM003', 'C004'),
    (NEXT VALUE FOR Instructor_ID, 'Mary Johnson', 'Female', 'mary.johnson@example.com','98765443210', '456 Elm St., Town', 'Sub002','Dep002', 'SEM002', 'C009'),
    (NEXT VALUE FOR Instructor_ID, 'David Brown', 'Male', 'david.brown@example.com','55512345567', '789 Oak St., Village', 'Sub007','Dep004', 'SEM001', 'C006'),
    (NEXT VALUE FOR Instructor_ID, 'Emily Davis', 'Female', 'emily.davis@example.com','90876564321', '321 Maple St., County', 'Sub005','Dep003', 'SEM001', 'C005'),
    (NEXT VALUE FOR Instructor_ID, 'Michael Lee', 'Male', 'michael.lee@example.com','23456178901', '987 Cedar St., State', 'Sub001','Dep007', 'SEM001', 'C001'),
    (NEXT VALUE FOR Instructor_ID, 'Olivia Wilson', 'Female', 'olivia.wilson@example.com','82765432109', '765 Birch St., Country', 'Sub006','Dep001', 'SEM004', 'C010'),
    (NEXT VALUE FOR Instructor_ID, 'William Anderson', 'Male', 'william.anderson@example.com','67890152345', '543 Willow St., Kingdom', 'Sub007','Dep004', 'SEM003', 'C005'),
    (NEXT VALUE FOR Instructor_ID, 'Emma Martinez', 'Female', 'emma.martinez@example.com','76543821098', '876 Oak St., Republic', 'Sub008','Dep010', 'SEM002', 'C009'),
    (NEXT VALUE FOR Instructor_ID, 'Liam Johnson', 'Male', 'liam.johnson@example.com','12345697890', '234 Elm St., Union', 'Sub009','Dep007', 'SEM001', 'C004'),
    (NEXT VALUE FOR Instructor_ID, 'Ava Wilson', 'Female', 'ava.wilson@example.com','54321090876', '567 Pine St., District', 'Sub010','Dep002', 'SEM004', 'C007');
GO

INSERT INTO Results (StudentID, SemesterCode, SubjectCode, Result)
VALUES
    (102023001, 'SEM001', 'Sub001', 85.5),
    (102023002, 'SEM002', 'Sub002', 78.9),
    (102023003, 'SEM003', 'Sub003', 92.3),
    (102023004, 'SEM001', 'Sub001', 91.7),
    (102023005, 'SEM002', 'Sub002', 79.1),
    (102023006, 'SEM003', 'Sub003', 88.0),
    (102023007, 'SEM001', 'Sub001', 77.3),
    (102023008, 'SEM002', 'Sub002', 85.2),
    (102023009, 'SEM003', 'Sub003', 78.8),
    (1020230010, 'SEM003', 'Sub003', 79.3);
GO


INSERT INTO Attendance_Information
VALUES
    (102023003, '2023-07-01', 'Present', 'Regular attendance'),
    (102023002, '2023-07-01', 'Absent', 'Sick leave'),
    (102023005, '2023-07-01', 'Present', 'On time'),
    (102023006, '2023-07-01', 'Present', 'Active participation'),
    (102023002, '2023-07-02', 'Present', 'Attended full class'),
    (102023001, '2023-07-01', 'Absent', 'Family emergency'),
    (102023003, '2023-07-02', 'Present', 'Participated in class discussion'),
    (102023008, '2023-07-01', 'Present', 'Completed all assignments'),
    (102023005, '2023-07-02', 'Absent', 'Medical appointment'),
    (102023010, '2023-07-01', 'Present', 'Engaged in group activity');
GO



---************ Section: 02 => Using SELECT FROM Keyword View TABLE and their Data

SELECT * FROM Department_Information
GO

SELECT * FROM Subject_Information
GO

SELECT * FROM Semester_Information
GO

SELECT * FROM Course_Information
GO

SELECT * FROM Students_Information
GO

SELECT * FROM Instructors_Information
GO

SELECT * FROM Results
GO

SELECT * FROM Attendance_Information
GO



---************ Section: 03 => Using SELECT INTO Keyword Copy all TABLE Data into another TABLE

SELECT * INTO DepartmentCopy FROM Department_Information
GO


---************ Section: 04 => IMPLICIT INNER JOIN and OUTER JOIN, 

SELECT sub.SL,sub.SubjectCode,sub.SubjectName,i.InstructorName,d.DepartmentName,sem.SemesterName FROM Subject_Information sub
JOIN Instructors_Information i ON sub.InstructorID=i.InstructorID
JOIN Department_Information d ON sub.DepartmentID=d.DepartmentID
JOIN Semester_Information sem ON sub.SemesterCode = sem.SemesterCode
GO

SELECT s.SL,s.SemesterCode,s.SemesterName,sub.SubjectName FROM Semester_Information s
LEFT OUTER JOIN Subject_Information sub ON s.SubjectCode=sub.SubjectCode
GO


---************ Section: 05 => IMPLICIT WHERE CLAUSE, Order BY, DISTINCT, TOP ,BETWEEN and Comparison Operator (AND, OR, NOT), 
SELECT * FROM Attendance_Information
WHERE Attendance IN ('Absent')
GO

SELECT * FROM Instructors_Information
ORDER BY SubjectCode DESC

SELECT DISTINCT TOP 5 SubjectCode, StudentID, SemesterCode,Result FROM Results
GO

SELECT * FROM Students_Information
WHERE Date_of_Birth BETWEEN '2000-01-01' AND '2002-01-01'
GO

SELECT * FROM Students_Information
WHERE CurrentSemester='SEM003'  OR CourseID = 'C008'
GO

SELECT * FROM Students_Information
WHERE NOT CurrentSemester='SEM001'


---************ Section: 06 => LIKE,IN,IS NULL Operator

SELECT * FROM Students_Information
WHERE StudentName LIKE '%l%'

SELECT * FROM Students_Information
WHERE CurrentSemester IN ('SEM003')

SELECT * FROM Students_Information
WHERE CurrentSemester IS NULL
GO

---************ Section: 07 => OFFSET, FETCH, AGGREGATE FUNCTIONS

SELECT * FROM Students_Information
ORDER BY CourseID
OFFSET 3 ROWS
FETCH NEXT 5 ROWS ONLY
GO

SELECT SubjectCode,AVG(Result) FROM Results
GROUP BY (SubjectCode)
GO


---************ Section: 08 => ROLLUP, CUBE, GROUP BY, GROUPING SETS AND HAVING

SELECT COALESCE(SubjectCode, 'Grand Subject') AS Subject,AVG(Result) AS Result FROM Results
GROUP BY ROLLUP(SubjectCode)
GO

SELECT COALESCE(SubjectCode, 'Grand Subject') AS Subject,COALESCE(SemesterCode, 'Semester Total') AS Semester,AVG(Result) AS Result FROM Results
GROUP BY CUBE(SubjectCode,SemesterCode)
HAVING SemesterCode IN ('SEM001','SEM002')
GO

SELECT COALESCE(SubjectCode, 'Grand Subject') AS Subject,COALESCE(SemesterCode, 'Semester Total') AS Semester,AVG(Result) AS Result FROM Results
GROUP BY GROUPING SETS(SubjectCode,SemesterCode)
GO


---************ Section: 09 => Union
SELECT StudentID,SubjectCode,SemesterCode
FROM Results
UNION
SELECT StudentID, Attendance, Comment
FROM Attendance_Information


---************ Section: 10 => SubQuerie (subqueries,and co-related subqueries)
		--SubQueries
SELECT * FROM Results
WHERE Result>(SELECT AVG(Result) FROM Results)
GO
	
		--Co-Related SubQueries
SELECT r.StudentID,r.SubjectCode,r.Result FROM Results r
WHERE r.Result>(SELECT AVG(Result) FROM Results r2 WHERE r.StudentID=r2.StudentID)
GO


---************ Section: 10 => EXISTS CLAUSE 

SELECT StudentID, Result FROM Results
WHERE EXISTS (
  SELECT StudentID
  FROM Attendance_Information
  WHERE Attendance IN ('Present')
)
GO



---************ Section: 11 => CTE for CombinedData
WITH CombinedData AS (
    SELECT
        R.SL AS ResultSL,
        R.StudentID AS ResultStudentID,
        R.SemesterCode,
        R.SubjectCode,
        R.Result,
        AI.SL AS AttendanceSL,
        AI.StudentID AS AttendanceStudentID,
        AI.[Date],
        AI.Attendance,
        AI.Comment
    FROM Results R
   JOIN Attendance_Information AI ON R.StudentID = AI.StudentID
)
GO
SELECT * FROM CombinedData;
GO




---************ Section: 12 => MERGE




MERGE Attendance_Information AS target
USING Results AS source
ON (target.StudentID = source.StudentID)

WHEN MATCHED THEN
    UPDATE SET
        target.SemesterCode = source.SemesterCode,
        target.SubjectCode = source.SubjectCode,
        target.Result = source.Result

WHEN NOT MATCHED BY TARGET THEN
    INSERT (StudentID, [Date], Attendance, Comment, SemesterCode, SubjectCode, Result)
    VALUES (source.StudentID, NULL, NULL, NULL, source.SemesterCode, source.SubjectCode, source.Result);

GO


---************ Section: 13 => IIF,CASE,CHOOSE


--CASE  Example 

UPDATE Attendance_Information
SET Comment = CASE 
                WHEN Result >= 80 THEN 'Excellent'
                WHEN Result >= 60 THEN 'Good'
                WHEN Result >= 40 THEN 'Pass'
                ELSE 'Fail'
             END
FROM Attendance_Information AI
JOIN Results R ON AI.StudentID = R.StudentID;



---CHOOSE Example 

SELECT  StudentID,
CHOOSE(StudentID,'1st','2nd','3rd','4th','6th')
FROM Attendance_Information
GO


---IIF Example 

UPDATE Attendance_Information
SET Attendance = CHOOSE(CHARINDEX(SubjectCode, 'Math,Science,History'), 'Present', 'Present', 'Absent')
FROM Attendance_Information AI
JOIN Results R ON AI.StudentID = R.StudentID;



---************ Section: 14 => COALESCE & ISNULL

---COALESCE Example 

SELECT StudentID, COALESCE(Result, 0) AS ResultWithDefault
FROM Results;
GO

---ISNULL Example 

SELECT StudentID, ISNULL(Attendance, 'Unknown') AS AttendanceWithDefault
FROM Attendance_Information;



---************ Section: 15 => GROPING FUNCTION


SELECT StudentID, COUNT(*) AS AttendanceCount
FROM Attendance_Information
GROUP BY StudentID;
GO


---************ Section: 16 => RANKING FUNCTION(RANK,DENSE RANK)

--RANK 


SELECT StudentID, Result,
       RANK() OVER (ORDER BY Result DESC) AS ResultRank
FROM Results;



--DENSE RANK 

SELECT StudentID, COUNT(*) AS AttendanceCount,
       DENSE_RANK() OVER (ORDER BY COUNT(*) DESC) AS AttendanceRank
FROM Attendance_Information
GROUP BY StudentID
GO



---************ Section:18 => BUILD IN FUNCTIONS (GETDATE,CAST,CONVERT,TRY_CONVERT,DATEDIFF,DATENAME)

		--GETDATE
SELECT GETDATE()
GO

		--CAST
SELECT CAST(1500 AS decimal(17,2)) AS DecimalNumber
GO

		--CONVERT
DECLARE @time DATETIME = GETDATE()
SELECT CONVERT(VARCHAR, @time, 108) AS ConvertToTime
GO

		--TRY_CONVERT
SELECT TRY_CONVERT(DATE, '1-6-2022', 6) AS ConvertDate
GO

		-- DATEDIFF
SELECT DATEDIFF(DAY, '2021-01-01', '2022-01-01') AS DAYinYear
GO

		-- DATENAME
SELECT DATENAME(MONTH, GETDATE()) AS 'Month'
GO


---************ Section:17 => IF ELSE & PRINT


IF @Result >= 50
BEGIN
    PRINT 'Student with ID ' + CAST(@StudentID AS VARCHAR(10)) + ' has passed the exam!';
END
ELSE
BEGIN
    PRINT 'Student with ID ' + CAST(@StudentID AS VARCHAR(10)) + ' has failed the exam.';
END
GO


---************ Section: 18 => WHILE, TRY CATCH
		-- => WHILE
DECLARE @val INT
SET @val=10

WHILE @val>0
	BEGIN
		IF(@val=5)
		BREAK
		PRINT @val
		SET @val=@val-1
	END
GO
		-- => TRY CATCH
BEGIN TRY
	SELECT 1/0
END TRY
BEGIN CATCH
	BEGIN
		PRINT 'You Made Mistake'
		SELECT 
		ERROR_NUMBER() AS [Error Message],
		ERROR_LINE() AS ErrorLine
	END
END CATCH
GO


---************ Section: 18 => WAITFOR

WAITFOR TIME '00:00:05';


---************ Section: 19 => sp_helptext

EXEC sp_helptext student_Information 
GO 











