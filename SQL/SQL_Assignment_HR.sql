create database HR;
use hr;
select * from employee;
select * from department;

-- 1) Display all information in the tables EMP and DEPT.
select * from employee 
full join department;

-- 2) Display only the hire date and employee name for each employee.
select hiredate , empname from employee;

-- 3) Display the ename concatenated with the job ID, 
-- separated by a comma and space, and name the column Employee and Title
select empname,jobid,concat_ws(" , ",empname,jobid) as 'Employee and Title'
from employee;

-- 4) Display the hire date, name and department number for all clerks.
select hiredate,empname,deptno from employee
inner join department 
on department.deptid = employee.empid
where jobrole = 'clerk';

-- 5) Create a query to display all the data from the EMP table. 
-- Separate each column by a comma. Name the column THE OUTPUT
SELECT concat_ws(" , ",empid,empname,emplastname,jobid,jobrole,managername,managerid,hiredate,salary,commission,city) as output FROM employee ;

-- 6) Display the names and salaries of all employees with a salary greater than 2000.
select empname,salary from employee where salary >2000;

-- 7) Display the names and dates of employees with the column headers "Name" and "StartDate"
select empname as Name , hiredate as StartDate from employee;

-- 8) Display the names and hire dates of all employees in the order they were hired.
select empname,hiredate from employee order by hiredate;

-- 9) Display the names and salaries of all employees in reverse salary order.
select empname,salary from employee order by salary desc;

-- 10) Display 'ename" and "deptno"” who are all earned commission and display salary in reverse order. 
select empname,deptno,salary from employee
cross join department on department.deptid = employee.empid
where commission is not null 
order by salary desc;

-- 11) Display the last name and job title of all employees who do not have a manager
select emplastname,jobrole from employee
where managerid is null;

-- 12) Display the last name, job, and salary for all employees whose job is sales representative
 -- or stock clerk and whose salary is not equal to $2,500, $3,500, or $5,000
 select empname,emplastname,jobrole,salary from employee
 where (jobrole = 'sales' or jobrole = 'clerk' )
 and salary not in (2500,3500,5000);
 
								-- NEW QA --
 
 -- 1) Display the maximum, minimum and average salary and commission earned
 SELECT MIN(SALARY) AS min_salary,MIN(COMMISSION) as min_commission ,
 max(salary) as max_salary, max(commission) as max_commission,
 avg(salary) as avg_salary , avg(commission) as avg_commission
 from employee;
 
 -- 2)  Display the department number, total salary payout and total commission payout for each department.
 select department.deptname,sum(employee.salary) as total_salary,
 sum(employee.commission) as total_commission from department
 join employee on department.deptid = employee.empid 
 group by department.deptname;
 
 -- 3) Display the department number and number of employees in each department.
select department.deptname,count(employee.empname) from employee
join department on department.deptid = employee.empid 
 group by department.deptname;
 
 -- 4) Display the department number and total salary of employees in each department.
select deptname,sum(salary) as total_salary from employee
cross join department on department.deptid = employee.empid
group by deptname;

-- 5) Display the employee's name who doesn't earn a commission. Order the result set without using the column name
select empname,commission from employee
where commission = 0;

-- 6) Display the employees name, department id and commission. If an Employee doesn't
-- earn the commission, then display as 'No commission’. Name the columns appropriately
SELECT
    employee.empname,
    department.deptid,
    CASE
        WHEN employee.commission > 0 THEN employee.commission
        ELSE 'No commission'
    END AS commission
FROM
    employee 
LEFT JOIN
    department  ON employee.empid = department.deptid;
    
-- 7) Display the employee's name, salary and commission multiplied by 2. [f an Employee
-- doesn't earn the commission, then display as 'No commission. Name the columns appropriately
SELECT
    empname,salary,
    CASE
        WHEN commission > 0 THEN commission * 2 
        ELSE 'No commission'
    END AS commission
FROM employee ;

-- 8) Display the employee's name, department id who have the first name same as another
-- employee in the same department


-- 9) Display the sum of salaries of the employees working under each Manager.
select sum(salary),managername from employee
group by managername;

-- 10) Select the Managers name, the count of employees working under and the departmentID of the manager.
select employee.managername,count(employee.empname),department.deptname from
department join employee on department.deptid = employee.empid
group by department.deptname;

-- 11) Select the employee name, department id, and the salary. Group the result with the
-- manager name and the employee last name should have second letter 'a'
select employee.empname,department.deptid,employee.salary,managername from
employee join department on department.deptid = employee.empid
where employee.managername like '_a%' and employee.emplastname like '_a%';

-- 12)  Display the average of sum of the salaries and group the result with the department id.
-- Order the result with the department id.


-- 13) Select the maximum salary of each department along with the department id
select max(employee.salary),department.deptname from employee
join department on department.deptid = employee.empid
group by department.deptname;

-- 14) Display the commission, if not null display 10% of salary, if null display a default value 1
select empname,salary,
case
when commission > 0 then salary * 0.1
else '1'
end as commission
from employee;

									-- NEW QA --
                                    
-- 1) Write a query that displays the employee's last names only from the string's 2-5th
-- position with the first letter capitalized and all other letters lowercase, Give each column an appropriate label.
select substring(emplastname,2,4) as substring_2_4
from employee; 

-- 2) Write a query that displays the employee's first name and last name along with a" in
-- between for e.g.: first name : Ram; last name : Kumar then Ram-Kumar. Also displays the
-- month on which the employee has joined.
select empname,emplastname,concat_ws("-",empname,emplastname)as full_name,
 date_format(HIREDATE,"%M") as month_joined 
from employee ;

-- 3) Write a query to display the employee's last name and if half of the salary is greater than
-- ten thousand then increase the salary by 10% else by 11.5% along with the bonus amount of
-- 1500 each. Provide each column an appropriate label.
select empname,salary,
case 
when salary / 2 > 10000 then salary*0.1
else salary * 0.115 + 1500
end as salary_increament
from employee;


-- 4)  Display the employee ID by Appending two zeros after 2nd digit and 'E' in the end,
-- department id, salary and the manager name all in Upper case, if the Manager name
-- consists of 'z' replace it with '$!

select concat(substring(empid,1,2),'00',substring(empid,4),'E') as new_empid,
upper(salary) as new_salary,
replace(upper(managername),'Z','$') as new_managername
FROM(
	SELECT 
    empid,salary,managername 
    from
    employee
    where
    managerid is not null
    )
as new_data;

-- 5) Write a query that displays the employee's last names with the first letter capitalized and
-- all other letters lowercase, and the length of the names, for all employees whose name
-- starts with J, A, or M. Give each column an appropriate label. Sort the results by the employees’ last names

select concat(upper(substring(emplastname,1,1)),lower(substring(emplastname,2)))
as updated_name,
length(emplastname) as name_length
from
employee
where 
emplastname like 'J%' OR emplastname like 'A%' OR emplastname like 'M%'
ORDER BY
emplastname;

-- 6) Create a query to display the last name and salary for all employees. Format the salary to
-- be 15 characters long, left-padded with $. Label the column SALARY

select emplastname,concat('$',LPAD(FORMAT(salary,0),15,'$')) as SALARY 
from employee;
 # HERE (SALARY,2) salary value with two decimal places. 
 # The 2 specifies the number of decimal places. IF YOU DONT WANT DECIMAL WRITE 0.
 
 -- 7) Display the employee's name if it is a palindrome
 select empname
 from employee 
 where empname = reverse(empname);
 
 -- 8) Display First names of all employees with initcaps. 
 select concat(upper(substring(empname,1,1)),lower(substring(empname,2)))
 as initcaps_names
 from employee;
 
 
 -- 9) From LOCATIONS table, extract the word between first and second space from the
-- STREET ADDRESS column.


-- 10) Extract first letter from First Name column and append it with the Last Name. Also add
-- "@systechusa.com" at the end. Name the column as e-mail address. All characters should
-- be in lower case. Display this along with their First Name.

select concat(lower(substring(empname,1,1)),
	   lower(emplastname),"@systechusa.com") as EMAIL_address , empname
from employee;

-- 11) Display the names and job titles of all employees with the same job as sales.
select empname,jobrole from employee
where jobrole = 'sales'; 

-- 12) Display the names and department name of all employees working in the same city as ahmedabad.
select employee.empname,department.deptname,employee.city from employee
left join department on employee.empid = department.deptid
where employee.city = 'surat';

-- 13) Display the name of the employee whose salary is the lowest.
select empname,salary from employee
where salary = (select min(salary) from employee);

-- 14) Display the names of all employees except the lowest paid.
select empname,salary from employee
where not salary = (select min(salary) from employee); 

									-- NEW QA -- 
-- 1) Write a query to display the last name, department number, department name for all employees.
SELECT emplastname,deptno,deptname from employee
join department on employee.empid = department.deptid
group by deptno;

-- 2) Create a unique list of all jobs that are in department 4. Include the location of the department in the output. 
select jobrole,deptno from employee 
join department on employee.empid = department.deptid
where deptno = 4;

-- 3) Write a query to display the employee last name,department name,location id and city of
-- all employees who earn commission.
select empname,emplastname,deptname,city,commission from employee
join department on employee.empid = department.deptid
where commission is not null;

-- 4) Display the employee last name and department name of all employees who have an 'a’ in their last name
select empname,emplastname,deptname from employee
join department on employee.empid = department.deptid
where emplastname like '%a';

-- 5) Write a query to display the last name,job,department number and department name for
-- all employees who work in surat.
select empname,emplastname,jobrole,deptno,deptname,city from employee
join department on employee.empid = department.deptid
where city = 'surat';

-- 6) Display the employee last name and employee number along with their manager's last
-- name and manager number.
select emplastname,empid,managerid,managername from employee
where managername is not null;

-- 7) Display the employee last name and employee number along with their manager's last
-- name and manager number (including the employees who have no manager).
select emplastname,empid,managerid,managername from employee;

-- 8) Create a query that displays employees last name,department number,and all the
-- employees who work in the same department as a given employee.
select empname,emplastname,deptno,deptname from employee
join department on employee.empid = department.deptid
group by deptno;

-- 9)Create a query that displays the name,job,department name,salary,grade for all
-- employees. Derive grade based on salary(>=50000=A, >=30000=B,<30000=C)
select empname,jobrole,deptname,salary,
	CASE
    WHEN salary >= 50000 THEN 'A'
    WHEN salary >= 30000 THEN 'B'
    WHEN salary < 30000 THEN 'C'
    ELSE 'NA'
    END AS 'GRADE'
FROM employee left join department on employee.empid = department.deptid;

-- 10) Display the names and hire date for all employees who were hired before their
-- managers along withe their manager names and hire date. Label the columns as Employee
-- name, emp_hire_date,manager name,man_hire_date
select empname as Employee_Name,
hiredate as Hire_Date,
managername as Manager_Name,
managerhiredate as Man_Hire_Date
from employee 
where hiredate < managerhiredate;

									-- NEW QA --
-- 1) Write a query to display the last name and hire date of any employee in the same department as SALES.
select empname,emplastname,hiredate from employee
where jobrole = 'sales';

-- 2) Create a query to display the employee numbers and last names of all employees who
-- earn more than the average salary. Sort the results in ascending order of salary.
select empid,empname,emplastname,salary from employee
where salary > (select avg(salary) from employee)
order by salary;
select avg(salary) from employee;

-- 3) Write a query that displays the employee numbers and last names of all employees who
-- work in a department with any employee whose last name contains a 'u'
select empname,emplastname,employeename,employeelastname from employee
join department on employee.empid = department.deptid
where employeelastname like '%u%';

-- 4) Display the last name, department number, and job ID of all employees whose
-- department location is ATLANTA.
select empname,deptno,deptlocation,jobid,jobrole from employee
join department on employee.empid = department.deptid
where deptlocation = 'ATLANTA';

-- 5) Display the last name and salary of every employee who reports to FILLMORE.(managerlastname)
select empname,salary from employee
where managerlastname = 'fillmore';

-- 6) Display the department number, last name, and job ID for every employee in the
-- OPERATIONS department.
select deptno,deptname,empname,jobid from employee
join department on employee.empid = department.deptid
where deptname = 'operations';

-- 7) Modify the above query to display the employee numbers, last names, and salaries of all
-- employees who earn more than the average salary and who work in a department with any
-- employee with a 'u'in their name.
select empid,empname,salary,employeename from employee 
join department on employee.empid = department.deptid
where salary > (select avg(salary) from employee) and 
employeename like '%u';

-- 8) Display the names of all employees whose job title is the same as anyone in the sales dept.
select empname,jobrole from employee
where jobrole = 'sales';

-- 9) Write a compound query to produce alist of employees showing raise percentages,
-- employee IDs, and salaries. Employees in department 1 and 3 are given a 5% raise,
-- employees in department 2 are given a 10% raise, employees in departments 4 and 5 are
-- given a 15% raise, and employees in department 6 are not given a raise.
select empname,salary,deptno,deptname,
	CASE
    WHEN deptno IN (1,3) THEN  '5%'
	WHEN deptno = 2 Then  '10%'
    WHEN deptno IN (4,5) THEN '15%'
    WHEN deptno = 6 THEN 'NO RAISE'
    ELSE 'NA'
    END AS 'RAISE_PERCENTAGE'
FROM employee join department on employee.empid = department.deptid
group by deptno;

-- 10) Write a query to display the top three earners in the EMPLOYEES table. Display their last names and salaries.
select empname,salary from employee
order by salary desc 
limit 3;

-- 11) Display the names of all employees with their salary and commission earned. Employees
-- with a null commission should have O in the commission column
select empname,salary,COALESCE(Commission, 0) AS Commission from employee;
#  COALESCE function to display the commission value if it's not null, and if it is null, we display '0' instead.

-- 12) Display the Managers (name) with top three salaries along with their salaries and department information.
 
select managername,managersalary,deptname from employee 
join department on employee.empid = department.deptid
order by managersalary desc
limit 3;

								-- DATE FUNCTION --
-- 1) Find the date difference between the hire date and resignation_date for all the
-- employees. Display in no. of days, months and year(1 year 3 months 5 days).
select empname,hiredate,resignation_date_emp,
datediff(resignation_date_emp,hiredate) as DateDiffInDays,
concat(
FLOOR(datediff(resignation_date_emp,hiredate) / 365 )," ",'YEAR ',
FLOOR((datediff(resignation_date_emp,hiredate) % 365 ) / 30) ," ", 'MoNTHS ',
datediff(resignation_date_emp,hiredate) % 30 ," ",'DAYS') AS DateFormated 
from employee;

-- 2) Format the hire date as mm/dd/yyyy(09/22/2003) and resignation_date as mon dd,
-- yyyy(Aug 12th, 2004). Display the null as (DEC, 01th 1900)
select hiredate,date_format(hiredate,"%m/%d/%y") AS formated_hire,
resignation_date_emp,date_format(resignation_date_emp,"%M %D, %Y") as formated_resignation
FROM EMPLOYEE;

-- 3) Calcuate experience of the employee till date in Years and months(example 1 year and 3 months)
select empname,
concat(
	floor(datediff(resignation_date_emp,hiredate) / 365)," ","Years"," and ",
    floor((datediff(resignation_date_emp,hiredate) % 365 ) / 30 )," ","Months"
) as Employee_Experience
from employee;

-- 4)  Display the count of days in the previous quarter

-- 5)  Fetch the previous Quarter's second week's first day's date

-- 6) Fetch the financial year's 15th week's dates (Format: Mon DD YYYY)

-- 7) Find out the date that corresponds to the last Saturday of January, 2015 using with clause.


