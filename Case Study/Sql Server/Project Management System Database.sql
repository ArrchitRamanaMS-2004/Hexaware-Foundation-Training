create database PMSDB;
use PMSDB;

create table Project ( 
	ProjectId int primary key,
	ProjectName varchar (250),
	ProjDescription varchar (500),
	ProjStartDate date,
	ProjStatus varchar (100)
);

create table Employee (
	EmployeeId int primary key,
	EmployeeName varchar (50),
	EmpDesignation varchar (50),
	EmpGender char,
	EmpSalary int,
	ProjectId int,
	constraint FK_Employee_Project foreign key (ProjectId) references Project(ProjectId) on delete set null
);

select * from INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_NAME = 'Employee';

create table Task (
	TaskId int primary key,
	TaskName varchar (250),
	TaskStatus varchar (100),
	ProjectId int,
	EmployeeId int,
	constraint FK_Task_Project foreign key (ProjectId) references Project(ProjectId) on delete set null,
	constraint FK_Task_Employee foreign key (EmployeeId) references Employee(EmployeeId) on delete set null
);

select * from INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_NAME = 'Task';