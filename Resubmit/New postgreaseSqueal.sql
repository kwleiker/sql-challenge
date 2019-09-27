/**
part odin.	List the following details of each employee: employee number, last name, first name, gender, and salary. 
**/

SELECT	emp_no, 
		birth_date, 
		first_name, 
		last_name, 
		gender, 
		hire_date
FROM	employees ;  



/**     
part zwei.	List employees who were hired in 1986. 	
**/ 

SELECT 	emp_no, 
		first_name, 
		last_name, 
		hire_date 
FROM 	employees 
WHERE 	date_part('year', hire_date) = 1986; 



/**    
part tri.	List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates.
**/ 

SELECT 	d.dept_no, d.dept_name,  
		dm.emp_no,  
		e.last_name, e.first_name, e.hire_date, 
		dm.to_date 
FROM 	dept_manager dm 
INNER JOIN	departments d 	ON 	dm.dept_no = d.dept_no
INNER JOIN	employees e 	ON 	dm.emp_no = e.emp_no 
WHERE	date_part('year', dm.to_date) = 9999; 



/**    
part dört.	List the department of each employee with the following information: employee number, last name, first name, and department name. 
**/    

SELECT 	DISTINCT ON (de.emp_no)
					de.emp_no, 
					e.last_name, e.first_name, 
					d.dept_name
FROM 	employees e 
INNER JOIN dept_emp de  	ON 	e.emp_no = de.emp_no
INNER JOIN departments d 	ON 	de.dept_no = d.dept_no
ORDER BY 	de.emp_no ASC, de.to_date DESC;



/** 
part beshta.	List all employees whose first name is "Hercules" and last names begin with "B."
**/ 

SELECT 	emp_no, first_name, last_name
FROM 	employees 
WHERE 	first_name = 'Hercules' AND LEFT(last_name, 1) = 'B'; 



/** 
part ses.	List all employees in the Sales department, including their employee number, last name, first name, and department name.
**/

SELECT 	e.emp_no, e.last_name, e.first_name, 
		d.dept_name
FROM 	employees e 
INNER JOIN dept_emp de ON e.emp_no = de.emp_no 
INNER JOIN departments d ON de.dept_no = d.dept_no
WHERE	date_part('year', de.to_date) = 9999 AND de.dept_no = 'd007';



/** 
part septem.	List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
**/ 

SELECT 		e.emp_no, e.last_name, e.first_name, 
			d.dept_name   
FROM 		employees e 
INNER JOIN 	dept_emp de 	ON 	e.emp_no = de.emp_no 
INNER JOIN 	departments d 	ON 	de.dept_no = d.dept_no 
WHERE		date_part('year', de.to_date) = 9999 AND de.dept_no = 'd007' OR de.dept_no ='d005' 
ORDER BY 	de.emp_no ASC; 



/** 
part segiz.	In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
**/
SELECT last_name, COUNT (last_name) 
	FROM employees
	GROUP BY last_name
	ORDER BY count DESC; 


/** 
part neh.  Do the extra credit stuff.  I say, "NEH!"
**/


/** 
FROM Kurmanci SELECT neh NUM(9) WHERE 'foreign language number indicates EN-US negation' FOR snarky response;
-- DESC (Kurdish is kind enough to provide us with the number 'neh' for nine) 
-- ALT DESC (I suppose the negation "nein" from German would work in a pinch, but i like 'neh' better)
**/
