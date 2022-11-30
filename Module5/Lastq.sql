DECLARE @Vendor VARCHAR(100)
SET @Vendor =  'QA'
if @Vendor is null
begin 
print 'Value is null'
end
else  if not exists (select * from dbo.Vendor where VendorName = @Vendor)
print 'Value does not Exist'
else
begin
SELECT *
	FROM dbo.Course AS C
		INNER JOIN dbo.Vendor AS V
			ON C.VendorID = V.VendorID
	WHERE 
		VendorName = @Vendor
end
