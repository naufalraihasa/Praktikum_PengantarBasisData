use employees;

select * from employees ;

SELECT departments
    first_name, last_name
FROM
    employees;

SELECT 
    dept_no
FROM
    departments;
    
SELECT 
    *
FROM
    departments;
    
SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Denis';
    
SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Elvis';
    
SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Denis' and gender = 'M';
    
SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Kellie' AND gender = 'F';

SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Denis'
        OR first_name = 'Elvis';
        
SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Kellie'
        OR first_name = 'Aruna';

-- salah, AND di eksekusi duluan daripada OR
-- jadi ini mengambil nama denis yang laki laki dan
-- semua gender perempuan
SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Denis' AND gender = 'M'
        OR gender = 'F';


-- benar, pake kurung
SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Denis'
        AND (gender = 'M' OR gender = 'F');


SELECT 
    *
FROM
    employees
WHERE
    (first_name = 'Kellie'
        OR first_name = 'Aruna')
        AND gender = 'F';
        
        
SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Cathie'
        OR first_name = 'Mark'
        OR first_name = 'Nathan';
        

SELECT 
    *
FROM
    employees
WHERE
    first_name IN ('cathie' , 'mark', 'nathan');
    

SELECT 
    *
FROM
    employees
WHERE
    first_name IN ('denis' , 'elvis');
    
SELECT 
    *
FROM
    employees
WHERE
    first_name NOT IN ('john' , 'mark', 'jacob');

SELECT 
    *
FROM
    employees
WHERE
    first_name LIKE ('mar%');
    
SELECT 
    *
FROM
    employees
WHERE
    first_name LIKE ('%mar');
    
SELECT 
    *
FROM
    employees
WHERE
    first_name LIKE ('%mar%');
    
SELECT 
    *
FROM
    employees
WHERE
    first_name LIKE ('mar_');

SELECT 
    *
FROM
    employees
WHERE
    first_name NOT LIKE ('%mar%');

SELECT 
    *
FROM
    employees
WHERE
    first_name LIKE ('Mark%');

 
SELECT 
    *
FROM
    employees
WHERE
    hire_date LIKE ('%2000%');

 

SELECT 
    *
FROM
    employees
WHERE
    emp_no LIKE ('1000_');
    
    
SELECT 
    *
FROM
    employees
WHERE
    first_name LIKE ('%jack%');
    

SELECT 
    *
FROM
    employees
WHERE
    first_name NOT LIKE ('%jack%');
    

SELECT 
    *
FROM
    employees
WHERE
    hire_date BETWEEN '1990-01-01' AND '2000-01-01';
    

SELECT 
    *
FROM
    employees
WHERE
    hire_date NOT BETWEEN '1990-01-01' AND '2000-01-01';
    
select * from salaries;

SELECT 
    *
FROM
    salaries
WHERE
    salary BETWEEN 66000 AND 70000;
    
SELECT 
    *
FROM
    employees
WHERE
    emp_no NOT BETWEEN 10004 AND 10012;
    

select * from departments;

SELECT 
    *
FROM
    departments
WHERE
    dept_no BETWEEN 'd003' AND 'd006';
    
