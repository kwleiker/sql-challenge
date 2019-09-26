

/************************** part sifir **************************/
/**
0.	Schemata.stigmata 
**/

CREATE TABLE departments (dept_no VARCHAR(8) PRIMARY KEY, dept_name VARCHAR(16) ); 

CREATE TABLE employees (emp_no INTEGER PRIMARY KEY, birth_date DATE, first_name VARCHAR(16), last_name VARCHAR(16), 
gender VARCHAR(8), hire_date DATE); 

CREATE TABLE dept_emp (emp_no INTEGER, dept_no VARCHAR(8), from_date DATE, to_date DATE, 
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no)); 

CREATE TABLE dept_manager (dept_no VARCHAR(8), emp_no INTEGER, from_date DATE, to_date DATE,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no));
	
CREATE TABLE salaries (emp_no INTEGER, salary INTEGER, from_date DATE, to_date DATE PRIMARY KEY,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no)); 

CREATE TABLE titles (emp_no INTEGER, title VARCHAR(32), from_date DATE, to_date DATE, 
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no));



/************************** part odin **************************/
/**
1.	List the following details of each employee: employee number, last name, first name, gender, and salary. 
**/

SELECT	emp_no, 
		birth_date, 
		first_name, 
		last_name, 
		gender, 
		hire_date
FROM	employees ;  



/************************** part zwei **************************/
/**     
2.	List employees who were hired in 1986. 	
**/ 

SELECT 	emp_no, 
		first_name, 
		last_name, 
		hire_date 
FROM 	employees 
WHERE 	date_part('year', hire_date) = 1986; 



/************************** part tri **************************/
/**    
3.	List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates.
**/ 

SELECT 	d.dept_no, d.dept_name,  
		dm.emp_no,  
		e.last_name, e.first_name, e.hire_date, 
		dm.to_date 
FROM 	dept_manager dm 
INNER JOIN	departments d 	ON 	dm.dept_no = d.dept_no
INNER JOIN	employees e 	ON 	dm.emp_no = e.emp_no 
WHERE	date_part('year', dm.to_date) = 9999; 



/************************** part dört **************************/ 
/**    
4.	List the department of each employee with the following information: employee number, last name, first name, and department name. 
**/    

SELECT 	DISTINCT ON (de.emp_no)
					de.emp_no, 
					e.last_name, e.first_name, 
					d.dept_name
FROM 	employees e 
INNER JOIN dept_emp de  	ON 	e.emp_no = de.emp_no
INNER JOIN departments d 	ON 	de.dept_no = d.dept_no
ORDER BY 	de.emp_no ASC, de.to_date DESC;



/************************** part beshta **************************/						
/** 
5.	List all employees whose first name is "Hercules" and last names begin with "B."
**/ 

SELECT 	emp_no, first_name, last_name
FROM 	employees 
WHERE 	first_name = 'Hercules' AND LEFT(last_name, 1) = 'B'; 



/*************************  part ses *************************/
/** 
6.	List all employees in the Sales department, including their employee number, last name, first name, and department name.
Select 
**/

SELECT 	e.emp_no, e.last_name, e.first_name, 
		d.dept_name
FROM 	employees e 
INNER JOIN dept_emp de ON e.emp_no = de.emp_no 
INNER JOIN departments d ON de.dept_no = d.dept_no
WHERE	date_part('year', de.to_date) = 9999 AND de.dept_no = 'd007';



/*************************  part septem  *************************/
/** 
7.	List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
**/ 

SELECT 		e.emp_no, e.last_name, e.first_name, 
			d.dept_name   
FROM 		employees e 
INNER JOIN 	dept_emp de 	ON 	e.emp_no = de.emp_no 
INNER JOIN 	departments d 	ON 	de.dept_no = d.dept_no 
WHERE		date_part('year', de.to_date) = 9999 AND de.dept_no = 'd007' OR de.dept_no ='d005' 
ORDER BY 	de.emp_no ASC; 



/*************************  part segiz  *************************/
/** 
8.	In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
**/
SELECT last_name, COUNT (last_name) 
	FROM employees
	GROUP BY last_name
	ORDER BY count DESC; 


/*************************  part neh   *************************/
/** 
9.  Do the extra credit stuff.  I say, "NEH!"
Kurmanci  (Kurdish generally) is kind enough to provide us with the number "neh" for nine. 
( I suppose "nein" from German would work in a pinch, but i like 'neh' better. )
**/