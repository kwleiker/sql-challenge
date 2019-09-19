drop table stage1; 
drop table stage2; 

create table stage1 as 
select d.dept_name, d.dept_no, dm.emp_no, dm.from_date, dm.to_date   
from dept_manager dm inner join departments d on dm.dept_no = d.dept_no; 

create table stage2 as 
select 	s1.dept_name, s1.emp_no, s1.from_date, s1.to_date, 
		e.first_name, e.last_name, e.hire_date 
from stage1 s1 inner join employees e on s1.emp_no = e.emp_no; 

create table stage3 as 
select 	s2.dept_name, s2.emp_no, s2.from_date, s2.to_date, 
		s2.first_name, s2.last_name, s2.hire_date, 
		t.title, t.from_date, t.to_date 
from stage2 s2 inner join titles t on s2.emp_no = t.emp_no; 


/*
e.emp_no
e.birth_date
e.first_name
e.last_name
e.gender
e.hire_date
*/

