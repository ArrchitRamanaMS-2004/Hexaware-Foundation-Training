use CMSDB;

--TASK 02

--1)List all customers:
select distinct * from Customer;

--2) List all orders for a specific customer:  
select * from Orders where SenderID = 101;

--3)List all couriers:  
select * from Courier;

--4)List all packages for a specific order:  
select * from Package where OrderID = 50001;

--5)List all deliveries for a specific courier
select * from Package where CourierID = 30001;

--6. List all undelivered packages:  
select * from Package where PackageStatus = 'undelivered'

--7. List all packages that are scheduled for delivery today:  
select * from Package where DeliveryDate = cast ( getdate() as date );

--8. List all packages with a specific status:  
select * from Package where PackageStatus = 'delivered';

--9. Calculate the total number of packages for each courier.  
select CourierID , count(PackageID) from Package group by CourierID;

--10. Find the average delivery time for each courier  
select avg ( datediff ( day , DispatchDate ,DeliveryDate ) ) as average_delivery_time from Courier;

--11. List all packages with a specific weight range:  
select * from Package where PackageWeight between 6 and 8 ;

--12. Retrieve employees whose names contain 'John'  
select * from Employee where EmpName like '%john%';

--13. Retrieve all courier records with payments greater than $50.  
select * from Courier where CourierID in ( select CourierID from Payment where Amount > 50 );
