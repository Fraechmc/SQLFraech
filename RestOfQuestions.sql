select count(*), min(orderdate), min(orderdate) from dbo.Orders
where EmployeeID in (1)

select CustomerID, count(OrderID) as OrderCount 
from northwind.dbo.Orders 
group by CustomerID
order by OrderCount

select  productid, sum(quantity* UnitPrice) as Rev 
from northwind.dbo.[Order Details] 
group by ProductID
having sum(quantity* UnitPrice) <= 5000
order by Rev

select c.customerid, city, CompanyName, ContactName, o.OrderID, o.OrderDate, p.ProductName, od.Quantity, p.QuantityPerUnit
from customers c
inner join orders o 
on o.CustomerID = c.CustomerID
inner join [Order Details] od
on od.OrderID = o.OrderID
inner join Products p
on p.ProductID = od.ProductID
where c.Country = 'UK'
order by ContactName, OrderDate

select count(*) 
from customers

select CompanyName, count(orderid) NoOrders, 
Min(o.orderdate) MinOrderDate
from customers c
left join Orders o
on o.CustomerID = c.CustomerID
group by CompanyName

select CompanyName, ContactName,
c.Phone
from customers c
union 
select CompanyName, ContactName,
s.Phone
from Suppliers s
union
select 'Northwind Traders', e.FirstName+' ' + e.LastName, Extension
from Employees e

select * from Invoices
where Country = 'UK'

create view dbo.ContactDirectory as
select CompanyName, ContactName,
c.Phone
from customers c
union 
select CompanyName, ContactName,
s.Phone
from Suppliers s
union
select 'Northwind Traders', e.FirstName+' ' + e.LastName, Extension
from Employees e
go

select * from dbo.ContactDirectory
where ContactName like 'a%'

exec dbo.SalesByCategory 'Seafood', '1996'
exec dbo.SalesByCategory 'Seafood', '1997'
exec dbo.SalesByCategory 'Seafood', '1998'
exec dbo.SalesByCategory 'Seafood'
exec dbo.SalesByCategory @CategoryName='Seafood', @OrdYear= '1996'

select CompanyName, len(ContactName), ContactName,
c.Phone, left(ContactName, CHARINDEX(' ', Contactname)) as Fname, Substring(ContactName, CHARINDEX(' ', contactname) + 1, 50) as Lname
from customers c
union 
select CompanyName,len(ContactName), ContactName,
s.Phone, left(ContactName, CHARINDEX(' ', Contactname)) as Fname, Substring(ContactName, CHARINDEX(' ', contactname) + 1, 50) as Lname
from Suppliers s
union
select 'Northwind Traders',len(e.firstname + e.LastName), e.FirstName + e.LastName as FullName,Extension, e.FirstName, e.LastName
from Employees e

USE Northwind;

SELECT
	c.CompanyName,
	COUNT(o.OrderID) AS NumOrders,
	isnull(
	convert(varchar(20), 
	MIN(o.OrderDate), 
	106), 
	'No min Date') AS MinDate
FROM
	dbo.Customers AS c
LEFT JOIN
	dbo.Orders AS o
ON
	o.CustomerID = c.CustomerID
GROUP BY
	c.CompanyName
ORDER BY
	NumOrders
