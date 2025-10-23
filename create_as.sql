DROP TABLE employee_reduced;

CREATE TABLE employee_reduced(employee_id, first_name, last_name)
    AS SELECT employee_id, first_name, last_name FROM employees
    WHERE 1=2;

CREATE TABLE employee_reduced
    AS SELECT * FROM employees
    WHERE 1=2;
    
INSERT INTO employee_reduced(employee_id, first_name, last_name)
    SELECT employee_id, first_name, last_name FROM employees;

INSERT INTO employee_reduced
    SELECT * FROM employees;
  
SELECT * FROM employee_reduced;


SELECT * FROM employees WHERE job_id LIKE 'SA%';

-- Tabelle erstellen mit allen MA-Daten der IT-PROGs

-- Tabelle erstellen mit allen MA-Daten der SA...

-- Tabelle it_sales, in die die Daten der IT-PROGs & SA... zusammengefasst sind.

CREATE TABLE it_sales
    AS SELECT * FROM employees
    WHERE 1=2;

SELECT * FROM it_sales;

INSERT INTO it_sales
    SELECT * FROM it_progs

CREATE TABLE it_sales
    AS SELECT * FROM it_prog
INSERT INTO it_sales
    SELECT * FROM sales

-- Tabelle emp_dept erstellen mit employee_id, first_name, last_name, department_id, department_name, city, country_id, country_name

DROP TABLE emp_dept;

CREATE TABLE emp_dept(employee_id, first_name, last_name, department_id, department_name, city, country_id, country_name)
    AS 
        SELECT e.employee_id, e.first_name, e.last_name, d.department_id, d.department_name, l.city, c.country_id, c.country_name
        FROM employees e
        LEFT JOIN departments d
        ON e.department_id = d.department_id
        LEFT JOIN locations l
        ON d.location_id = l.location_id
        LEFT JOIN countries c
        ON l.country_id = c.country_id
        ORDER BY d.department_name;
        
SELECT * FROM emp_dept;