--ex1 - errors could occur if stock is stock amount is exceeded by the amount being taken or null values entered

DECLARE @ProductID INT = 1
DECLARE @Amount INT = 1

IF (@ProductID IS NULL OR @Amount IS NULL)
	BEGIN;
		THROW 666666, 'Amount or ID is NULL',1
		RETURN
	END

BEGIN TRY
	BEGIN TRAN
		INSERT INTO dbo.BookTransfers VALUES 				                
				(@ProductID,getdate(),'Transfer Out',-@Amount)
		UPDATE dbo.BookStock
			SET StockAmount = StockAmount - @Amount
			WHERE ProductID = @ProductID	
	COMMIT TRAN
	print 'Success'
END TRY
BEGIN CATCH
	ROLLBACK TRAN;
	THROW 59999,'Amount is invalid',1
END CATCH
GO
