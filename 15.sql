#delete the procedure test if it exists.
DROP PROCEDURE IF EXISTS test3;

DELIMITER //
CREATE PROCEDURE test3 ()
BEGIN
    #declare variable sqlerr to store if there is an sql exception
   declare sqlerr tinyint default false;
    #declare variable handler to flag when duplicate value is inserted
   declare continue handler for 1062 set sqlerr = TRUE;
    #start transaction
    start transaction;
   delete from order_instruments where order_id in
       (select order_id from orders where musician_id=6);
   delete from orders where musician_id=6;
   delete from addresses where musician_id=6;
   delete from musicians where musician_id=6;
  
    if sqlerr=FALSE then
       commit;
         select 'Transaction Committed' as msg;
   else
        rollback;
        select 'Transaction rollbacked' as msg;
    end if;
    update orders set orders = orders where musician_id=3;
    update addresses set addresses = musician_id =3  where musician_id=6;
    update musicians set musicians = musician_id =3  where musician_id=6;
end //
delimiter ;

