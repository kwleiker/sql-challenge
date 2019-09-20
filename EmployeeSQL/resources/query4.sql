CREATE TABLE stage4_1 as 
	SELECT 	e.emp_no, e.last_name, e.first_name, 
			de.dept_no, de.from_date, de.to_date
	FROM 	employees e INNER JOIN dept_emp de 
	ON 		e.emp_no = de.emp_no
	ORDER BY 	e.emp_no ASC, 
				de.to_date DESC;

CREATE TABLE 	stage4_2 as
	SELECT 	DISTINCT ON (s4.emp_no) 
			s4.emp_no, s4.last_name, s4.first_name,
			d.dept_name
	FROM 	stage4_1 s4 INNER JOIN departments d 
	ON 	s4.dept_no = d.dept_no;  
