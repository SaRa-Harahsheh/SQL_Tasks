use School;

Create database School;


Create Schema SchoolSchema;
Go

Create Table SchoolSchema.Teachers
(
ID INT PRIMARY KEY,
firstName VARCHAR(50) NOT NULL,
lastName VARCHAR(50) NOT NULL,
Email VARCHAR(50) UNIQUE NOT NULL,
);

Create Table SchoolSchema.TeacherDetails
(
ID INT PRIMARY KEY,
phone varchar(50),
salary DECIMAL(10,2),
Address VARCHAR(50),
TeacherID int unique
FOREIGN KEY (TeacherID) REFERENCES SchoolSchema.Teachers(ID) ON DELETE CASCADE
);

Create Table SchoolSchema.Courses
(
ID INT PRIMARY KEY,
courseName VARCHAR(50) NOT NULL,
TeacherID int unique
FOREIGN KEY (TeacherID) REFERENCES SchoolSchema.Teachers(ID) ON DELETE CASCADE
);

Create Table SchoolSchema.Students
(
ID INT PRIMARY KEY,
firstName VARCHAR(50) NOT NULL,
lastName VARCHAR(50) NOT NULL,
Email VARCHAR(50) UNIQUE NOT NULL,
Address VARCHAR(50)
);


Create Table SchoolSchema.Student_Courses
(
Student_ID INT,
Course_ID INT,
PRIMARY KEY (Student_ID, Course_ID),
FOREIGN KEY (Student_ID) REFERENCES SchoolSchema.Students(ID),
FOREIGN KEY (Course_ID) REFERENCES SchoolSchema.Courses(ID)
);

Create Table SchoolSchema.Student_Teachers
(
Student_ID INT,
Teacher_ID INT,
PRIMARY KEY (Student_ID, Teacher_ID),
FOREIGN KEY (Student_ID) REFERENCES SchoolSchema.Students(ID),
FOREIGN KEY (Teacher_ID) REFERENCES SchoolSchema.Teachers(ID)
);

INSERT INTO SchoolSchema.Teachers (ID, firstName, lastName, Email) VALUES
(1, 'batool', 'Doe', 'john.doe@example.com'),
(2, 'mohammad', 'Smith', 'jane.smith@example.com'),
(3, 'adnan', 'Brown', 'robert.brown@example.com'),
(4, 'rudainah', 'Davis', 'emily.davis@example.com'),
(5, 'rahaf', 'Wilson', 'michael.wilson@example.com');

INSERT INTO SchoolSchema.TeacherDetails (ID,phone, Salary, Address, TeacherID) VALUES
(1, 0772001204,  '123 irbid St', 1),
(2, 0772115442, '456 jerash St', 2),
(3, 0772551085, '789 mafraq St', 3),
(4, 079551542,'101 twany St',4),
(5, 076531245, '202 sss St',5);

INSERT INTO SchoolSchema.Courses (ID, CourseName,TeacherID) VALUES
(1, 'Mathematics' ,1),
(2, 'Physics' ,2),
(3,  'Chemistry' ,3),
(4,  'Biology' ,4),
(5,  'Computer Science' ,5);

INSERT INTO SchoolSchema.Students (ID, firstName, lastName, Email , Address) VALUES
(1, 'sara', 'yousef', 'saraharahsheh@gmail.com' , '20 st'),
(2, 'mead', 'yousef', 'mead@gmail.com', '30 st'),
(3, 'ali', 'kamel', 'charlie.anderson@gmail.com','40 st'),
(4, 'maha', 'salem', 'mahasalem@gmail.com', '50 st'),
(5, 'amal', 'ali', 'amalAli@gmail.com', '60 st');

INSERT INTO SchoolSchema.Student_Courses (Student_ID, Course_ID) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

INSERT INTO SchoolSchema.Student_Teachers (Student_ID, Teacher_ID) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

select * from SchoolSchema.Teachers;
select * from SchoolSchema.TeacherDetails;
select * from SchoolSchema.Courses;
select * from SchoolSchema.Students;
select * from SchoolSchema.Student_Courses;
select * from SchoolSchema.Student_Teachers;