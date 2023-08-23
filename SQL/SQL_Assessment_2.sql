create database Assessment_2;

use assessment_2;

-- 1)  To display all the records form STUDENT table.
select * from studentrecords;

-- 2) To display any name and date of birth from the table STUDENT.
select stdname,dob from studentrecords;

-- 3) To display all students record where percentage is greater of equal to 80 FROM student table
select * from studentrecords
where percentage >= 80;

-- 4) To display student name, stream and percentage where percentage of student is more than 80
select stdname,stream,percentage from studentrecords
where percentage > 80;

-- 5) To display all records of science students whose percentage is more than 75 form student table. 
select * from studentrecords 
where stream = "science" and percentage > 75;

