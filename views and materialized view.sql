select * from employees;
 
select * from salaries ;
 
 
--creating view for one table 
create view employeeView as 
select * from employees 
where department_id > 15 ;
 
--executing the view - employeeView 
select * from employeeView ;
 
 
-- creating view from two table using employees table and salaries table 
-- to retrieve the amount of salaries 
create view empsalView as
select e.employee_id , first_name , last_name , amount from employees e , salaries s
where e.employee_id = s.employee_id and e.employee_id > 10 ;

--executing the view -empsalView 
select * from empsalView ;


select * from employees ;

--creating a materialized view 
create materialized view mv_employeeslist as 
select  employee_id , first_name , last_name from employees
with data ;

-- quering the materialized view 
select * from mv_employeeslist ;

-- inserting a new row in employees table to check refresh of materialized view 
insert into employees ( employee_id , first_name , last_name , email , phone_number , hire_date , department_id , project_id ) values 
( 26, 'pawan' , 'kumar singh' , 'pawan.singh@techcompany.in' , '9721536' , '2024-06-03', 1 , 1 ) ;

refresh materialized view mv_employeeslist  ;

select * from mv_employeeslist ;
