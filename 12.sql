CREATE PROCEDURE RenameProcedure()
BEGIN
BEGIN TRY
       BEGIN TRANSACTION;
UPDATE Invoices
       SET vendor_id=101
       WHERE vendor_name='United Parcel Service' or vendor_name='Federal Express Corporation';
  
       UPDATE Invoices
       SET vendor_name='FedUP'
       WHERE vendor_name='United Parcel Service';
  

       DELETE Invoices
       WHERE vendor_name='Federal Express Corporation' ;
       
       COMMIT TRANSACTION;
END TRY


BEGIN CATCH
       
ROLLBACK TRANSACTION;
END CATCH


END;