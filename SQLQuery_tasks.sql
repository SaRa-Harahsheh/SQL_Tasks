use Library;

create database Library ;

create table Books 
(

BookID int,
Title varchar(50) not null ,
AuthorID int not null ,
PublishedYear INT not  null ,
CopiesAvailable int not null ,
BookCategory varchar(50) 

);

create table Authors
(

AuthorID int ,
FirstName varchar(50) not null ,
LastName varchar(50) not null ,
BirthYear  int not  null 

);



--1- insert 5 rows in each table (Query to in insert 5 records in each table one by one or in one step)

insert into Authors (AuthorID,FirstName,LastName,BirthYear )
values 

(6, 'Harper', 'Lee', 1926),
(7, 'George', 'Orwell', 1903),
(8, 'F. Scott', 'Fitzgerald', 1896),
(9, 'J.K.', 'Rowling', 1965),
(10, 'J.D.', 'Salinger', 1919);

insert into Books (BookID,Title,AuthorID,PublishedYear,CopiesAvailable,BookCategory)
values 
(1, 'To Kill a Mockingbird', 6, 1960, 20, 'Fiction'),
(2, '1984', 7, 1949, 15, 'Dystopian'),
(3, 'The Great Gatsby', 8, 1925, 10, 'Classic'),
(4, 'Harry Potter and the Sorcerer''s Stone', 9, 1997, 25, 'Fantasy'),
(5, 'The Catcher in the Rye', 10, 1951, 18, 'Coming-of-Age');

--2- Display All Books and Authors: ( Query to retrieve and print details of all books along with their respective authors).

select * from Books;
select *from Authors;

--test
--select * from Books where BookCategory='Fantasy';
--select Title ,AuthorID from Books where BookID='3';


--3- Book Availability: ( Query to show the book with the highest and lowest number of available copies ).

select MAX(CopiesAvailable) highestCopies  FROM Books;
select MIN(CopiesAvailable) lowestCopies FROM Books;

--4- Average Publication Year:( Query to calculate and display the average publication year of books in the library )

select AVG(PublishedYear) as averagePublishedYear from Books;

--5- Total Books Count:( Query to count and print the total number of books in the library )

select Count(*)  as total_books from Books;

--6- Empty Books Table ( i just need make Books Table with out any record )

truncate table Books;

--7- update Authors table ( Query to add Email & Phone_Number as new columns ) mmm :/

alter table Authors
add Email varchar(30), Phone_Number varchar(20) ;


alter table Authors
add Phone_Number varchar(20);


--8- Delete Authors Table
drop table Authors; 

