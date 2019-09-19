drop table stage1; 
create table stage1 as 
select dm.emp_no, dm.from_date, dm.to_date, d.dept_name 
from dept_manager dm inner join departments d on dm.dept_no = d.dept_no; 



/** from dm inner join employees e on dm.emp_no = e.emp_no; 


e.first_name, e.last_name, e.hire_date 
from dm inner join titles t on dm.emp_no = t.emp_no 

e.first_name, e.last_name, e.hire_date, t.to_date t.to_date  

**/