with BourneCases as (
select courserunid, startdate from Trainer t
join CourseRun cr on t.TrainerID = cr.TrainerID
where TrainerName = 'Jason Bourne')
select d.DelegateID, d.DelegateName,CompanyName, startdate from DelegateAttendance da
join Delegate d on d.DelegateID = da.DelegateID
join BourneCases on BourneCases.CourseRunID = da.CourseRunID