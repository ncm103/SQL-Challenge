/*Note- I created and imported all tables at the very beginning, but accidentally forgot that
that adding "Drop Table If Exists" completely erases the table data- since the columns and basis 
had already been created, I didn't add it back in, but Dr. A told me I could just add in a note 
explaining that I had just re- imported the tables, not re-written the syntax, etc.  Hope this is ok :) */


/* #1 List the following details of each employee: employee number, last name, first name, gender, and salary*/
SELECT e.emp_no, e.last_name, e.first_name, e.gender, s.salary
FROM employees AS e
INNER JOIN salaries AS s
ON (e.emp_no=s.emp_no);

/* #2 List employees who were hired in 1986*/
SELECT * FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';

/*#3  List the manager of each department with the following
information: department number, department name, the manager's employee number, last name, first 
name, and start and end employment dates*/
SELECT dm.dept_no, dm.emp_no, dm.from_date, dm.to_date, d.dept_name, e.first_name, e.last_name
FROM dept_manager AS dm
INNER JOIN departments  AS d
ON (dm.dept_no=d.dept_no)
INNER JOIN employees as e
ON (dm.emp_no=e.emp_no);

/*#4 List the department of each employee with the following information:
employee number, last name, first name, and department name.*/
SELECT de.dept_no, de.emp_no, e.last_name, e.first_name, d.dept_name
FROM dept_emp AS de
INNER JOIN employees AS e
ON (de.emp_no=e.emp_no)
INNER JOIN departments as d
ON (de.dept_no=d.dept_no);

/*#5 List all employees whose first name is "Hercules" 
and last name begins with "B"*/
SELECT first_name, last_name FROM employees
WHERE first_name = 'Hercules'
and last_name LIKE 'B%';

/* #6 List all employees in the Sales department, including their 
employee number, last name, first name, and department name. */

SELECT e.emp_no, e.last_name, e.first_name, de.dept_no, d.dept_name
FROM employees AS e
INNER JOIN dept_emp AS de
ON (e.emp_no=de.emp_no)
INNER JOIN departments AS d
ON (de.dept_no=d.dept_no)
WHERE dept_name = 'Sales';

/*#7 List all employees in the Sales and Development departments, including their employee number, 
last name, first name, and department name.*/
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e
INNER JOIN dept_emp AS de
ON (e.emp_no=de.emp_no)
INNER JOIN departments AS d
ON (de.dept_no=d.dept_no)
WHERE dept_name = 'Development'  
OR dept_name = 'Sales';

/*#8 In descending order, list the frequency count of employee 
last names, i.e., how many employees share each last name.*/
SELECT last_name, COUNT (*)freq_count
FROM employees
GROUP BY last_name
ORDER BY freq_count desc;

