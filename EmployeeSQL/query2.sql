
SELECT 
	emp_no, 
	first_name, 
	last_name,
	hire_date
FROM employees 
WHERE date_part('year', hire_date) = 1986; 

