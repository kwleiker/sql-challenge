CREATE TABLE departments (dept_no VARCHAR PRIMARY KEY, dept_name VARCHAR ); 

CREATE TABLE employees (emp_no INTEGER PRIMARY KEY, birth_date DATE, first_name VARCHAR, last_name VARCHAR, 
gender VARCHAR, hire_date DATE); 

CREATE TABLE dept_emp (emp_no INTEGER, dept_no VARCHAR, from_date DATE, to_date DATE, 
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no)); 

CREATE TABLE dept_manager (dept_no VARCHAR, emp_no INTEGER, from_date DATE, to_date DATE,
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no)); 

CREATE TABLE salaries (emp_no INTEGER, salary INTEGER, from_date DATE, to_date DATE,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no)); 

CREATE TABLE titles (emp_no INTEGER, title VARCHAR, from_date DATE, to_date DATE, 
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no));
