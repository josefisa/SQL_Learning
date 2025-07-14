--Nombre: José Emanuel Figueroa Salgado
--Fecha: 27 de Noviembre del 2025

SELECT * 
FROM departments;

SELECT department_id, location_id
FROM departments;

SELECT last_name, salary, salary +300
FROM employees;

SELECT last_name AS name, commission_pct comm
FROM employees;

DESC employees;
SELECT first_name ||' '||last_name "Nombre del Empleado"
FROM employees;

SELECT last_name || ' es un ' || job_id
    AS "Informaci�n del empleado"
FROM employees;    

SELECT department_name || q'[ Department''s Manager Id: ]' || manager_id
    AS "Department and Manager"
FROM departments;

SELECT DISTINCT department_id
FROM employees;

SELECT *
FROM employees
WHERE salary > 14000;

SELECT last_name, salary, department_id
FROM employees
WHERE salary > 14000 
    AND department_id=10;
    
SELECT last_name, salary, department_id
FROM employees
WHERE salary > 14000 
    OR department_id=10;

SELECT employee_id , last_name, job_id, department_id
FROM employees
WHERE department_id = 90;

SELECT SYSDATE
FROM dual;

SELECT last_name, job_id, department_id
FROM employees
WHERE last_name = 'Whalen';

SELECT last_name
FROM employees
WHERE hire_date = '25/06/05';

SELECT last_name, salary, department_id, hire_date
FROM employees
WHERE salary BETWEEN 1000 AND 20000;

SELECT last_name, salary, department_id, hire_date
FROM employees
WHERE salary IN (5000,6000,9000);

SELECT last_name, salary, department_id, hire_date
FROM employees
WHERE last_name LIKE 'K%';

SELECT last_name, salary, department_id, hire_date
FROM employees
WHERE last_name LIKE '__v%';


SELECT last_name, salary, department_id, hire_date,commission_pct
FROM employees;

SELECT last_name, salary, department_id, hire_date,commission_pct
FROM employees
WHERE commission_pct IS NOT NULL;


SELECT last_name, salary, department_id, hire_date,commission_pct
FROM employees
WHERE commission_pct IS NULL;

SELECT employees.last_name, departments.department_name
FROM employees, departments
WHERE employees.department_id = departments.department_id;


SELECT e.last_name, d.department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id(+);


SELECT e.last_name, d.department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id(+);









