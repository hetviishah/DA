create database Project_TMA;
USE PROJECT_TMA;

describe Project_TMA.tma;

select * from tma;

SHOW COLUMNS FROM tma;

alter table tma modify column Company_Name varchar(25);
alter table tma modify column Product_Name varchar(25);
alter table tma modify column Product_Category varchar(25);
alter table tma modify column Technology_Type varchar(30);
alter table tma modify column Market_Segment varchar(25);
alter table tma modify column Industry_Focus varchar(25);
alter table tma modify column Country varchar(15);
alter table tma modify column City varchar(15);
alter table tma modify column Partnership_Status varchar(30);



-- 1) Retrieve all columns for companies based in the India.
SELECT * FROM tma WHERE Country = 'USA';

-- 2) Find companies with a Customer Satisfaction Index above 4.5
select Company_Name,Customer_Satisfaction_Index from tma
where Customer_Satisfaction_Index > 4.5; 

-- 3) Count the number of companies in the "Technology" industry focus.
select count(*) from tma
where industry_focus = 'Medical';

-- 4) Display the average R&D expenditure for companies in the "Technology" product category.
select avg('R&D_Expenditure(Millions)') from tma 
where Product_Category = 'Technology';

-- 5) Retrieve companies founded after 2010.
SELECT * FROM tma WHERE Year_Founded > 2010;

-- 6) Get the total market share for companies in Canada.
SELECT SUM(Market_Share(Percentage)) FROM tma WHERE Country = 'Canada';

-- 7) Find companies with a partnership status of "Strategic."
SELECT * FROM tma WHERE Partnership_Status = 'Strategic';

-- 8) List companies in the "Telecommunication" market segment.
SELECT * FROM tma WHERE Market_Segment = 'Telecommunication';

-- 9) Display the maximum number of employees in any company.
SELECT MAX(Number_of_Employees) FROM tma;

-- 10) Find companies headquartered in cities starting with 'S.'
SELECT City FROM tma WHERE City LIKE 'S%';

-- 11) Count the number of active partnerships.
SELECT COUNT(*) FROM tma WHERE Partnership_Status = 'Active';

-- 12) Calculate the average revenue for companies in Germany.
SELECT AVG(Revenue(Millions)) FROM tma WHERE Country = 'Germany';

-- 13) Retrieve companies with a technology type of "Blockchain."
SELECT * FROM tma WHERE Technology_Type = 'Blockchain';

-- 14) List companies in the "EdTech" industry focus based in Australia.
SELECT * FROM tma WHERE Industry_Focus = 'EdTech' AND Country = 'Australia';

-- 15) Display the minimum revenue in the dataset.
SELECT MIN(Revenue(Millions)) FROM tma;

-- 16) Find companies with more than 1000 employees.
SELECT * FROM tma WHERE Number_of_Employees > 1000;

-- 17) Count the number of companies in the "Aerospace" industry.
SELECT COUNT(*) FROM tma WHERE Industry_Focus = 'Aerospace';

-- 18) Retrieve companies with a revenue between 100 and 150 million.
SELECT * FROM tma WHERE Revenue(Millions) BETWEEN 100 AND 150;

-- 19) Calculate the average Customer Satisfaction Index for companies in the "Financial Services" industry.
SELECT AVG(Customer_Satisfaction_Index) FROM tma WHERE Industry_Focus = 'Financial Services';

-- 20) Retrieve companies with a market share greater than 10%
SELECT * FROM tma WHERE Market_Share(Percentage) > 10;

-- 21) Retrieve companies with the highest revenue
SELECT * FROM tma ORDER BY Revenue(Millions) DESC LIMIT 1;

-- 22) Retrieve companies with the lowest customer satisfaction index
SELECT * FROM tma ORDER BY Customer_Satisfaction_Index ASC LIMIT 1;

-- 23) Retrieve the companies founded in or after 2010 with a market share above 5%
SELECT * FROM tma WHERE Year_Founded >= 2010 AND Market_Share(Percentage) > 5;

-- 24) Get the total revenue for the industry in the USA
SELECT SUM(`Revenue(Millions)`) FROM tma WHERE Country = 'USA';

-- 25) Get the average number of employees
SELECT AVG(Number_of_Employees) FROM tma;



















