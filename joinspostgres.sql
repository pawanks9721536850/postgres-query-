-- Create Departments Table
CREATE TABLE Departments (
    department_id SERIAL PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL
);


-- Create Clients Table
CREATE TABLE Clients (
    client_id SERIAL PRIMARY KEY,
    client_name VARCHAR(100) NOT NULL,
    contact_email VARCHAR(100) UNIQUE NOT NULL
);

-- Create Projects Table
CREATE TABLE Projects (
    project_id SERIAL PRIMARY KEY,
    project_name VARCHAR(100) NOT NULL,
    client_id INT REFERENCES Clients(client_id)
);

-- Create Employees Table
CREATE TABLE Employees (
    employee_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone_number VARCHAR(15),
    hire_date DATE NOT NULL,
    department_id INT REFERENCES Departments(department_id),
    project_id INT REFERENCES Projects(project_id)
);

-- Create Salaries Table
CREATE TABLE Salaries (
    salary_id SERIAL PRIMARY KEY,
    employee_id INT REFERENCES Employees(employee_id),
    amount DECIMAL(10, 2) NOT NULL,
    effective_date DATE NOT NULL
);



select * from departments ;
insert into departments (department_id , department_name ) values ( 22 , 'java');
select * from employees ;

-- query for left join  
-- join query for listing the employees working in the given department of the left table  
select departments.department_name , employees.first_name from departments left join employees on departments.department_id = employees.department_id ; 

-- left join query on table employees and department 
-- for selecting names of the employees  who are working in which department 
select employees.first_name , employees.last_name , departments.department_name from employees left join departments  on employees.department_id = departments.department_id   ;



select * from salaries ;



--Show the names of employees and their salaries, including those who do not have salary records.
--Objective: Use a LEFT JOIN between the Employees and Salaries tables.
select employees.first_name , employees.last_name , salaries.amount from employees left join salaries on employees.employee_id = salaries.employee_id ;


--Find the average salary of employees in each department.
--Objective: Join the Employees, Departments, and Salaries tables, and use an aggregate function.
select  department_name ,avg(amount)  from employees join departments  on employees.department_id = departments.department_id 
join salaries on employees.employee_id = salaries.employee_id   group by department_name  ; 


--Retrieve all departments and the number of employees in each department.
--Objective: Join the Departments and Employees tables, and use aggregation to count employees per department.
select department_name , count ( employee_id )  from employees  full join departments  on employees.department_id = departments.department_id group by ( department_name );



