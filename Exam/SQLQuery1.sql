--CAU 2:
create table Categories(
	CateId char(6) primary key,
	CateName nvarchar(100) not null,
	Description nvarchar(200)
);

create table Parts(
	PartId int primary key identity (1,1),
	PartName nvarchar(100) not null unique,
	CateId char(6) not null foreign key references Categories(CateId),
	Description nvarchar(1000),
	Price decimal(12,4) not null check(Price>=0) default 0,
	Quantity int not null default 0,
	Warranty int not null default 1,
	Photo varchar(200) default 'photo/nophoto.png',
);

--Cau 3:
insert into Categories (CateId,CateName, Description)
values('ABC',N'RAM',N'RAM đời 1'),
	('ABD',N'RAM',N'RAM đời 2'),
	('ABE',N'CPU',N'CPU đời 1'),
	('ABF',N'CPU',N'CPU đời 2'),
	('ABG',N'HDD',N'Ổ cứng đời 1'),
	('ABH',N'HDD',N'Ổ cứng đời 2')
;

insert into Parts(PartName, CateId,Description, Price, Quantity, Warranty,Photo)
values (N'RAM001',N'RAM',N'DDR4',500000,1,1,'photo/ddr4.png'),
	(N'RAM002',N'RAM',N'DDR5',1500000,1,2,'photo/ddr6.png'),
	(N'RAM001',N'CPU',N'Intel core i5',200000,1,3,'photo/i5-2000k.png'),
	(N'RAM001',N'HDD',N'500BG-red',1500000,1,2,'photo/hdd500red.png')
;


--Cau 4:
select * from Parts where Price > 100;

--Cau 5: 

select * from Parts where CateId in (select CateId from Categories where CateName like 'CPU');

--Cau 6:

create view v_Parts as
select a.PartId,a.PartName,b.CateName,a.Price,a.Quantity from Parts a 
left join Categories b on a.CateId = b.CateId;
select * from v_Parts;

--Cau 7:

create view v_TopParts as
select top 5 PartName from Parts order by Price desc;
select * from v_TopParts;