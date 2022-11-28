select * from dbo.Products
where Discontinued = 0 
and categoryid = 1
and unitprice >= 40

select * from dbo.Orders
where CustomerID in ('ALFKI','ERNSH', 'SIMOB')
and OrderDate between '1997-08-01' and '1997-09-01'

select top 15 with ties * from dbo.Customers
where ContactTitle like '%sales%'

select * from dbo.Customers
where fax is null

