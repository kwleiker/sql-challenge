drop table stage1;
drop table stage2;

create table	stage1 as 
SELECT 	d.dept_name, d.dept_no, dm.emp_no, 
		dm.from_date as mgr_from_date, 
		dm.to_date as mgr_to_date   
FROM 	dept_manager dm inner join departments d 
ON 		dm.dept_no = d.dept_no
WHERE	date_part('year', dm.to_date) = 9999; 

create table	stage2 as 
SELECT	s1.dept_no, s1.dept_name, s1.emp_no, 
		e.last_name, e.first_name, e.hire_date , s1.mgr_to_date
FROM 	stage1 s1 inner join employees e 
ON		s1.emp_no = e.emp_no; 
 

