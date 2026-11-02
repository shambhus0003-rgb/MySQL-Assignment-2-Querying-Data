DROP DATABASE IF EXISTS employee;

CREATE DATABASE employee;

USE employee;

CREATE TABLE Departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE Location (
    location_id INT PRIMARY KEY AUTO_INCREMENT,
    location VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE Employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(100) NOT NULL,
    gender CHAR(1) CHECK (gender IN ('M', 'F')),
    age INT CHECK (age >= 18),
    hire_date DATE DEFAULT (CURRENT_DATE),
    designation VARCHAR(100),
    department_id INT,
    location_id INT,
    salary DECIMAL(10,2),

    FOREIGN KEY (department_id)
        REFERENCES Departments(department_id),

    FOREIGN KEY (location_id)
        REFERENCES Location(location_id)
);

INSERT INTO departments (department_id, department_name) VALUES
(1, 'Software Development'),
(2, 'Marketing'),
(3, 'Data Science'),
(4, 'Human Resources'),
(5, 'Product Management'),
(6, 'Content Creation'),
(7, 'Finance'),
(8, 'Design'),
(9, 'Research and Development'),
(10, 'Customer Support'),
(11, 'Business Development'),
(12, 'IT'),
(13, 'Operations');

INSERT INTO location (location) VALUES
('Chennai'),
('Bangalore'),
('Hyderabad'),
('Pune');

INSERT INTO employees (employee_id, employee_name, gender, age, hire_date, designation, department_id, location_id, salary) VALUES
(5001, 'Vihaan Singh', 'M', 27, '2015-01-20', 'Data Analyst', 3, 4, 60000),
(5002, 'Reyansh Singh', 'M', 31, '2015-03-10', 'Network Engineer', 12, 1, 80000),
(5003, 'Aaradhya Iyer', 'F', 26, '2015-05-20', 'Customer Support Executive', 10, 2, 45000),
(5004, 'Kiara Malhotra', 'F', 29, '2015-07-05', NULL, 8, 3, 70000),
(5005, 'Anvi Chaudhary', 'F', 25, '2015-09-11', 'Business Development Executive', 11, 1, 55000),
(5006, 'Dhruv Shetty', 'M', 28, '2015-11-20', 'UI Developer', 8, 2, 65000),
(5007, 'Anushka Singh', 'F', 32, '2016-01-15', 'Marketing Manager', 2, 3, 90000),
(5008, 'Diya Jha', 'F', 27, '2016-03-05', 'Graphic Designer', 8, 4, 70000),
(5009, 'Kiaan Desai', 'M', 30, '2016-05-20', 'Sales Executive', 11, 3, 55000),
(5010, 'Atharv Yadav', 'M', 29, '2016-07-10', 'Systems Administrator', 12, 4, 80000),
(5011, 'Saanvi Patel', 'F', 28, '2016-09-20', 'Marketing Analyst', 2, 1, 60000),
(5012, 'Myra Verma', 'F', 26, '2016-11-05', 'Operations Manager', 13, 2, 95000),
(5013, 'Arnav Rao', 'M', 33, '2017-01-20', 'Customer Success Manager', 10, 3, 75000),
(5014, 'Vihaan Mohan', 'M', 30, '2017-03-10', 'Supply Chain Analyst', 10, 2, 60000),
(5015, 'Ishaan Kumar', 'M', 27, '2017-05-20', 'Financial Analyst', 7, 1, 85000),
(5016, 'Zoya Khan', 'F', 31, '2017-07-05', 'Legal Counsel', 4, 4, 100000),
(5017, 'Kabir Nair', 'M', 28, '2017-09-11', 'IT Support Specialist', 12, 2, 80000),
(5018, 'Ishan Mishra', 'M', 25, '2017-11-20', 'Research Scientist', 9, 3, 75000),
(5019, 'Ishika Patel', 'F', 29, '2018-01-15', 'Talent Acquisition Specialist', 4, 4, 55000),
(5020, 'Aarav Nair', 'M', 32, '2018-03-05', 'Software Engineer', 1, 1, 90000),
(5021, 'Advik Kapoor', 'M', 26, '2018-05-20', 'Finance Analyst', 7, 3, 85000),
(5022, 'Aadhya Iyengar', 'F', 28, '2018-07-10', 'HR Specialist', 4, 4, 60000),
(5023, 'Anika Paul', 'F', 30, '2018-09-20', 'Public Relations Specialist', 2, 2, 70000),
(5024, 'Aryan Shetty', 'M', 27, '2018-11-05', 'Product Manager', 5, 1, 95000),
(5025, 'Avni Iyengar', 'F', 31, '2019-01-20', 'Data Scientist', 3, 4, 100000),
(5026, 'Vivaan Singh', 'M', 29, '2019-03-10', 'Business Analyst', 3, 2, 75000),
(5027, 'Ananya Paul', 'F', 32, '2019-05-20', 'Content Writer', 6, 3, 60000),
(5028, 'Anaya Kapoor', 'F', 26, '2019-07-05', 'Event Coordinator', 6, 1, 60000),
(5029, 'Arjun Kumar', 'M', 33, '2019-09-11', 'Quality Assurance Analyst', 12, 2, 80000),
(5030, 'Sara Iyer', 'F', 28, '2019-11-20', 'Project Manager', 5, 1, 90000);

SELECT COUNT(*) AS Total_Departments FROM Departments;

SELECT COUNT(*) AS Total_Locations FROM Location;

SELECT COUNT(*) AS Total_Employees FROM Employees;

SELECT * FROM Departments;
SELECT * FROM Location;
SELECT * FROM Employees;

--- Question 1: DISTINCT – Retrieve distinct salaries ----

SELECT DISTINCT salary
FROM Employees;
---- SELECT retrieves data.
---- DISTINCT removes duplicate values.
---- salary selects only the salary column.
---- FROM Employees specifies the table.

---- Question 2: ALIAS (AS) -----
SELECT
    age AS Employee_Age,
    salary AS Employee_Salary
FROM Employees;
--- AS gives a temporary name to a column.
--- age becomes Employee_Age.
--- salary becomes Employee_Salary.
--- Original table column names are not changed.

---- Question 3(a): WHERE clause and operators ----
SELECT *
FROM Employees
WHERE salary > 50000
AND hire_date < '2016-01-01';

--- WHERE filters records.
--- salary > 50000 selects salaries above ₹50,000.
--- AND means both conditions must be true.
--- hire_date < '2016-01-01' selects employees hired before 1 January 2016.

---- Question 3(b): Find missing designation and fill it ----
SELECT *
FROM Employees
WHERE designation IS NULL;

--- Now update the missing value:---
UPDATE Employees
SET designation = 'Data Scientist'
WHERE employee_id = 5004;

--- UPDATE modifies existing records.
--- SET specifies the new value.
--- WHERE identifies which employee should be updated.
--- IS NULL checks for missing values.

SELECT employee_id, employee_name, designation
FROM Employees
WHERE employee_id = 5004;

---- Part B – Sorting and Grouping Data ----
---- Question 4: ORDER BY ----
SELECT employee_id, employee_name,
       department_id, salary
FROM Employees
ORDER BY department_id ASC, salary DESC;

--- ORDER BY sorts records.
--- ASC means ascending (smallest to largest).
--- DESC means descending (largest to smallest).
--- First, employees are sorted by department ID.
--- Within each department, the highest salary appears first

---- Question 5: LIMIT ----
SELECT employee_id, employee_name, hire_date
FROM Employees
WHERE YEAR(hire_date) = 2018
ORDER BY hire_date ASC
LIMIT 5;

--- YEAR(hire_date) extracts the year from the date.
--- WHERE selects employees hired in 2018.
--- ORDER BY hire_date ASC sorts by joining date.
--- LIMIT 5 displays only five records.

---- Question 6(a): Aggregate function – SUM ----
SELECT SUM(e.salary) AS Total_Finance_Salary
FROM Employees e
JOIN Departments d
ON e.department_id = d.department_id
WHERE d.department_name = 'Finance';

--- SUM() calculates the total.
--- JOIN connects Employees and Departments.
--- ON specifies the matching department IDs.
--- WHERE selects Finance department employees.

---- Question 6(b): Aggregate function – MIN ----
SELECT MIN(age) AS Minimum_Age
FROM Employees;

--- MIN() returns the smallest value.
--- age specifies the column to check.

----- Question 7(a): GROUP BY – Maximum salary for each location ----
SELECT l.location,
       MAX(e.salary) AS Maximum_Salary
FROM Employees e
JOIN Location l
ON e.location_id = l.location_id
GROUP BY l.location;

--- MAX() finds the highest salary.
--- GROUP BY groups employees by location.
--- JOIN retrieves location names from the Location table


---- Question 7(b): GROUP BY – Average salary for Analyst designations ----
SELECT designation,
       AVG(salary) AS Average_Salary
FROM Employees
WHERE designation LIKE '%Analyst%'
GROUP BY designation;

--- LIKE searches for matching text patterns.
--- %Analyst% means the word Analyst can appear anywhere in the designation.
--- AVG() calculates average salary.
--- GROUP BY designation calculates a separate average for each designation.

---- Question 8(a): HAVING – Departments with fewer than 3 employees ----
SELECT d.department_name,
       COUNT(e.employee_id) AS Total_Employees
FROM Departments d
LEFT JOIN Employees e
ON d.department_id = e.department_id
GROUP BY d.department_id, d.department_name
HAVING COUNT(e.employee_id) < 3;

--- COUNT() counts employees.
--- LEFT JOIN includes departments even when they have no employees.
--- GROUP BY creates groups department-wise.
--- HAVING filters grouped results.
--- < 3 selects departments with 0, 1 or 2 employees.

---- Question 8(b): HAVING – Locations with female employees whose average age is below 30 ----
SELECT l.location,
       AVG(e.age) AS Average_Age
FROM Employees e
JOIN Location l
ON e.location_id = l.location_id
WHERE e.gender = 'F'
GROUP BY l.location_id, l.location
HAVING AVG(e.age) < 30;

--- WHERE e.gender = 'F' selects female employees only.
--- AVG(e.age) calculates their average age.
--- GROUP BY groups female employees by location.
--- HAVING selects locations with an average age below 30

---- Part C – JOINS ----
---- Question 9(a): INNER JOIN ----
SELECT
    e.employee_name,
    e.designation,
    d.department_name
FROM Employees e
INNER JOIN Departments d
ON e.department_id = d.department_id;

--- INNER JOIN returns matching records from both tables.
--- e is an alias for Employees.
--- d is an alias for Departments.
--- ON connects the tables through department_id.


---- Question 9(b): LEFT JOIN ----
SELECT
    d.department_name,
    COUNT(e.employee_id) AS Total_Employees
FROM Departments d
LEFT JOIN Employees e
ON d.department_id = e.department_id
GROUP BY d.department_id, d.department_name;

--- LEFT JOIN returns all records from the left table (Departments).
--- Matching employee records are displayed.
--- If a department has no employees, its count is 0.
--- COUNT(e.employee_id) avoids counting NULL employee IDs

----- Question 9(c): RIGHT JOIN -----
SELECT
    l.location,
    e.employee_name
FROM Employees e
RIGHT JOIN Location l
ON e.location_id = l.location_id
ORDER BY l.location_id, e.employee_name;

--- RIGHT JOIN returns all records from the right table (Location).
--- Matching employee names are displayed.
--- If no employee belongs to a location, employee name will be NULL.
--- ORDER BY sorts the output by location.