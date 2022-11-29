go
create view dbo.courselist as (
select coursename, courseid, vendorname from course c
join vendor v on v.vendorid = c.vendorid
)
go
select * from dbo.courselist

