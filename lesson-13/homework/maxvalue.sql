

---------------------------------------------Homework 13--------------------------------------------


--Puzzle 2. Write a query which will find maximum value from multiple columns of the table

--table DDL

--create table TestMax
--(  
--    Year1 int
--	,Max1 int
--	,Max2 int
--	,Max3 int
--);

--insert into TestMax
--values 
--        (2001, 10, 101, 87)
--		,(2002, 103, 19, 88)
--		,(2003, 21, 23, 89)
--		,(2004, 27, 28, 91)
--; 
select * from TestMax

select year1, 
          case when Max1 >= Max2 and Max1 >= Max3 then Max1
		       when Max2 >= Max1 and Max2 >= Max3 then Max2
			   else Max3
			   end as Maxvalue
from TestMax

--Puzzle 5.
--In this puzzle you have to find employees and their managers with their hierarchy. 
--Please check out the sample input and expected output for details.

--Table DDL:
CREATE TABLE Employees
(EmpID INT, EmpName VARCHAR(20), ReportsTo INT)
 
--Insert Data
INSERT INTO Employees(EmpID, EmpName, ReportsTo)
SELECT 1, 'Jacob', NULL UNION ALL
SELECT 2, 'Rui', NULL UNION ALL
SELECT 3, 'Jacobson', NULL UNION ALL
SELECT 4, 'Jess', 1 UNION ALL
SELECT 5, 'Steve', 1 UNION ALL
SELECT 6, 'Bob', 1 UNION ALL
SELECT 7, 'Smith', 2 UNION ALL
SELECT 8, 'Bobbey', 2 UNION ALL
SELECT 9, 'Steffi', 3 UNION ALL
SELECT 10, 'Bracha', 3 UNION ALL
SELECT 11, 'John', 5 UNION ALL
SELECT 12, 'Michael', 6 UNION ALL
SELECT 13, 'Paul', 6 UNION ALL
SELECT 14, 'Lana', 7 UNION ALL
SELECT 15, 'Johnson', 7 UNION ALL
SELECT 16, 'Mic', 8 UNION ALL
SELECT 17, 'Stev', 8 UNION ALL
SELECT 18, 'Paulson', 9 UNION ALL
SELECT 19, 'Jessica', 10

select * from Employees;

with cte as (
   select EmpId, EmpName, ReportsTo
   from Employees
   where ReportsTo is null
union all
   select e.EmpId, e.EmpName, e.ReportsTo
   from Employees e 
   join cte c on e.ReportsTo = c.EmpId
)
select * from cte


