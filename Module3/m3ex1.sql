
select b.ProductID, TransferDate, TransferAmount
from dbo.BookTransfers b

select productid, sum(transferamount) Stock 
from BookTransfers
group by ProductID

select productid, transferdate, TransferAmount, 
sum(TransferAmount) over(partition by productid order by transferdate) runningstock
from BookTransfers
order by ProductID,TransferDate asc


