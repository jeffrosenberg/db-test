create table dbo.PlusTable (
  id int not null primary key identity(1, 1),
  secondId int not null,
  baseId int not null,
  otherField varchar(500) null
)

go