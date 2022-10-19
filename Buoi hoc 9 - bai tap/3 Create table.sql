create table Brands(
	Id int identity(1,1) primary key,
	Name nvarchar(100) not null unique,
	Address nvarchar(255) not null,
	Tel varchar(15) not null unique check(Tel like '0%'),
);
create table Products(
	Id int identity(1,1) primary key,
	Name nvarchar(100) not null unique,
	Description ntext,
	Unit varchar(20) not null,
	Price decimal(12,4) not null check(price>0),
	Inventory int not null,
	BrandId int not null foreign key references Brands(Id),
);

