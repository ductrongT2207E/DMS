create table Customers(
	Name  nvarchar(255) not null,
	Address nvarchar(255) not null,
	Tel varchar(15) not null unique check(Tel like'0%'),
	Id int primary key identity(1,1)
);
create table Products(
	Price decimal(12,4) not null check(Price >=0) default 0,
	Name nvarchar(100) not null unique,
	Description ntext,
	Unit nvarchar(50) not null check( Unit in (N'Chiếc', N'Cặp',N'Bộ')),
	Id int primary key identity(1,1),
);
create table Orders(
	Id integer primary key identity(1,1),
	OrderDate date not null check(OrderDate<=getdate()),
	GrandTotal decimal(12,4) not null check(GrandTotal>=0 ),
	CustomerId int foreign key references Customers(Id),
);
create table OrderItems(
	Qty int not null check(Qty>0),
	Total decimal(12,4) not null check(Total>=0),
	OrderId integer not null foreign key references Orders(Id),
	ProductId int not null foreign key references Products(Id)
);
