select VendorName, CourseName, NumberDelegates,
rank() over(order by numberdelegates desc) Rank1,
dense_rank() over(order by numberdelegates desc) Rank2,
row_number() over(order by numberdelegates desc) Rank3,
ntile(3) over(order by numberdelegates desc) Rank4
from VendorCourseDelegateCount

go
with ranked_Courses as (
select VendorName, CourseName, NumberDelegates,
rank() over(partition by vendorname order by numberdelegates desc ) Rank1
from VendorCourseDelegateCount
)
select VendorName, CourseName, NumberDelegates
from ranked_Courses
go