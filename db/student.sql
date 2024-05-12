CREATE DATABASE `student` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
SELECT User, Host FROM mysql.user;
CREATE USER 'pma'@'localhost' IDENTIFIED BY 'root';
GRANT ALL PRIVILEGES ON *.* TO 'pma'@'localhost' WITH GRANT OPTION;
GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost' WITH GRANT OPTION;

FLUSH PRIVILEGES;




-- Creating a table for Departments
CREATE TABLE Departments (
    DepartmentID INT AUTO_INCREMENT,
    Name VARCHAR(255) NOT NULL,
    Building VARCHAR(255),
    Budget DECIMAL(10, 2),
    PRIMARY KEY (DepartmentID)
);

-- Creating a table for Courses
CREATE TABLE Courses (
    CourseID INT AUTO_INCREMENT,
    Title VARCHAR(255) NOT NULL,
    Credits INT,
    DepartmentID INT,
    PRIMARY KEY (CourseID),
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

-- Creating a table for Students
CREATE TABLE Students (
    StudentID INT AUTO_INCREMENT,
    FirstName VARCHAR(255) NOT NULL,
    LastName VARCHAR(255) NOT NULL,
    EnrollmentDate DATE,
    Email VARCHAR(255),
    CGPA DECIMAL(3, 2),
    Age INT,
    PRIMARY KEY (StudentID)
);

-- Creating a table for Enrollments
CREATE TABLE Enrollments (
    EnrollmentID INT AUTO_INCREMENT,
    StudentID INT,
    CourseID INT,
    Grade CHAR(1),
    PRIMARY KEY (EnrollmentID),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

-- Creating a table for Administrators
CREATE TABLE Administrators (
    AdminID INT AUTO_INCREMENT,
    FirstName VARCHAR(255) NOT NULL,
    LastName VARCHAR(255) NOT NULL,
    Email VARCHAR(255),
    PRIMARY KEY (AdminID)
);
-- Insert data into Departments
INSERT INTO Departments (Name, Building, Budget) VALUES
('Cybersecurity', '404', 120000.00),
('AI', '402', 100000.00),
('Data Science', '420', 75000.00);

-- Insert data into Courses
INSERT INTO Courses (Title, Credits, DepartmentID) VALUES
('Introduction to Programming', 3, 1),
('Calculus', 4, 2),
('Cloud computing', 3, 3);

-- Insert data into Students
INSERT INTO Students (FirstName, LastName, EnrollmentDate, Email, CGPA, Age) VALUES
('Mohamed', 'Nader', '2023-09-01', 'mohamed.nader1415@gmail.com', 3.75, 22),
('Yassin', 'Amr', '2023-09-01', 'Yassin.amr41@gmail.com', 3.96, 22),
('Mohamed', 'Kamel', '2023-09-01', 'mohamed.kamel124@outlook.com', 3.65, 22),
('Wagd', 'Hossam', '2023-09-01', 'wagd.hossam12@yahoo.com', 3.85, 21);


-- Insert data into Enrollments
INSERT INTO Enrollments (StudentID, CourseID, Grade) VALUES
(1, 1, 'A'),
(2, 2, 'B');

-- Insert data into Administrators
INSERT INTO Administrators (FirstName, LastName, Email) VALUES
('Dr.Yasser', 'Fouad', 'Yasser.fouadn@fcds.com'),
('Dr.Magda', 'Madbouly', 'Magda.madbouly@fcds.com');
SHOW TABLES;
SELECT * FROM Departments;
SELECT * FROM Courses;
SELECT * FROM Students;
SELECT * FROM Enrollments;
SELECT * FROM Administrators;

