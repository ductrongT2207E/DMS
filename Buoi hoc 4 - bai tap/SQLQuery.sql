create table Orders(
Id integer primary key identity(1,1),
Date date check(Date<=getdate()),
Total decimal,
CustomerCode varchar(20),
);
create table Customers(
Name  varchar(100) not null,
Address varchar(255) not null,
Phone integer not null unique,
Code varchar(20) primary key
);
create table Products(
Price decimal not null,
Name varchar(100) not null,
Description varchar(255),
Qty integer not null,
Code varchar(20) primary key,
);
create table OrderProducts(
OrderId integer not null foreign key references Orders(Id)
,
ProductCode varchar(20) not null foreign key references Products(Code)
);
create table CustomerProducts(
CustomerCode varchar(20) not null foreign key references Customers(Code),
ProductCode varchar(20) not null foreign key references Products(Code)
);