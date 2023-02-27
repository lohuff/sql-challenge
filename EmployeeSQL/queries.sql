-- List employee #, names, gender, and salaries of each employee
SELECT s.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees AS e
INNER JOIN salaries as s
ON s.emp_no = e.emp_no
ORDER BY s.emp_no;


-- List employees hired in 1986
SELECT emp_no, last_name, first_name, hire_date
FROM employees
WHERE extract(year FROM hire_date) = 1986;


-- List manager of depts along with dept #, dept name, employee #, last and first name
SELECT deptm.dept_no, deps.dept_name, deptm.emp_no, emp.last_name, emp.first_name
FROM dept_manager AS deptm
INNER JOIN departments AS deps ON
	deptm.dept_no=deps.dept_no
	INNER JOIN employees AS emp ON
		deptm.emp_no=emp.emp_no;
		
-- List dept # of each employee with employee #, names, and dept name
SELECT deps.dept_no, depte.emp_no, emp.last_name, emp.first_name, deps.dept_name
FROM dept_employee AS depte
INNER JOIN employees AS emp ON
	depte.emp_no=emp.emp_no
	INNER JOIN departments AS deps ON
		depte.dept_no=deps.dept_no;
		
-- List first and last name, and sex of each employee whose first name is Hercules and last name begins with B
SELECT e.last_name, e.first_name
FROM employees AS e
WHERE (e.first_name = 'Hercules') AND (lower(e.last_name)LIKE 'b%');

-- List each employee in the Sales dept including employee #, last name, and first name
CREATE VIEW employees_depts AS
	SELECT depte.emp_no, emps.last_name, emps.first_name, depts.dept_name
	FROM dept_employee AS depte
	INNER JOIN employees AS emps ON
		depte.emp_no=emps.emp_no
		INNER JOIN departments AS depts ON
			depte.dept_no=depts.dept_no;
	
SELECT emp_no, last_name, first_name 
FROM employees_departments WHERE dept_name = 'Sales';

-- Listing each employee in the sales and development dept including employee #, last name, first name, and dept. name
SELECT * FROM employees_depts
WHERE dept_name = 'Sales' OR dept_name = 'Development';

--List the frequency counts, in descending order, of all the employee last names
SELECT last_name, count(last_name) AS frequency
FROM employees
GROUP BY last_name
ORDER BY frequency DESC;