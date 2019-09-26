DROP TABLE stage8;
CREATE TABLE stage8 as 
SELECT last_name, COUNT (last_name) 
	FROM employees
	GROUP BY last_name
	ORDER BY count DESC; 
	

   
   