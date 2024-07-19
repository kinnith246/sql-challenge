--Query to drop tables if needed
DROP TABLE IF EXISTS dept_employee;
DROP TABLE IF EXISTS dept_manager;
DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS employees_staging;
DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS title;

--Create tables first then import csv files after in order of table creation

--Create tables
CREATE TABLE title(
	title_id VARCHAR(10) PRIMARY KEY,
	title VARCHAR(50) NOT NULL
);

--Issue with date format in original csv, SQL unable to read dates without formatting of dates
--Creating a staging table to store values then formatting later
--Import csv into this table first then run query below
CREATE TABLE employees_staging (
    emp_id INT PRIMARY KEY,
    title_id VARCHAR(10) NOT NULL,
    birth_date TEXT NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    sex VARCHAR(1) NOT NULL,
    hire_date TEXT NOT NULL,
	FOREIGN KEY (title_id) REFERENCES title(title_id)
);


--Creating the actual employees table
CREATE TABLE employees(
	emp_id INT PRIMARY KEY,
	title_id VARCHAR(10) NOT NULL,
	birth_date DATE NOT NULL,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	sex VARCHAR(1) NOT NULL,
	hire_date DATE NOT NULL,
	FOREIGN KEY (title_id) REFERENCES title(title_id)
);


--Query to convert the date format into something SQL can read
INSERT INTO employees (emp_id, title_id, birth_date, first_name, last_name, sex, hire_date)
SELECT emp_id,
       title_id,
       TO_DATE(birth_date, 'MM/DD/YYYY'),
       first_name,
       last_name,
       sex,
       TO_DATE(hire_date, 'MM/DD/YYYY')
FROM employees_staging;



CREATE TABLE departments(
	dept_id VARCHAR(10) PRIMARY KEY,
	dept_name VARCHAR(50)
);

CREATE TABLE dept_employee(
	emp_id int NOT NULL,
	dept_id VARCHAR(10) NOT NULL,
	PRIMARY KEY (emp_id, dept_id),
	FOREIGN KEY (emp_id) REFERENCES employees(emp_id),
	FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);

CREATE TABLE dept_manager(
	dept_id VARCHAR(10) NOT NULL,
	emp_id int NOT NULL,
	PRIMARY KEY (dept_id, emp_id),
	FOREIGN KEY (dept_id) REFERENCES departments(dept_id),
	FOREIGN KEY (emp_id) REFERENCES employees(emp_id)
);

CREATE TABLE salaries(
	emp_id int PRIMARY KEY,
	salary int NOT NULL,
	FOREIGN KEY (emp_id) REFERENCES employees(emp_id)
);
