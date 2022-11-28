select * from dbo.Products

select ProductID,ProductName,UnitPrice,UnitsInStock,UnitPrice*UnitsInStock currentValue,(UnitsOnOrder+UnitsInStock)*UnitPrice futureValue from dbo.Products