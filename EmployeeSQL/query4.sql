-- DROP TABLE query4;

CREATE TABLE query4 as 
	SELECT 	e.emp_no, e.last_name, e.first_name, 
			de.dept_no, de.from_date
	FROM employees e INNER JOIN dept_emp de 
	ON e.emp_no = de.emp_no; 
	
	-- GROUP BY
	-- , max(de.to_date)
	-- ORDER BY de.to_date DESC;  