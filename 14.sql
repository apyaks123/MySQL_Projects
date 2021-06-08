
DROP PROCEDURE IF EXISTS test2;

DELIMITER //
CREATE PROCEDURE test2 ()
BEGIN
   #declare variable order_id
    declare order_id int(11);
    #declare variable sqlerr to store if there is an sql exception
   declare sqlerr tinyint default false;
    #declare variable handler to flag when duplicate value is inserted
   declare continue handler for 1062 set sqlerr = TRUE;
    #start transaction
    start transaction;
   INSERT INTO orders VALUES(DEFAULT, 3, NOW(), '10.00', '0.00', NULL, 4,
    'American Express', '378282246310005', '04/2013', 4);
   SELECT LAST_INSERT_ID() INTO order_id;
   INSERT INTO order_instruments VALUES(DEFAULT, order_id, 6, '415.00', '161.85', 1);
   INSERT INTO order_instruments VALUES(DEFAULT, order_id, 1, '699.00', '209.70', 1);
   if sqlerr=FALSE then
       commit;
         select 'Transaction Committed' as msg;
   else
        rollback;
        select 'Transaction rollbacked' as msg;
    end if;
end //
delimiter ;

call test2();