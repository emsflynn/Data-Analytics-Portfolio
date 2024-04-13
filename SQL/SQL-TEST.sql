CREATE TABLE department(
	department_id INT PRIMARY KEY,
	department_name TEXT);

CREATE TABLE employee(
	employee_id INT PRIMARY KEY,
	employee_name VARCHAR(100),
	salary INT,
	department_id INT,
	FOREIGN KEY(department_id)REFERENCES department(department_id))

INSERT INTO department (department_id, department_name)
VALUES 
(1, 'Marketing'),
(2, 'Finance'),
(3, 'Sales');


INSERT INTO employee(employee_id, employee_name, salary, department_id)
VALUES 
(101, 'Hannah Power', 50000,1),
(102, 'Laura Maher', 60000, 2),
(103, 'Patrick Scott', 62000,1),
(104, 'Dermot Malone', 58000, 1),
(105, 'Finbar Lynch', 63000, 2),
(106, NULL, NULL, 3);

SELECT * FROM department

INSERT INTO department(department_id, department_name)
VALUES
(4, 'Human Resources')

INSERT INTO employee(employee_id, employee_name, salary, department_id)
VALUES 
(107, 'Liam Curren', 68000, 4)


--Write the SQL command to display the average salary in Cie. 
--Use avg_salary as alias 

SELECT AVG(salary) AS avg_salary FROM employee;

--Write the SQL command to display all the full names in upper cases. Use UpCsFullName as alias
SELECT UPPER(employee_name) AS UpCsFullName FROM employee;


--Display the department names and the corresponding number of
--employees per department, only for department having at least one employee
SELECT Department_Name, COUNT(Employee_ID) FROM Department RIGHT JOIN
Employee ON Department.Department_ID = Employee.Department_ID
GROUP BY Department.Department_Name;


-- Finbar Lynch has been fired from Cie, please write an SQL command to remove him from Cie database
DELETE FROM Employee WHERE employee_name='Finbar Lynch';

-- Write the SQL commands to delete all the tables of this database
DROP TABLE Employee;
DROP TABLE Department;

