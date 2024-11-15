create DataBase libraryDBdb
use libraryDBdb
Create table Books
(
id int primary key identity,
[Name] nvarchar(100)check(len(name)>2 and len(name)<100),
[PageCount] int check(pagecount>10),

AuthorId int,
BookId int,

Foreign Key (AuthorId) references Authors(id),
Foreign Key (BookId) references Books(id)
)

alter table Books
add AuthorFullName nvarchar(100)

insert into  Books(Name,PageCount)
Values('Çürümenin kitabı',192)

select * from Books

Create Table Authors
(
id int primary key identity,
Name nvarchar(100),
Surname nvarchar(100)
)
insert into Authors
values('Emil Micheal','Cioran')

Create View ReturnValue
as
select  B.Id,B.Name,B.PageCount,Concat(A.name,'',A.surname) as fullname from Books as B
inner join Authors as A
on A.Id=B.Id

Create View RETURNCOUNT
as
select B.id,Sum(B.PageCount) from Books as B
inner join Authors as A
on A.Id=B.id


Create Procedure showcolumn
(
@name nvarchar(40)
)
as
begin 
declare @count int
select 
Id,
Name,
PageCount,
AuthorFullName
From Books
where 

end

Create procedure insertAuthor
(
@name nvarchar(20),
@surname nvarchar(20)
)
as 
begin
select 
id ,
name ,
surname 
from Authors
insert into Authors
values(@name,@surname)
end


create Procedure UpdateAuthor
(
@id int,
@name nvarchar(20),
@surname nvarchar(20)
)
as 
begin 
select
id ,
name ,
surname 
from Authors
Update Authors
set [name]=@name ,Surname=@surname
where id=@id
end

create Procedure DeleteAuthor
(
@authorid int
)
as
begin
delete From Authors 
where id=@authorid
end











