CREATE DATABASE [EMS]
GO

USE [EMS]

GO

CREATE TABLE [dbo].[Department](
	[DeptNo] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[DeptName] [nvarchar](30) NOT NULL,
	[Note] [nvarchar](100)
)

GO

CREATE TABLE [dbo].[Employee] (
	[EmpNo] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[EmpName] [nvarchar](30) NOT NULL,
	[BirthDay] [date] NOT NULL,
	[DeptNo] [int] NOT NULL, 
	[MgrNo] [int] NOT NULL, 
	[StartDate] [date] NOT NULL,
	[Salary] [money] NOT NULL,
	[EmpStatus] [int] NOT NULL,
	[Note] [nchar](100) NULL,
	[EmpLevel] [int] NOT NULL,
	FOREIGN KEY([DeptNo])REFERENCES Department (DeptNo)
) 

GO

CREATE TABLE [dbo].[Skill](
	[SkillNo] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY ,
	[SkillName] [nvarchar](30) NOT NULL,
	[Note] [nchar](100)
) 

GO

CREATE TABLE [dbo].[Emp_Skill](
	[SkillNo] [int] NOT NULL,
	[EmpNo] [int] NOT NULL,
	[SkillLevel] [int] NOT NULL,
	[RegDate] [date] NOT NULL,
	[Description] [nvarchar](100),
	PRIMARY KEY (SkillNo, EmpNo),
	FOREIGN KEY(SkillNo) REFERENCES Skill(SkillNo),
	FOREIGN KEY(EmpNo) REFERENCES Employee(EmpNo)
)

/*************************** INSERT DATA ****************************/
GO
--Department
insert into Department(DeptName, Note) values('IT', 'Software Development')
insert into Department(DeptName, Note) values('Marketing', 'Business')
insert into Department(DeptName, Note) values('Sales', 'Business')

GO
--Employee
insert into Employee(EmpName, BirthDay, DeptNo, MgrNo, StartDate, Salary, EmpStatus, EmpLevel) 
values('Eminem', '2000-01-12', 1, 1, '2023-12-01', 1000, 1, 5)
insert into Employee(EmpName, BirthDay, DeptNo, MgrNo, StartDate, Salary, EmpStatus, EmpLevel) 
values('Selena Gome', '1997-12-12', 1, 1, '2022-01-01', 1200, 1, 7)
insert into Employee(EmpName, BirthDay, DeptNo, MgrNo, StartDate, Salary, EmpStatus, EmpLevel) 
values('Nick', '2001-04-06', 1,  1, '2022-12-12', 900, 1, 3)
insert into Employee(EmpName, BirthDay, DeptNo, MgrNo, StartDate, Salary, EmpStatus, EmpLevel) 
values('Nick', '1984-04-06', 3,  1, '2023-12-12', 700, 1, 2)

GO
--Skill
insert into Skill(SkillName, Note) values('Java', 'IT')
insert into Skill(SkillName, Note) values('.NET', 'IT')
insert into Skill(SkillName, Note) values('Python', 'IT')
insert into Skill(SkillName, Note) values('PHP', 'IT')
insert into Skill(SkillName, Note) values('Dart', 'IT')
insert into Skill(SkillName, Note) values('C++', 'IT')

GO
--Emp_Skill
insert into Emp_Skill(SkillNo, EmpNo, SkillLevel, RegDate) 
values(1, 1, 2, '2023-04-30')
insert into Emp_Skill(SkillNo, EmpNo, SkillLevel, RegDate) 
values(2, 1, 3, '2023-05-30')
insert into Emp_Skill(SkillNo, EmpNo, SkillLevel, RegDate) 
values(5, 1, 5, '2023-06-30')
insert into Emp_Skill(SkillNo, EmpNo, SkillLevel, RegDate) 
values(4, 2, 5, '2022-06-30')
