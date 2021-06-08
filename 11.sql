

DROP PROCEDURE IF EXISTS must_watch_movie;
DELIMITER //
CREATE  procedure must_watch_movie()
BEGIN

Declare no_records int default false;
Declare a varchar(45);
Declare b varchar(45);
declare c int;
declare data_customers varchar(1000) default "";




DECLARE cur1 CURSOR 
FOR select title,Distributor,extract(year from release_date)
from movies 
where gross>2
order by title asc;




DECLARE CONTINUE HANDLER FOR NOT FOUND 
SET no_records = TRUE;

open cur1;

while no_records = false do
fetch cur1 into a,b,c;
set data_customers = concat(data_customers,a,",", b,",",c, "  |    ");
end while;
close cur1;
SELECT data_customers AS 'data';

end;
			



 