declare @TotalDelegates int 

select @TotalDelegates = count(*) from dbo.Delegate

Print @totaldelegates


