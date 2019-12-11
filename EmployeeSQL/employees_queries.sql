--for each employee: employee number, last name, first name, gender, salary
SELECT e.emp_no, e.last_name, e.first_name, e.gender, s.salary 
FROM salaries AS s
LEFT JOIN employees AS e ON
e.emp_no=s.emp_no;

--list employees hired in 1986
SELECT emp_no, first_name, last_name, hire_date 
FROM employees
WHERE CAST(hire_date AS VARCHAR) LIKE '1986%';

--list manager of each dept: dept number, dept name, manager employee number,
--last name, first name, start and end employment dates 
SELECT dm.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name, dm.from_date, dm.to_date  
FROM dept_manager AS dm
LEFT JOIN departments AS d 
ON d.dept_no=dm.dept_no
LEFT JOIN employees AS e
ON e.emp_no=dm.emp_no ;

--list dept of each employee: employee number, last name, first name, dept name
SELECT de.emp_no, e.last_name, e.first_name, d.dept_name 
FROM dept_emp AS de
LEFT JOIN employees AS e
ON e.emp_no=de.emp_no
LEFT JOIN departments AS d
ON d.dept_no=de.dept_no
;

--list all employees whose first name is "Hercules" & last name begins with "B"
SELECT * 
FROM employees 
WHERE first_name='Hercules' 
AND last_name LIKE 'B%';

--list all employees in Sales dept: employee number, last name, first name, dept name 
SELECT de.emp_no, e.last_name, e.first_name, d.dept_name 
FROM dept_emp AS de
LEFT JOIN employees AS e
ON e.emp_no=de.emp_no
LEFT JOIN departments AS d
ON d.dept_no=de.dept_no
WHERE de.dept_no IN
	(
		SELECT d.dept_no
		FROM departments AS d
		WHERE d.dept_name = 'Sales'
	);
	
--list all employees in Sales & Development depts: employee number, 
--last name, first name, dept name
SELECT de.emp_no, e.last_name, e.first_name, d.dept_name 
FROM dept_emp AS de
LEFT JOIN employees AS e
ON e.emp_no=de.emp_no
LEFT JOIN departments AS d
ON d.dept_no=de.dept_no
WHERE de.dept_no IN
	(
		SELECT d.dept_no
		FROM departments AS d
		WHERE d.dept_name = 'Sales' OR d.dept_name = 'Development'
	);
	
--in descending order, list frequency count of employee last names
--i.e. how many employees share each last name?
SELECT last_name, COUNT(emp_no) AS "Last Name Frequency"
FROM employees
GROUP BY last_name
ORDER BY "Last Name Frequency" DESC;