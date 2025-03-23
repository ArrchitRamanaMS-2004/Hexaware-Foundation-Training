create database CMSDB;
use CMSDB;

create table Customer (
	CustomerID int primary key,
	CustName varchar (50),
	CustEmail varchar (30),
	CustPassword varchar (30),
	ContactNo int,
	CustAddress varchar(255)
);

select * from INFORMATION_SCHEMA.COLUMNS where table_name = 'Customer';

create table CourierServices ( 
	ServiceID int primary key,
	ServiceName varchar(100),
	Cost decimal (10,2)
);

create table Location (
	LocationID int primary key,
	LocationName varchar (255),
	Address varchar (255)
);

create table Employee ( 
	EmployeeID int primary key,
	EmpName varchar (100),
	EmpEmail varchar (100),
	EmpContactNo int,
	EmpRole varchar (100),
	Salary decimal(15,2),
	LocationID int,
);

alter table Employee add constraint FK_Employee_Location foreign key (LocationID) references Location(LocationID);
alter table Employee drop constraint FK__Employee__Locati__3C69FB99;

select * from INFORMATION_SCHEMA.COLUMNS where table_name = 'Employee';
select * from INFORMATION_SCHEMA.TABLE_CONSTRAINTS where TABLE_NAME = 'Employee';

create table Courier ( 
	CourierID int primary key,
	SenderName varchar (100),
	SenderAddress varchar (100),
	ReceiverName varchar (100),
	ReceiverAddress varchar (100),
	Weight decimal (6,2),
	Status varchar (50),
	TrackingNumber int,
	DeliveryDate date,
	PickUpBranchID int,
	DestiBranchID int,
);

alter table Courier drop constraint FK__Courier__PickUpB__403A8C7D;
alter table Courier drop constraint FK__Courier__DestiBr__412EB0B6;
alter table Courier add constraint FK_PickUp_Courier_Location foreign key (PickUpBranchID) references Location (LocationID);
alter table Courier add constraint FK_Desti_Courier_Location foreign key (DestiBranchID) references Location (LocationID);

select * from INFORMATION_SCHEMA.TABLE_CONSTRAINTS where TABLE_NAME = 'Courier';
select * from INFORMATION_SCHEMA.TABLE_CONSTRAINTS;

create table Payment (
	PaymentID int primary key,
	Amount decimal (15,2),
	PaymentDate date,
	PaymentStatus varchar (50),
	Courier_ID int,
	PaidLocationID int,
	Service_ID int,
	Customer_ID int,
	foreign key (Courier_ID) references Courier (CourierID) ,
	foreign key (PaidLocationID) references Location (LocationID) ,
	foreign key (Service_ID) references CourierServices (ServiceID) ,
	foreign key (Customer_ID) references Customer (CustomerID) ,
);

select * from INFORMATION_SCHEMA.COLUMNS where table_name = 'Payment';

alter table Payment add constraint FK_Payment_Courier foreign key (Courier_ID) references Courier (CourierID);
alter table Payment add constraint FK_Payment_Location foreign key (PaidLocationID) references Location (LocationID);
alter table Payment add constraint FK_Payment_CourierServices foreign key (Service_ID) references CourierServices (ServiceID);
alter table Payment add constraint FK_Payment_Customer foreign key (Customer_ID) references Customer (CustomerID);
alter table Payment drop constraint FK__Payment__Courier__47DBAE45;
alter table Payment drop constraint FK__Payment__PaidLoc__48CFD27E;
alter table Payment drop constraint FK__Payment__Service__49C3F6B7;
alter table Payment drop constraint FK__Payment__Custome__4AB81AF0;

select * from INFORMATION_SCHEMA.TABLE_CONSTRAINTS where TABLE_NAME = 'Payment';

create table Orders ( 
	OrderID int primary key,
	SenderID int,
	DeliveryAgentID int,
	Serv_ID int,
	Cour_ID int,
	Pay_ID int,
	foreign key (SenderID) references Customer (CustomerID),
	foreign key (DeliveryAgentID) references Employee (EmployeeID),
	foreign key (Serv_ID) references CourierServices (ServiceID),
	foreign key (Cour_ID) references Courier (CourierID),
	foreign key (Pay_ID) references Payment (PaymentID),
);

select * from INFORMATION_SCHEMA.TABLE_CONSTRAINTS where TABLE_NAME = 'Orders';

alter table Orders drop constraint FK__Orders__SenderID__5165187F;
alter table Orders drop constraint FK__Orders__Delivery__52593CB8;
alter table Orders drop constraint FK__Orders__Serv_ID__534D60F1;
alter table Orders drop constraint FK__Orders__Cour_ID__5441852A;
alter table Orders drop constraint FK__Orders__Pay_ID__5535A963;

alter table Orders add constraint FK_Orders_Customer foreign key (SenderID) references Customer (CustomerID);
alter table Orders add constraint FK_Orders_Employee foreign key (DeliveryAgentID) references Employee (EmployeeID);
alter table Orders add constraint FK_Orders_CourierServices foreign key (Serv_ID) references CourierServices (ServiceID);
alter table Orders add constraint FK_Orders_Courier foreign key (Cour_ID) references Courier (CourierID);
alter table Orders add constraint FK_Orders_Payment foreign key (Pay_ID) references Payment (PaymentID);

select * from INFORMATION_SCHEMA.TABLE_CONSTRAINTS where TABLE_NAME = 'Orders';
select * from INFORMATION_SCHEMA.COLUMNS where TABLE_NAME = 'Orders';
select * from INFORMATION_SCHEMA.COLUMNS where TABLE_NAME = 'Payment';

insert into Customer values ( 101 , 'abdul' , 'abdul@gmail.com' , 'abdul123' , 9876101 , '001 , 1st st , madurai , tamilnadu , india - 623001' );
insert into Customer values ( 102 , 'kumar' , 'kumar@gmail.com' , 'kumar123' , 9876102 , '002 , 2nd st , theni , tamilnadu , india - 623002' );
insert into Customer values ( 103 , 'ravi' , 'ravi@gmail.com' , 'ravi123' , 9876103 , '001 , 1st st , madurai , tamilnadu , india - 623001' );
insert into Customer values ( 104 , 'keshav' , 'keshav@gmail.com' , 'keshav123' , 9876104 , '004 , 4th st , AD nagar , trichy , tamilnadu , india - 623004' );
select * from Customer;


insert into CourierServices values ( 1001 , 'standard delivery' , 100 );
insert into CourierServices values ( 1002 , 'next day delivery' , 200 );
insert into CourierServices values ( 1003 , 'same day delivery' , 300 );
insert into CourierServices values ( 1004 , 'express delivery' , 400 );
select * from CourierServices;

insert into Location values ( 10001 , 'madurai branch' , '011 , 1st st , AA nagar , madurai , tamilnadu , india - 623011' );
insert into Location values ( 10002 , 'theni branch' , '022 , 2nd st , AB nagar , theni , tamilnadu , india - 623012' );
insert into Location values ( 10003 , 'chennai branch' , '033 , 3rd st , AC nagar , chennai , tamilnadu , india - 623013' );
insert into Location values ( 10004 , 'trichy branch' , '044 , 4th st , AD nagar , trichy , tamilnadu , india - 623014' );
select * from Location;

insert into Employee values ( 20001 , 'abishek' , 'abishek@gmail.com' , 8765201 , 'delivery agent' , 30000 , 10001 );
insert into Employee values ( 20002 , 'jack' , 'jack@gmail.com' , 8765202 , 'delivery agent' , 30000 , 10002 );
insert into Employee values ( 20003 , 'george' , 'george@gmail.com' , 8765203 , 'delivery agent' , 30000 , 10003 );
insert into Employee values ( 20004 , 'smith' , 'smith@gmail.com' , 8765204 , 'delivery agent' , 30000 , 10004 );
select * from Employee;

insert into Courier values ( 30001 , 'abdul' , '001 , 1st st , madurai , tamilnadu , india - 623001' , 'keshav' , '004 , 4th st , AD nagar , trichy , tamilnadu , india - 623004' , 5 , 'order placed' , 123456 , '2025-03-25' , 10001 , 10004);
insert into Courier values ( 30002 , 'kumar' , '002 , 2nd st , theni , tamilnadu , india - 623002' , 'ravi' , '001 , 1st st , madurai , tamilnadu , india - 623001' , 6 , 'order placed' , 123457 , '2025-03-29' , 10002 , 10001);
select * from Courier;

insert into Payment values ( 40001 , 200 , '2025-03-24' , 'paid' , 30001 , 10001 , 1002 , 101 );
insert into Payment values ( 40002 , 100 , '2025-03-24' , 'paid' , 30002 , 10002 , 1001 , 102 );
select * from Payment;

insert into Orders values ( 50001 , 101 , 20001 , 1002 , 30001 , 40001 );
insert into Orders values ( 50002 , 102 , 20002 , 1001 , 30002 , 40002 );
select * from Orders;