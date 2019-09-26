
CREATE TABLE stage7a as 
SELECT 	e.emp_no, e.last_name, e.first_name, 
	de.dept_no, de.to_date  
FROM 	employees e INNER JOIN dept_emp de 
ON 	e.emp_no = de.emp_no 
WHERE	date_part('year', de.to_date) = 9999 AND de.dept_no = 'd007' OR de.dept_no ='d005' ; 

CREATE TABLE stage7 as 
SELECT 	s7a.emp_no, s7a.last_name, s7a.first_name, 
	d.dept_name
FROM 	stage7a s7a INNER JOIN departments d 
ON 	s7a.dept_no = d.dept_no; 

DROP TABLE stage7a; 
