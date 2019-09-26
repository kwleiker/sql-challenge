DROP TABLE stage6a; 

CREATE TABLE stage6a as 
SELECT 	e.emp_no, e.last_name, e.first_name, 
		de.dept_no, de.to_date  
FROM 	employees e INNER JOIN dept_emp de 
ON 		e.emp_no = de.emp_no 
WHERE	date_part('year', de.to_date) = 9999 AND de.dept_no = 'd007'; 

CREATE TABLE stage6 as 
SELECT 	s6a.emp_no, s6a.last_name, s6a.first_name, 
		d.dept_name 
FROM 	stage6a s6a INNER JOIN departments d 
ON 		s6a.dept_no = d.dept_no; 

DROP TABLE stage6a; 