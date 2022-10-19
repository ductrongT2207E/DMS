--3
SET IDENTITY_INSERT Brands ON;
INSERT Brands(Id, Name, Address, Tel) values(123, N'Asus', N'USA', '983232');

insert into Brands(Name, Address,Tel)
values (N'Acer', N'Taiwan','123456'),
	(N'Lenovo', N'China','123457');

insert into Products(Name, Description,Unit,Price,Inventory,BrandId)
values (N'Máy Tính T450', N'Máy nhập cũ',N'Chiếc',1000,10),
	(N'Điện Thoại Nokia5670', N'Điện thoại đang hot',N'Chiếc',200,200),
	(N'Máy In Samsung 450', N'Máy in đang loại bình',N'Chiếc',100,10),
	(N'ROG Phone 6', N'Điện thoại gaming',N'Chiếc',1000,500),
	(N'Tablet A6', N'Máy tính bảng mới nhất',N'Chiếc',500,200),
--4
select * from Brands;
select * from Products;

--5
select * from Brands order by Name desc;
select * from Products order by Price desc;
select * from Brands where Name = Asus;
select * from Product where Inventory < 11;
select * from Product where BrandId = 123;

--6
select count(Id) as soluonghang from Brands;
select count(Id) as soluongmathang from Products;

select count(Id) as tongsoloaisanphamAsus from Products where BrandId = 123;
select count(Id) as tongsoloaisanphamAcer from Products where BrandId = 1;
select count(Id) as tongsoloaisanphamLenovo from Products where BrandId = 2);

select sum(Inventory) as tongsosanpham from Products;
