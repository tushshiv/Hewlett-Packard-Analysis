--deliverable 1
SELECT employees.emp_no,
employees.first_name,
employees.last_name, 
Titles.title,
Titles.from_date ,
Titles.to_date
into retirement_title
FROM employees
inner join Titles
ON employees.emp_no=Titles.emp_no
WHERE 
'/'
order by emp_no;

DROP TABLE unique_titles;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no)
emp_no,
first_name,
last_name, 
from_date ,
 title,
to_date
INTO unique_titles
FROM retirement_title
WHERE to_date = '9999-01-01'
ORDER BY emp_no, to_date DESC;

SELECT COUNT(title), title
INTO retiring_titles
from unique_titles
group by title order by COUNT(title) DESC

--deliverable 2
SELECT distinct on(emp.emp_no)
emp.emp_no,
emp.first_name,
emp.last_name,
emp.birth_date,
dep.from_date,
dep.to_date,
ttl.title
INTO MENTOR_01
FROM employees as emp
inner join dept_emp as dep ON emp.emp_no= dep.emp_no
inner join titles as ttl ON emp.emp_no = ttl.emp_no

SELECT *
INTO mentorship_eligibilty
FROM mentor_01
WHERE to_date = '9999-01-01' 
AND birth_date BETWEEN '1965-01-01' AND '1965-12-31' ORDER BY emp_no;

select * from mentorship_eligibilty;

drop table mentorship_eligibilty;







