--Cau 2: Tao bang
create table Users(
	Id int primary key identity(1,1),
	Name nvarchar (100) not null,
	Address nvarchar(255) not null,
	Dob date check(Dob < getdate())
);


create table Phones(
	Id int primary key identity(1,1),
	Tel varchar(15) not null,
	UserId int foreign key references Users(Id)
);
drop table Users;
drop table Phones;

--Cau 3: Chen them du lieu vao bang
insert into Users(Name, Address, Dob)
values (N'Nguyễn Văn An',N'111 Nguyễn Trãi, Thanh Xuân, Hà Nội','1987-11-18'),
	(N'Nguyễn Văn Bình',N'112 Nguyễn Trãi, Thanh Xuân, Hà Nội','1988-12-19'),
	(N'Nguyễn Văn Công',N'113 Nguyễn Trãi, Thanh Xuân, Hà Nội','1989-10-20'),
	(N'Nguyễn Văn Dương',N'114 Nguyễn Trãi, Thanh Xuân, Hà Nội','1986-09-21');

insert into Users(Name, Address, Dob)
values (N'Nguyễn Văn Đại',N'115 Nguyễn Trãi, Thanh Xuân, Hà Nội','2009-12-12');

insert into Phones (Tel, UserId)
values ('987654321',1),('09873452',1),('09832323',1),('09434343',1),
	('987654322',2),('09873453',2),('09832324',2),('09434345',2),
	('987654326',3),('09873457',3),('09832328',3),('09434349',3),
	('987654328',4),('09873455',4),('09832324',4),('09434343',4);

insert into Phones (Tel, UserId)
values ('123456789',5),('1354122',5),('121311132',5),('14684231',5);


--Cau 4: a) Liet ke danh sach nhung nguoi trong danh ba
select Name from Users;
select * from Users;

--b) Liet ke danh sach sdt co trong danh ba
select Tel from Phones;

--Cau 5: a) Liet ke ds nguoi trong danh ba theo thu tu alphabet
select Name from Users order by Name asc;

--b) Liet ke sdt cua nguoi co ten la Nguyen Van An
select Tel from Phones where UserId in 
(select Id from Users where Name like N'Nguyễn Văn An');

--c) Liet ke nhung nguoi co ngay sinh 12/12/09
select Name from Users where Dob = '2009-12-12';

--Cau 6: a) Tìm số lượng số điện thoại của mỗi người trong danh bạ.

select count (tel) as soluongdt from Phones where UserId in 
(select Id from Users where Name like N'Nguyễn Văn An') group by UserId;

--b) Tìm tổng số người trong danh bạ sinh vào thang 12.


--c) Hiển thị toàn bộ thông tin về người, của từng số điện thoại.
select * from Users where Id in (select UserId from Phones);
--d) Hiển thị toàn bộ thông tin về người, của số điện thoại 123456789.
select * from Users where Id in (select UserId from Phones where Tel like '123456789');
--Cau 7: Thay đổi những thư sau từ cơ sở dữ liệu
--a) Viết câu lệnh để  thay đổi  trường ngày sinh là trước ngày hiện tại.
alter table Users drop constraint CK__Users__Dob__173876EA;
alter table Users add constraint cur_date check(Dob < getdate());

--b) Viết câu lệnh để xác định  các trường khóa chính và khóa ngoại của các bảng.

--c) Viết câu lệnh để thêm trường ngày bắt đầu liên lạc.
alter table Users add NgayBatDauLamViec date check(NgayBatDauLamViec >getdate());
--Cau 8: a) Thực hiện các chỉ mục sau(Index)
--◦IX_HoTen : đặt chỉ mục cho cột Họ và tên
create index ho_ten on Users(Name);
--◦IX_SoDienThoai: đặt chỉ mục cho cột Số điện thoại
create index sdt on Phones(Tel);