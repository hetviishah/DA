create database Assessment_1;

use assessment_1;

select * from worker;

-- 1) Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME
-- Ascending and DEPARTMENT Descending. 

select * from worker 
order by firstname asc, department desc;

-- 2) Write an SQL query to print details for Workers with the first names “Vipul” and “Satish”
-- from the Worker table.

select * from worker
where firstname = "satish" or firstname = "vipul";

-- 3) Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘h’ and
-- contains six alphabets. 
select * from worker
where firstname like "%_____h%";

-- 4) Write an SQL query to print details of the Workers whose SALARY lies between 1
select * from worker 
where salary between 100000 and 200000;

-- 5) Write an SQL query to fetch duplicate records having matching data in some fields of a table. 
select  WorkerID, FirstName, LastName, Salary, JoiningDate, Department
from worker
group by WorkerID, FirstName, LastName, Salary, JoiningDate, Department
having count(*) > 1;

 -- 6) Write an SQL query to show the top 6 records of a table. 
select * from worker
limit 6;

-- 7)Write an SQL query to fetch the departments that have less than five people in them. 
select department,count(firstname) as worker_no from worker 
group by department 
having count(firstname) < 5;

-- 8) Write an SQL query to show all departments along with the number of people in there. 
select department,count(firstname) as total_workers from worker
group by department ;

-- 9) Write an SQL query to print the name of employees having the highest salary in each department.
 select firstname,department,salary from worker
 where (department,salary) in (
	select department,max(salary) from worker
	group by department );
