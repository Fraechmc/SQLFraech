
select * into #MicrosftLocal 
from dbo.Course
where vendorid in (2)

select * into ##MicrosftGlobal 
from dbo.Course
where vendorid in (2)

go
select * from ##MicrosftGlobal
select * from #MicrosftLocal
