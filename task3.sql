create database Student;

create table students (

ID int primary key ,
Name varchar(50) not null,
DateOfBirth date not null,
Adress varchar(255) not null 

);



create table family_Info(

ID int primary key ,
fatherName varchar(50) not null,
phoneFather varchar(50) not null
student_ID int unique ,
FOREIGN KEY (student_ID) REFERENCES Students (ID)


);




create table Courses (
 ID int primary key,
 Name varchar(50) not null ,
description text  ,
 schedual varchar(255) ,


);



 create table Classes (
    ID INT PRIMARY KEY ,
    code VARCHAR(255) NOT NULL,
    room_number INT NOT NULL,
    schedule varchar(50) NOT NULL
);



CREATE TABLE Assignments (
    ID INT PRIMARY KEY  NOT NULL,
    name VARCHAR(255) NOT NULL,
    description text NOT NULL,
    due_date DATETIME NOT NULL,
    states VARCHAR(255) NOT NULL,
    Course_ID INT NOT NULL,
    FOREIGN KEY (Course_ID) REFERENCES Courses(ID)
);

create table Attendance (
   ID INT PRIMARY KEY ,
    date DATETIME NOT NULL,
    type_of_absence VARCHAR(255) NOT NULL,
    reason VARCHAR(255) NOT NULL, 
	student_ID INT  NOT NULL,
    FOREIGN KEY (student_ID) REFERENCES Students(ID)
)

CREATE TABLE Enrollment (
    Student_id INT NOT NULL,
    Course_id INT NOT NULL,
   
    FOREIGN KEY (Student_id) REFERENCES StudentS(ID),
    FOREIGN KEY (Course_id) REFERENCES Courses(ID)
);

CREATE TABLE Student_Assigment (
    Student_id INT NOT NULL,
    Assignment_id INT NOT NULL,
    
    FOREIGN KEY (Student_id) REFERENCES Students(ID),
    FOREIGN KEY (Assignment_id) REFERENCES Assignments(ID)
);




--inseeeeeeeeeeert

insert into students(ID,Name,DateOfBirth,Adress)values
(1,'omar',2007-07-30,'jearsh'),
(1,'emad',1994-07-30,'jearsh'),
(1,'ibrahim',2002-07-30,'jearsh');


insert into family_Info (ID, fatherName,phoneFather,student_id)values
(1,'yousef','0777777777',1),
(1,'ali','0777777777',2),
(1,'ahmad','0777777777',3);

insert into Courses(ID,Name,description,schedual)values
(1,'math','This course covers algebra, geometry, and calculus.', 'Monday & Friday 1:00 PM'),
(2,'Computer Science', 'Basics of programming, data structures, and algorithms.', 'Monday & Friday 1:00 PM'),
(3,'English Literature', 'Analysis of classic and modern literary works.', 'Thursday 3:00 PM');


INSERT INTO Classes (ID, code, room_number, schedule) VALUES 
(1, 'MATH101', 101, '2025-02-15 08:00:00'),
(2, 'PHY102', 102, '2025-02-16 09:00:00'),
(3, 'CHEM103', 103, '2025-02-17 10:00:00'),
(4, 'BIO277', 227, '2025-02-18 11:00:00'),
(5, 'CS105', 105, '2025-02-19 12:00:00');



INSERT INTO Assignments (ID, name, description, due_date, states, Course_id) VALUES 
(1, 'Algebra Assignment', 'Solve 10 algebraic equations.', '2024-02-15 23:59:59', 'pending', 1),
(2, 'Physics Lab Report', 'Write a report on Newton’s laws of motion.', '2024-02-18 23:59:59', 'pending', 2),
(3, 'Programming Task', 'Create a basic CRUD application in Python.', '2024-02-20 23:59:59', 'pending', 3);


insert into Attendance (ID,date,type_of_absence,reason,student_ID)values
('2024-02-10 08:00:00', 'absence', 'Sick leave', 1),
('2024-02-11 09:30:00', 'late', 'Traffic jam', 2),
('2024-02-12 07:45:00', 'leaving', 'Family emergency', 3);

-- Insert into Enrollment M-M
INSERT INTO Enrollment (Student_id, Course_id) VALUES 
(1, 1), (2, 2), (3, 3), (4, 4), (5, 5);

-- Insert into M-M
INSERT INTO Student_Assigment (Student_id, Assignment_id) VALUES 
(1, 1), (2, 2), (3, 3), (4, 4), (5, 5);





--1- Select students in a specific birth date ?

SELECT * FROM Students WHERE DateOfBirth = 2007-07-30;




