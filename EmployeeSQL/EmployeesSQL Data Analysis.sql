--1. List the employee number, last name, first name, sex, and salary of each employee
SELECT employees.emp_id, last_name, first_name, sex, salaries.salary
FROM employees
LEFT JOIN salaries ON employees.emp_id = salaries.emp_id;


--2. List the first name, last name, and hire date for the employees who were hired in 1986
SELECT first_name, last_name, hire_date
FROM employees
WHERE EXTRACT(YEAR FROM hire_date) = 1986;


--3. List the manager of each department along with their department number, department name, employee number, last name, and first name
SELECT departments.dept_id, departments.dept_name, employees.emp_id, last_name, first_name
FROM departments
JOIN dept_manager ON departments.dept_id = dept_manager.dept_id
JOIN employees ON dept_manager.emp_id = employees.emp_id;


--4. List the department number for each employee along with that employee’s employee number, last name, first name, and department name
SELECT dept_employee.dept_id, dept_employee.emp_id, last_name, first_name, dept_name
FROM dept_employee
JOIN employees ON dept_employee.emp_id = employees.emp_id
JOIN departments ON dept_employee.dept_id = departments.dept_id;


--5. List the first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' 
AND last_name 
LIKE 'B%';


--6. List each employee in the Sales department, including their employee number, last name, and first name
SELECT employees.emp_id, last_name, first_name, dept_name
FROM employees
JOIN dept_employee ON employees.emp_id = dept_employee.emp_id
JOIN departments ON dept_employee.dept_id = departments.dept_id
WHERE dept_name = 'Sales';


--7. List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e
JOIN dept_emp de ON e.emp_no = de.emp_no
JOIN departments d ON de.dept_no = d.dept_no
WHERE d.dept_name IN ('Sales', 'Development');


--8. List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name)
SELECT last_name, COUNT(*) as frequency
FROM employees
GROUP BY last_name
ORDER BY frequency DESC;


