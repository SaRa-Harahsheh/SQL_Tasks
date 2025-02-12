create database Library_Mangment;


create table library_staff (
ID int primary key ,
Name nvarchar(100) not null,
Contact_Info nvarchar(100)  not null,
Assigned_Section nvarchar(100)  not null,
Employment_Date Date  not null
);



create table Categories(
ID int primary key ,
Name nvarchar(100) not null,
Description text NOT NULL
);




create table Members(
ID int primary key ,
Name nvarchar(100) not null,
Contact_Information nvarchar(100) not null,
Membership nvarchar(100) not null,
Registration_Date date not null
);


create table Books1 (
ID int primary key ,
Title nvarchar(100) not null,
Author nvarchar(100) not null,
Genre nvarchar(100) not null,
Publication_Year date not null ,
Availability_Status nvarchar(100) not null,
Categories_ID int,
FOREIGN KEY (Categories_ID)REFERENCES Categories(ID)
);

create table borrowing(
ID int primary key ,
Borrowing_date date  not null,
due_date date not null ,
return_date date ,
Book_ID int,
Members_ID int,
FOREIGN KEY (Book_ID)REFERENCES Books1(ID),
FOREIGN KEY (Members_ID)REFERENCES Members(ID)
);

create table Reservations (
ID int primary key ,
Reservation_Date date not null ,
Status nvarchar(100) not null ,
Book_ID int,
Members_ID int,
FOREIGN KEY (Book_ID)REFERENCES Books1(ID),
FOREIGN KEY (Members_ID)REFERENCES Members(ID)
);

insert into library_staff(ID,Name,Contact_Info,Assigned_Section,Employment_Date) values
(1, 'Ali', '0551234567', 'Fiction', '2022-03-15'),
(2, 'Sara ', '0552345678', 'Science', '2021-07-22'),
(3, 'Mohammed ', '0553456789', 'History', '2020-11-10'),
(4, 'Nour ', '0554567890', 'Children', '2023-05-30'),
(5, 'Hassan ', '0555678901', 'Technology', '2019-09-18');


insert into Categories(ID,Name,Description)Values
(1, 'Fiction', 'Books that contain imaginary or made-up stories.'),
(2, 'Science', 'Books related to scientific concepts and discoveries.'),
(3, 'History', 'Books covering historical events and biographies.'),
(4, 'Technology', 'Books about programming, AI, and modern tech trends.'),
(5, 'Children', 'Books designed for young readers and kids.');

insert into Members (ID,Name,Contact_Information,Membership,Registration_Date)values
(1, 'Omar Ali', '0551112233', 'Student', '2024-01-10'),
(2, 'Sara Ahmed', '0552223344', 'Teacher', '2023-11-05'),
(3, 'Khalid Hassan', '0553334455', 'Visitor', '2024-02-01'),
(4, 'Noor Salim', '0554445566', 'Student', '2023-09-15'),
(5, 'Hassan Omar', '0555556677', 'Teacher', '2022-12-20');

insert into Books1(ID,Title,Author,Genre,Publication_Year,Availability_Status,Categories_ID)values
(1, 'Database Fundamentals', 'John Smith', 'Technology', '2020-02-01', 'Available', 4),
(2, 'SQL for Beginners', 'Emily Davis', 'Technology', '2019-03-22', 'Borrowed', 4),
(3, 'C# Programming', 'Michael Brown', 'Technology', '2021-05-11', 'Available', 4),
(4, 'The History of Science', 'Sarah Johnson', 'Science', '2018-07-17', 'Reserved', 2),
(5, 'Children’s Stories', 'Noah Wilson', 'Children', '2022-06-22', 'Available', 5);

insert into borrowing(ID,Borrowing_date,due_date,return_date,Book_ID,Members_ID)values
(1, '2024-01-05', '2024-01-20', '2024-01-18', 1, 2),
(2, '2024-02-10', '2024-02-25', NULL, 2, 3), -- لم يتم إرجاع الكتاب بعد
(3, '2023-12-15', '2023-12-30', '2024-01-02', 3, 1), -- تأخير في الإرجاع
(4, '2024-01-28', '2024-02-12', NULL, 4, 4), -- لم يتم إرجاع الكتاب بعد
(5, '2023-11-20', '2023-12-05', '2023-12-04', 5, 5);


insert into Reservations(ID,Reservation_Date,Status,Book_ID,Members_ID)values
(1, '2024-02-01', 'Pending', 1, 3),
(2, '2024-01-15', 'Completed', 2, 1),
(3, '2024-02-05', 'Cancelled', 3, 4),
(4, '2024-01-25', 'Pending', 4, 2),
(5, '2024-02-10', 'Completed', 5, 5);


--1. Select members who registered on a specific date
--👉 Question:
--Write an SQL query to find all members who registered on 1-1-2025.

select *
FROM Members
WHERE Registration_Date='2022-12-20';

--2. Select details of a book by its title
--👉 Question:
--Write an SQL query to retrieve all details of a book titled "Database Fundamentals".

select *
FROM Books1
WHERE Title= 'Database Fundamentals';


--3. Add a new column ‘Email’ to the Members table
--👉 Question:
--The Members table is missing an Email column. Write an SQL query to add an Email column with a data type suitable for storing email addresses.

ALTER TABLE Members
ADD Email varchar(255);

select * from Members;

--4. Insert a new member record
--👉 Question:
--Write an SQL query to insert a new member with the following details:

--Name: Omar
--Contact: 9876543210
--Membership Type: Student
--Registration Date: 5-6-2024
--Email: Omar@gmail.com


insert into Members (ID,Name,Contact_Information,Membership,Registration_Date,Email)values
(6,'Omar','07777777','Teacher','1999-05-10','Omar@gmail.com');


--5. Select members who have reservations in the system
--👉 Question:
--Write an SQL query to find all members who have made a book reservation.

select *
from Members
inner join Reservations
ON  Reservations.Members_ID = Members.ID 
 



--6. Select members who have borrowed a specific book
--👉 Question:
--Write an SQL query to find members who have borrowed the book titled "SQL for Beginners".


SELECT *
FROM Members 
JOIN borrowing  ON Members.ID = borrowing.Members_ID
JOIN Books1  ON borrowing.Book_ID = Books1.ID
WHERE Books1.Title = 'SQL for Beginners';


--7. Select members who have borrowed and returned a specific book
--👉 Question:
--Write an SQL query to find all members who have borrowed and returned the book titled "C# Programming".

select * 
from Members
inner join borrowing on  Members.ID =borrowing.Members_ID
inner join Books1 on borrowing.Book_ID = Books1.ID
where Books1.Title='C# Programming'AND borrowing.return_date IS NOT NULL;


--8. Find members who made a late return
--👉 Question:
--Write an SQL query to find members who have returned books after the due date.


select * 
from Members 
inner join borrowing on Members.ID= borrowing.Members_ID
where return_date> due_date;


--9. Select books borrowed more than 3 times
--👉 Question:
--Write an SQL query to find books that have been borrowed more than 3 times.


--10. Find members who have borrowed books between two dates
--👉 Question:
--Write an SQL query to find members who have borrowed a book between January 1, 2024, and January 10, 2024.

select * 
from Members
inner join borrowing
on Members.ID= borrowing.Members_ID
where borrowing.Borrowing_date between '2023-12-15' and '2024-02-28';

--11. Count the total number of books in the library
--👉 Question:
--Write an SQL query to count the total number of books available in the library.

select Count(*)
from Books1
where Books1.Availability_Status = 'Available';

