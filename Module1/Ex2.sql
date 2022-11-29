go
create function udf_DelegateDay() returns table
as
return
select d.DelegateID, sum(durationdays) DelegateDays, count(*) DelegateCorses  from Delegate d
join DelegateAttendance da on d.DelegateID = da.DelegateID
join CourseRun c on c.CourseRunID = da.CourseRunID
group by d.DelegateID
go

select * from udf_DelegateDay()

go
alter function udf_IndividualDelegateDays(@DelegateID int) returns table
as
return
select d.DelegateID, sum(durationdays) DelegateDays, count(*) DelegateCorses  from Delegate d
join DelegateAttendance da on d.DelegateID = da.DelegateID
join CourseRun c on c.CourseRunID = da.CourseRunID
where d.DelegateID = @DelegateID
group by d.DelegateID
go

select * from udf_IndividualDelegateDays(1)