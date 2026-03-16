create database company_db;
 
 use company_db;
 
 create table skills(
 skill_id int auto_increment primary key,
 skill_name varchar(255) NOT NULL,
 category varchar(100));
 
 show databases;
 
 show tables;
 
 create table employee(
 emp_id int auto_increment primary key,
 first_name varchar(100) not null,
 email varchar(200) unique,
 hire_date date,
 salary decimal(10,2),
 dept_id int,
 gender varchar(10)
);

INSERT INTO employee (first_name, email, hire_date, salary, dept_id, gender)
VALUES ('Alice Green', 'alice.green@company.com', '2024-01-10', 62000.00, 4, 'Female');
 
 RENAME TABLE employee TO staff;
 
 CREATE TABLE department (
    dept_id INT AUTO_INCREMENT PRIMARY KEY,
    dept_name VARCHAR(50) NOT NULL,
    location VARCHAR(50)
);

  CREATE TABLE project (
    project_id INT AUTO_INCREMENT PRIMARY KEY,
    project_name VARCHAR(100) NOT NULL,
    budget DECIMAL(10,2),
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES department(dept_id)
);
 
 INSERT INTO project (project_name, budget, dept_id)VALUES 
('Mobile App', 60000.00, 2),
('Training Program', 25000.00, 1);

INSERT INTO department (dept_name, location)
VALUES ('Sales', 'Boston');
INSERT INTO department (dept_name, location) VALUES ('Manager', 'Chicago');

INSERT INTO staff (first_name, email) VALUES ('Tom', 'tom@company.com');

SELECT * FROM staff;

SELECT emp_id AS "Employee ID",first_name AS "Name",email AS "Email Address"
FROM staff;

SELECT * FROM staff WHERE hire_date > '2023-01-01';

SELECT * FROM project WHERE budget > 40000.00 ORDER BY budget DESC;

SELECT DISTINCT location FROM department;

ALTER TABLE staff ADD COLUMN phone_number VARCHAR(15) AFTER email;

INSERT INTO staff(first_name, email, hire_date, salary, dept_id, gender)
VALUES ('John Doe', 'john.doe@company.com', '2024-10-10', 62000.00, 3, 'Male');
 
UPDATE staff SET salary = 65000.00 WHERE first_name = 'John Doe';

UPDATE staff SET gender='Other' WHERE dept_id=2;

ALTER TABLE staff DROP COLUMN  phone_number;

SELECT * FROM staff WHERE salary BETWEEN 60000 AND 80000; 
SELECT *FROM staff WHERE first_name Like 'J%';
SELECT *FROM project WHERE dept_id IN (1,2);
SELECT * FROM staff WHERE email IS NOT NULL;
SELECT * FROM department WHERE location  NOT IN('New York','Chicago');
SELECT * FROM staff WHERE YEAR(hire_date) = 2023;

SELECT sum(salary) FROM staff;
SELECT avg(budget) FROM project;
SELECT  max(salary) FROM staff;
SELECT count(dept_id) as total FROM department WHERE dept_id=2;
SELECT min(budget) FROM project;

SELECT s.emp_id, s.first_name, d.dept_name FROM staff s
JOIN department d ON s.dept_id = d.dept_id; 
SELECT d.dept_name, COUNT(s.emp_id) AS employee_count
FROM department d
LEFT JOIN staff s
ON d.dept_id = s.dept_id
GROUP BY d.dept_name;

SELECT p.project_name, d.dept_name
FROM project p
JOIN department d
ON p.dept_id = d.dept_id;

SELECT s.emp_id, s.first_name FROM staff s JOIN department d
ON s.dept_id = d.dept_id WHERE d.location = 'Chicago';
SELECT d.dept_name
FROM department d
LEFT JOIN project p
ON d.dept_id = p.dept_id
WHERE p.project_id IS NULL;

SELECT UPPER(dept_name) AS dept_name_upper FROM department;
SELECT SUBSTRING(email, 1, 3) AS email_prefix FROM staff;
SELECT ABS(-50000) AS absolute_value;
SELECT ROUND(AVG(salary), 2) AS average_salary FROM staff;

SELECT * FROM staff ORDER BY hire_date DESC LIMIT 3;
SELECT * FROM staff ORDER BY emp_id LIMIT 3 OFFSET 3;
SELECT first_name, salary,
IF(salary >= 70000, 'High', 'Low') AS salary_category FROM staff;
SELECT project_name, budget,
CASE
    WHEN budget >= 60000 THEN 'Large'
    WHEN budget >= 40000 THEN 'Medium'
    ELSE 'Small'
END AS budget_category
FROM project;
SELECT dept_id, SUM(budget) AS total_budget
FROM project GROUP BY dept_id;
SELECT first_name FROM staff ORDER BY LENGTH(first_name) DESC LIMIT 1;
SELECT * FROM staff WHERE hire_date >= DATE_SUB('2025-03-22', INTERVAL 90 DAY);
 DELETE FROM staff WHERE salary < 60000;