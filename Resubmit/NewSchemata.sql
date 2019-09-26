

/************************** part sifir **************************/
/**
0.	Schemata.stig
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

