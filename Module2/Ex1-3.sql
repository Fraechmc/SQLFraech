select vendorname, phonenumber, 'Vendor' as ContactType from Vendor
union all
select trainername, phonenumber, 'Trainer' as ContactType from Trainer

select DelegateID from DelegateAttendance da
join CourseRun cr on da.CourseRunID = cr.CourseRunID
join course c on cr.CourseID = c.CourseID
where CourseName = 'QATSQLPLUS'
intersect
select DelegateID from DelegateAttendance da
join CourseRun cr on da.CourseRunID = cr.CourseRunID
join course c on cr.CourseID = c.CourseID
where CourseName = 'QATSQL'

select DelegateID from DelegateAttendance da
join CourseRun cr on da.CourseRunID = cr.CourseRunID
join course c on cr.CourseID = c.CourseID
where CourseName = 'QATSQL'
except
select DelegateID from DelegateAttendance da
join CourseRun cr on da.CourseRunID = cr.CourseRunID
join course c on cr.CourseID = c.CourseID
where CourseName = 'QATSQLPLUS'

select DelegateID from DelegateAttendance da
join CourseRun cr on da.CourseRunID = cr.CourseRunID
join course c on cr.CourseID = c.CourseID
where CourseName = 'QATSQLPLUS'
except
select DelegateID from DelegateAttendance da
join CourseRun cr on da.CourseRunID = cr.CourseRunID
join course c on cr.CourseID = c.CourseID
where CourseName = 'QATSQL'