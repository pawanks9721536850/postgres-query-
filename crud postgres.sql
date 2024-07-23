CREATE TABLE person  
(
	id INT , 
	name VARCHAR(10) ,
	city VARCHAR(10)
);



insert into person ( id , name , city ) values ( 102 , 'anshika' , 'noida') , (103 , 'ashish' , 'pegasus');
insert into person values (104 , 'vaibhav' , 'jaipur');
select * from person ; 

update person 
set city = 'bangalore'
where id = 104 ;

delete from person 
where id = 104 ;


                                                                                                                                 