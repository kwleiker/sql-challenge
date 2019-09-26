
SELECT 	e.emp_no, e.last_name, e.first_name, 
		d.dept_name
FROM 	employees e 
INNER JOIN dept_emp de ON e.emp_no = de.emp_no 
INNER JOIN departments d ON de.dept_no = d.dept_no
WHERE	date_part('year', de.to_date) = 9999 AND de.dept_no = 'd007';
--SELECT emp_no, last_name, first_name, dept_name ;

SELECT 	d.dept_no, d.dept_name,  
	dm.emp_no,
	e.last_name, e.first_name, e.hire_date, 
	de.to_date  
FROM 	dept_manager dm 
INNER JOIN departments d 	ON 	dm.dept_no = d.dept_no
INNER JOIN employees e 	ON 	dm.emp_no = e.emp_no 
INNER JOIN dept_emp de	ON	dm.emp_no = de.emp_no
WHERE	date_part('year', dm.to_date) = 9999; 

/**
SELECT 	s6a.emp_no, s6a.last_name, s6a.first_name, 
		d.dept_name 
FROM 	stage6a s6a INNER JOIN d 
ON 		s6a.dept_no = d.dept_no; 
**/
/**
SELECT
   customer.customer_id,
   customer.first_name customer_first_name,
   customer.last_name customer_last_name,
   customer.email,
   staff.first_name staff_first_name,
   staff.last_name staff_last_name,
   amount,
   payment_date
FROM
   customer
INNER JOIN payment ON payment.customer_id = customer.customer_id
INNER JOIN staff ON payment.staff_id = staff.staff_id;
**/