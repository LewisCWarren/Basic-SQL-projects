Use LibrarySystem
GO

Create table library_Branch (
	branchID int primary key not null identity (1,1), /*make this a foreign key from the book loans, book copies table */
	branchName varchar(50) not null,
	branchAddress varchar(50) not null
	)

insert into library_Branch
	(branchName, branchAddress)
	values
	('Sharpstown', '4210 Almond Ln.'),
	('Central', '309 Main St.'),
	('Lake Grove', '1291 Lottery Ln.'),
	('Camas Public', '1804 2nd St.')
;

select * from library_Branch;

create table Borrower (
	CardNO int primary key not null identity (10000,1), /*foreign key from book loans table*/
	Name varchar(50) not null,
	Address varchar(50) not null,
	Phone varchar(20) not null
	);

insert into Borrower
	(Name, Address, Phone)
	values
	('John Klingenheimer','264 yaboy St.', '367-908-4263'),
	('Schmirley Temple', '199 wholesome Ln.', '354-536-8765'),
	('Bobby Whatsup', '23 howdy Ct.', '365-897-5132'),
	('Joey Bonaducci', '2873 Palatial Regalia Rd.', '853-899-2654'),
	('The RZA', '765 Wu Tang Ln.', '670-562-8932'),
	('Frankie "Concrete Boots" Taglione', '3487 Not a front Ln.', '278-786-8628'),
	('Chester Copperpot', '785 Bootie Trap Rd.', '674-289-2095'),
	('Alexander The Great', '965 Macedonia Ct.', '677-782-0264')
;

select * from Borrower;

create table Publisher (
	PublisherName varchar(50) primary key not null,
	Address varchar(50) not null,
	Phone varchar(50) not null
	)

insert into Publisher 
	(PublisherName, Address, Phone)
	values
	('We Publish', '12 Elm St.', '638-290-7392'),
	('Publisher Guys', '78 Tennis St.', '739-384-9473'),
	('We Publish so you dont have to', '382 Fall Ave.', '378-292-9473'),
	('Publish for less', '73 Baller Ln.', '284-865-4903')
	
;

	select * from Publisher;

	create table Books (
	BookID int primary key not null identity (10000,1),
	Title varchar(150) not null,
	PublisherName varchar(50) not null constraint fk_PublisherName foreign key references Publisher(PublisherName) on update cascade on delete cascade,
	)

	select * from books;

	insert into Books 
	(Title, PublisherName)
	values
	('It', 'We Publish'),
	('The Lost Tribe', 'Publisher Guys'),
	('Misery', 'We Publish so you dont have to'),
	('The Body', 'We Publish so you dont have to'),
	('Dark Tower', 'Publish for less'),
	('Cujo', 'Publisher Guys'),
	('How to Burn Books And Other Ways to Dictate', 'We Publish'),
	('Pet Sematary', 'We Publish so you dont have to'),
	('Children of the Corn', 'We Publish so you dont have to'),
	('Fellowship of the Ring', 'Publisher Guys'),
	('The Return of the King', 'We Publish'),
	('The Two Towers', 'Publisher Guys'),
	('The Hobbit', 'We Publish so you dont have to'),
	('Just Some Book by Some Guy', 'Publish for less'),
	('You Cannot Be Serious', 'We Publish'),
	('Wow! What a Book!', 'We Publish'),
	('Books To Read Before You Read a Book', 'We Publish so you dont have to'),
	('If it Wasnt a Book, it is Now', 'Publish for less'),
	('Books, Books, and More Books, "The Only Guide To Reading a Book Youll Ever Need"', 'Publisher Guys'),
	('Finally, a Book Thats NOT For Blind People', 'We Publish' )
;

create table BookAuthors (
	BookID int not null constraint fk_BookID foreign key references Books(BookID) on update cascade on delete cascade,
	AuthorName varchar(50) not null
	)

insert into BookAuthors 
	(BookID, AuthorName)
	values
	(10000, 'Stephen King'),
	(10001, 'Stephen King'),
	(10002, 'Stephen King'),
	(10003, 'Stephen King'),
	(10004, 'Stephen King'),
	(10005, 'Stephen King'),
	(10006, 'Jimmy Keaton'),
	(10007, 'Stephen King'),
	(10008, 'Stephen King'),
	(10009, 'J.R.R. Tolkien'),
	(10010, 'J.R.R. Tolkien'),
	(10011, 'J.R.R. Tolkien'),
	(10012, 'J.R.R. Tolkien'),
	(10013, 'Gene Conway'),
	(10014, 'James McEnroe'),
	(10015, 'Kyle Kingsley'),
	(10016, 'M.A. whyDoSoManyWritersUseInitialPenNames'),
	(10017, 'Micheal McDonald'),
	(10018, 'Michael Jordan'),
	(10019, 'Elton John')
;

select * from BookAuthors;


create table BookCopies (
	BookID int not null constraint fk_BookID2 foreign key references Books(BookID) on update cascade on delete cascade,
	BranchID int not null constraint fk_branchID foreign key references library_Branch(branchID) on update cascade on delete cascade,
	NumberOfCopies int not null
	)
	
select * from Books;
select * from library_Branch;
select * from BookCopies;

insert into BookCopies
	(BookID, BranchID, NumberOfCopies)
	values
	(10013, 4, 3),
	(10010, 4, 2),
	(10007, 4, 3),
	(10002, 4, 2),
	(10000, 4, 4),
	(10011, 4, 2),
	(10019, 4, 2),
	(10017, 4, 2),
	(10004, 4, 3),
	(10001, 4, 2),

	(10001, 3, 3),
	(10006, 3, 2),
	(10018, 3, 3),
	(10010, 3, 4),
	(10009, 3, 2),
	(10015, 3, 3),
	(10003, 3, 2),
	(10016, 3, 4),
	(10017, 3, 2),
	(10007, 3, 2),

	(10011, 2, 2),
	(10004, 2, 3),
	(10013, 2, 3),
	(10001, 2, 2),
	(10003, 2, 2),
	(10006, 2, 3),
	(10019, 2, 4),
	(10009, 2, 2),
	(10017, 2, 2),
	(10008, 2, 3),

	(10003, 1, 3),
	(10001, 1, 2),
	(10009, 1, 2),
	(10008, 1, 2),
	(10006, 1, 3),
	(10015, 1, 2),
	(10010, 1, 3),
	(10016, 1, 5),
	(10018, 1, 2),
	(10004, 1, 2)
;

select * from BookCopies
select * from Borrower;
select * from library_Branch;
select * from Books;


create table BookLoans (
	BookID int not null constraint fk_BookID3 foreign key references Books(BookID) on update cascade on delete cascade,
	branchID int not null constraint fk_branchID2 foreign key references library_Branch(branchID) on update cascade on delete cascade,
	CardNo int not null constraint fk_CardNO foreign key references Borrower(CardNO) on update cascade on delete cascade,
	DateOut date not null, /*YYYY-MM-DD*/
	DateDue date not null
	)

	select * from BookLoans

insert into BookLoans 
	(BookID, branchID, CardNO, DateOut, DateDue)
	values
	(10019, 2, 10003, '2019-11-26', '2019-12-26'),
	(10008, 2, 10003, '2019-11-26', '2019-12-26'),
	(10006, 2, 10003, '2019-11-26', '2019-12-26'),
	(10001, 2, 10003, '2019-11-26', '2019-12-26'),
	(10017, 2, 10003, '2019-11-26', '2019-12-26'),
	(10002, 2, 10003, '2019-11-26', '2019-12-26'),
	(10003, 2, 10003, '2019-11-26', '2019-12-26'),

	(10001, 1, 10002, '2019-11-20', '2019-12-20'),
	(10003, 1, 10002, '2019-11-20', '2019-12-20'),
	(10010, 1, 10002, '2019-11-20', '2019-12-20'),
	(10009, 1, 10002, '2019-11-20', '2019-12-20'),
	(10004, 1, 10002, '2019-11-20', '2019-12-20'),
	(10016, 1, 10002, '2019-11-20', '2019-12-20'),
	(10018, 1, 10002, '2019-11-20', '2019-12-20'),

	(10018, 3, 10007, '2019-11-29', '2019-12-29'),
	(10010, 3, 10007, '2019-11-29', '2019-12-29'),
	(10009, 3, 10007, '2019-11-29', '2019-12-29'),
	(10015, 3, 10007, '2019-11-29', '2019-12-29'),
	(10003, 3, 10007, '2019-11-29', '2019-12-29'),
	(10016, 3, 10007, '2019-11-29', '2019-12-29'),
	(10017, 3, 10007, '2019-11-29', '2019-12-29'),
	(10011, 3, 10007, '2019-11-29', '2019-12-29'),

	(10013, 4, 10006, '2019-12-13', '2020-01-13'),
	(10010, 4, 10006, '2019-12-13', '2020-01-13'),
	(10007, 4, 10006, '2019-12-13', '2020-01-13'),
	(10002, 4, 10006, '2019-12-13', '2020-01-13'),
	(10000, 4, 10006, '2019-12-13', '2020-01-13'),
	(10011, 4, 10006, '2019-12-13', '2020-01-13'),
	(10019, 4, 10006, '2019-12-13', '2020-01-13'),
	(10017, 4, 10006, '2019-12-13', '2020-01-13'),
	(10004, 4, 10006, '2019-12-13', '2020-01-13'),

	(10003, 1, 10005, '2019-12-19', '2020-01-19'),
	(10001, 1, 10005, '2019-12-19', '2020-01-19'),
	(10009, 1, 10005, '2019-12-19', '2020-01-19'),
	(10008, 1, 10005, '2019-12-19', '2020-01-19'),
	(10006, 1, 10005, '2019-12-19', '2020-01-19'),
	(10015, 1, 10005, '2019-12-19', '2020-01-19'),
	(10010, 1, 10005, '2019-12-19', '2020-01-19'),
	(10016, 1, 10005, '2019-12-19', '2020-01-19'),
	(10018, 1, 10005, '2019-12-19', '2020-01-19'),
	(10004, 1, 10005, '2019-12-19', '2020-01-19'),

	(10007, 3, 10000, '2019-12-11', '2020-01-11'),
	(10017, 3, 10000, '2019-12-11', '2020-01-11'),
	(10016, 3, 10000, '2019-12-11', '2020-01-11'),
	(10003, 3, 10000, '2019-12-11', '2020-01-11'),
	(10015, 3, 10000, '2019-12-11', '2020-01-11'),
	(10009, 3, 10000, '2019-12-11', '2020-01-11'),
	(10010, 3, 10000, '2019-12-11', '2020-01-11'),

	(10001, 2, 10001, '2019-12-04', '2020-01-04'),
	(10006, 2, 10001, '2019-12-04', '2020-01-04'),
	(10018, 2, 10001, '2019-12-04', '2020-01-04'),
	(10009, 2, 10001, '2019-12-04', '2020-01-04'),
	(10015, 2, 10001, '2019-12-04', '2020-01-04')
;


	
/* QUERY 1.*/
select * from library_Branch
select * from BookCopies
select * from Books

create procedure dbo.LostTribeSharp @Title varchar(30) = null, @Branch varchar(30) = null
as
select Books.Title, Copies.NumberOfCopies, Branch.branchName
from Books 
inner join BookCopies Copies on Copies.BookID = Books.BookID
inner join library_Branch Branch on Branch.branchID = Copies.BranchID
where Books.Title = isnull(@Title, Books.Title)
and Branch.branchName = isnull(@Branch, Branch.branchName)

exec dbo.LostTribeSharp @Title = 'The Lost Tribe', @Branch = 'Sharpstown';

/*QUERY 2*/

create procedure dbo.LostTribe @Title varchar(30) = null
as
select Books.Title, Copies.NumberOfCopies, Branch.branchName
from Books 
inner join BookCopies Copies on Copies.BookID = Books.BookID
inner join library_Branch Branch on Branch.branchID = Copies.BranchID
where Books.Title = isnull(@Title, Books.Title)



exec  dbo.LostTribe @Title = 'The Lost Tribe';

select * from Borrower
select * from BookLoans

/*Query 3*/

create procedure dbo.NoBooksOut
as
select borrower.Name
from Borrower 
left join BookLoans loan on borrower.CardNO = loan.CardNo
where loan.CardNo is null

exec dbo.NoBooksOut



select * from BookLoans
select * from library_Branch

select * from Borrower
select * from Books


/*QUERY 4*/
create procedure dbo.DueToday
as
select person.name, person.Address, books.Title
from Borrower person
inner join BookLoans loan on loan.CardNo = person.CardNO
inner join books on books.BookID = loan.BookID
where loan.DateDue = '12-20-2019'

exec dbo.DueToday


select * from BookLoans

/*QUERY 5*/

create procedure dbo.BooksOut @branch varchar(30) = null
as
select branch.branchName, Loan.BookID
from library_Branch branch
inner join BookLoans loan on loan.branchID = branch.branchID 
where branch.branchName = isnull(@branch, branch.branchName)

exec dbo.BooksOut @branch = 'Central'


select * from borrower
select * from BookLoans
select * from books


/*QUERY 6*/
create procedure dbo.ManyBooksOut
as 
select person.Name, person.Address, loan.bookID
from Borrower person 
inner join BookLoans loan on loan.CardNo = person.CardNO
where person.CardNO > 5


exec dbo.ManyBooksOut

/*QUERY 7*/
select * from books
select * from BookCopies
select * from library_Branch

create procedure dbo.StephenKing 
as
select BookAuthors.AuthorName, copies.NumberOfCopies, library_Branch.branchName
from BookAuthors
inner join BookCopies copies on copies.BookID = BookAuthors.BookID
inner join library_Branch on copies.BranchID = library_Branch.branchID
where library_Branch.branchName = 'Central'
and BookAuthors.AuthorName = 'Stephen King'


