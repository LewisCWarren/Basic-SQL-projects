use LibrarySystem

procedure dbo.LostTribeSharp @Title varchar(30) = null, @Branch varchar(30) = null
as
select Books.Title, Copies.NumberOfCopies, Branch.branchName
from Books 
inner join BookCopies Copies on Copies.BookID = Books.BookID
inner join library_Branch Branch on Branch.branchID = Copies.BranchID
where Books.Title = isnull(@Title, Books.Title)
and Branch.branchName = isnull(@Branch, Branch.branchName)

create procedure dbo.LostTribe @Title varchar(30) = null
as
select Books.Title, Copies.NumberOfCopies, Branch.branchName
from Books 
inner join BookCopies Copies on Copies.BookID = Books.BookID
inner join library_Branch Branch on Branch.branchID = Copies.BranchID
where Books.Title = isnull(@Title, Books.Title)

create procedure dbo.NoBooksOut
as
select borrower.Name
from Borrower 
left join BookLoans loan on borrower.CardNO = loan.CardNo
where loan.CardNo is null

select * from bookloans

/*QUERY 4*/
create procedure dbo.DueToday
as
select person.name, person.Address, books.Title
from Borrower person
inner join BookLoans loan on loan.CardNo = person.CardNO
inner join books on books.BookID = loan.BookID
where loan.DateDue = '12-20-2019'

exec dbo.DueToday

/*QUERY 5*/


select * from BookLoans

create procedure dbo.BooksOut @branch varchar(30) = null
as
select branch.branchName, Loan.BookID
from library_Branch branch
inner join BookLoans loan on loan.branchID = branch.branchID 
where branch.branchName = isnull(@branch, branch.branchName)

exec dbo.BooksOut @branch = 'Central'

/*QUERY 6*/

create procedure dbo.ManyBooksOut
as 
select person.Name, person.Address, loan.bookID
from Borrower person 
inner join BookLoans loan on loan.CardNo = person.CardNO
where person.CardNO > 5


exec dbo.ManyBooksOut