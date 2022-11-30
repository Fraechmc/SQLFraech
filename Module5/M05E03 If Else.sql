DECLARE @Vendor VARCHAR(100)
SET @Vendor = null -- 'QA'
if @vendor is not null 
begin
SELECT *
	FROM dbo.Course AS C
		INNER JOIN dbo.Vendor AS V
			ON C.VendorID = V.VendorID
	WHERE 
		VendorName = @Vendor
end
else
begin 
print 'Value is null'
end