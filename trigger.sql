create trigger tg 
after update
on products 
for each row execute function insertInprices() ;

CREATE OR REPLACE FUNCTION insertInprices()
RETURNS TRIGGER AS $$
BEGIN

    INSERT INTO prices (difference )
    VALUES (15);

    RETURN NEW; 
END;
$$ language plpgsql;



update products set price =  30 where price = 350 ; 

create table prices ( 
	pid Serial , 
	difference int 
	);
select * from prices ;

select * from products ;