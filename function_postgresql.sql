select * from products ;

select count(category_id)  from products group by category_id ;


--pattern matching with  %=any number of character before or after 
select * from products where product_name LIKE 'B%' ;

--pattern matching with _= only that many characters that _(underscores) are used in the query 
select product_name from products where product_name LIKE '_a%'

-- use of limit 
select * from products limit 2 ;	

-- use of limit and offset 
select * from products limit 10 offset 3 ;

-- use of fetch clause 
select * from products fetch first 3 rows only ;


-- use of fetch clause with offset 
select * from products offset 2 fetch first 2 rows only ;


create or replace function give_total_price ( )
returns integer
language plpgsql 
as 
$$
declare 
   totalprice integer ;
begin 
 select sum(price) into totalprice  from products where price > 100 ;
 return  totalprice ;
end; 
$$ ;

