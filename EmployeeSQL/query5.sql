select * 
from employees 
where first_name = 'Hercules' AND LEFT(last_name, 1) = 'B';


CREATE TABLE	stage6a as 
SELECT 	e.emp_no, e.first_name, e.last_name, 
		
		
FROM 	dept_manager dm inner join departments d 
ON 	dm.dept_no = d.dept_no
WHERE	date_part('year', dm.to_date) = 9999; 



