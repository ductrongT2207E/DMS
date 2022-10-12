create table Asm2_Classes(
	code varchar(20) primary key,
	name varchar(100),
	room nvarchar (20)
);
create table Asm2_Subjects(
	Code varchar(20) primary key,
	Name varchar(100)
);
create table Asm2_Students(
	Code varchar (20) primary key,
	Name varchar(100),
	Dob date,
	ClassCode varchar(20) foreign key references Asm2_Classes(Code)
);
create table Asm2_Results(
	Id int primary key,
	Mark int,
	Result nvarchar(50),
	StudentCode varchar(20) foreign key references Asm2_Students(Code),
	SubjectCode varchar(20) foreign key references Asm2_Subjects(Code)
);
create table Asm2_StudentSubjects(
	StudentCode varchar(20) foreign key references Asm2_Students(Code),
	SubjectCode varchar(20) foreign key references Asm2_Subjects(Code)
);