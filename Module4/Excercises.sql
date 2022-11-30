go
select * from
(
select vendorname, coursename, startdate, numberDelegates 
from dbo.VendorCourseDateDelegateCount
) as BaseData
Pivot
(
sum(numberDelegates) for vendorname in (QA, Microsft, Oracle)
) as Pivotted
go

select vendorname, coursename, startdate, sum(numberDelegates)
from VendorCourseDateDelegateCount
group by VendorName, CourseName, StartDate with rollup

select vendorname, coursename, startdate, sum(numberDelegates),
GROUPING_ID(VendorName, CourseName, StartDate ) Groupingtype
from VendorCourseDateDelegateCount
group by 
grouping sets
(
VendorName, 
(VendorName, CourseName),
(VendorName, CourseName, StartDate )
)

