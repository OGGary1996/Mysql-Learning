CREATE DATABASE SaskPolyDB; -- create the database we need
USE SaskPolyDB; -- use this database
CREATE TABLE Students( -- create the Students table, define columns of this table and add constraints and data's type
	student_id INT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE,
    date_of_birth DATE,
    enrollment_date DATETIME,
    gpa DECIMAL(3,2) DEFAULT 0.00,
    major VARCHAR(100),
    PRIMARY KEY (student_id)
);
CREATE TABLE Courses( -- create the Courses table, define columns of this table and add constraints and data's type
	course_id INT ,
    course_name VARCHAR(100) NOT NULL,
    instructor VARCHAR(50) NOT NULL,
    credits NUMERIC DEFAULT 3,
    department VARCHAR(50),
    start_date DATE ,
    end_date DATE ,
    PRIMARY KEY (course_id)
);

INSERT INTO Students() -- insert records into Students table, some students just graduated and have no major information, 
VALUES					-- and some don't have GPA at this time 
	(1,'Babara','MacCaffrey','Babara123@gmail.com','1996-03-28','2021-08-30 08:05:12',3.21,NULL),
	(2,'Ines','Brushfield','Brushfield123@gmail.com','1994-06-12','2021-08-30 08:13:30',3.68,NULL),
	(3,'Tom','Freddi','Freddi.T@gmail.com','1995-03-01','2022-08-29 08:13:30',3.98,'Mathematics'),
	(4,'Ambur','Roseburgh','Roseburgh.amber@gmail.com','1994-06-05','2022-08-29 08:28:30',3.00,'Chemistry'),
	(5,'Clemmie','Betchley','Betchley123@gmail.com','1994-07-15','2022-08-29 14:18:30',3.66,'Physics'),
 	(6,'Elka','Twiddell','Elka786@gmail.com','1996-03-12','2022-08-29 14:32:48',3.87,'Biology'),  
 	(7,'Ilene','Dowson','Dowson.i@gmail.com','1995-10-21','2023-09-01 15:13:24',DEFAULT,'History'), 
	(8,'Thacher','Naseby','Naseby.T@gmail.com','1995-08-14','2023-09-01 15:35:54',DEFAULT,'History'), 
	(9,'Romola','Rumgay','Rumgay.R@gmail.com','1998-09-26','2024-08-29 09:48:23',DEFAULT,'Computer Science'), 
	(10,'Levy','Mynett','Mynett.L@gmail.com','1997-08-13','2024-08-29 09:48:23',DEFAULT,'Computer Science');
INSERT INTO Courses() -- insert records into Courses table, some course's date have not be decided yet
VALUES 				
	(1,'Discrete Mathematics','Theresa Binney',DEFAULT,'Mathematics','2024-09-02','2025-01-25'),
	(2,'Linear Algebra','Keriann Alloisi',1,'Mathematics','2024-09-02','2025-01-25'),
    (3,'Organic Chemistry','Elladine Rising',DEFAULT,'Chemistry','2024-09-02','2025-01-25'),
	(4,'Physical Chemistry','Kass Hefferan',1,'Chemistry','2024-09-02','2025-01-25'),
	(5,'Classical Mechanics','Virge Janowski',DEFAULT,'Physics','2024-09-02','2025-01-25'),
    (6,'Electromagnetism','Sayer Matterson',1,'Physics','2024-08-28','2024-10-15'),
	(7,'Molecular Biology','Darcy Nortunen',DEFAULT,'Biology','2024-08-30','2024-12-20'),
	(8,'Ecology','Sayer Matterson',1,'Biology','2024-08-30','2025-01-25'),
	(9,'World History','Mildrid Sokale',DEFAULT,'History',NULL,NULL),
	(10,'History of the Modern World','Ivy Fearey',1,'History',NULL,NULL),
	(11,'Discrete Mathematics','Cole Kesterton',DEFAULT,'Mathematics','2024-09-02','2025-01-25'),
	(12,'Linear Algebra','Estrellita Daleman',DEFAULT,'Mathematics','2024-09-02','2025-01-25');
    
INSERT INTO Courses() -- insert some extra records into Courses table
VALUES 				
	(13,'Discrete Mathematics','Hettinger LLC',DEFAULT,' Education','2024-09-02','2025-01-25'),
	(14,'Linear Algebra','Schinner Predovic',1,' Education','2024-09-02','2025-01-25'),
    (15,'Electrical','Waters Mayert',DEFAULT,'Engineering','2024-09-02','2025-01-25'),
	(16,'Civil','Mayert Prohaskaing',1,'Engineering','2024-09-02','2025-01-25');

SELECT  -- select the columns we need to show
	first_name AS 'First Name' , 
    last_name AS 'Last Name'
FROM Students -- the columns are from Students table
WHERE gpa > 3.50 -- add condition 
ORDER BY gpa DESC; -- order the outcomes by gpa in descending order

SELECT email -- select the columns we need to show
FROM Students -- the columns are from Students table
WHERE major = 'Computer Science'; -- add condition 
	
SELECT  -- select the columns we need to show
	S.first_name AS 'First Name' , 
    S.last_name AS 'Last Name',
    C.course_name AS 'Course'
FROM Students S 
INNER JOIN Courses C ON S.major = C.department; -- combine the outcomes from Students table and Courses table, based on major column = department column

SELECT  -- select the columns we need to show
	C.course_name AS 'Course',
    S.first_name AS 'First Name' , 
    S.last_name AS 'Last Name'
FROM Courses C 
LEFT JOIN Students S ON C.department = S.major; -- combine the outcomes from Students table and Courses table, based on major column = department column
												-- include some courses do not have enrolled students
                                                
SELECT  -- select the columns we need to show
	C.course_name AS 'Course',
    S.first_name AS 'First Name' , 
    S.last_name AS 'Last Name'
FROM Courses C 
RIGHT JOIN Students S ON C.department = S.major; -- combine the outcomes from Students table and Courses table, based on major column = department column
												-- include some students do not enrolled 