CREATE OR REPLACE VIEW v_emplo
    AS 
        SELECT * FROM employees
    WITH READ ONLY;

CREATE TABLE test(id NUMBER(5));

SELECT * FROM v_emplo2
    WHERE email LIKE '%KA%';

UPDATE v_emplo SET salary = 10000;

SELECT * FROM v_emplo;

SELECT first_name, last_name, department_name
    FROM v_emplo ve
    LEFT JOIN departments d
    ON (ve.department_id = d.department_id);

CREATE VIEW v_emplo2
    AS 
        SELECT employee_id, first_name, last_name, email, phone_number, department_id FROM employees
    WITH READ ONLY;

CREATE OR REPLACE VIEW v_emp
    AS 
        SELECT first_name, last_name, salary, department_name, d.department_id 
            FROM employees e
            LEFT JOIN departments d
            ON e.department_id = d.department_id;
    WITH READ ONLY;

SELECT * FROM v_emp;


SELECT * FROM USER_OBJECTS WHERE OBJECT_TYPE = 'TABLE';


-- Erstellen Sie eine View mit allen MA und allen Kontaktdaten der Sales-MA


-- Erstellen einer View, aus der die Anzahl der eingestellten MA pro Monat in allen Jahren hervorgeht

SELECT * FROM employees;


--JAHR 1 2 3 4 5 6 7 8 9 10 11 12
--1987 0 0 0 0 0 1
--1989 1 0 0 3 0 2

SELECT hire_date FROM employees;

SELECT EXTRACT(year FROM hire_date) AS Jahr, hire_date,
    (SELECT COUNT(EXTRACT(month FROM hire_date)) FROM employees 
        WHERE EXTRACT(month FROM hire_date) = 1 AND EXTRACT(year FROM hire_date) = EXTRACT(year FROM e.hire_date)) AS Jan,
    (SELECT COUNT(EXTRACT(month FROM hire_date)) FROM employees 
        WHERE EXTRACT(month FROM hire_date) = 2 AND EXTRACT(year FROM hire_date) = EXTRACT(year FROM e.hire_date)) AS Feb,
    (SELECT COUNT(EXTRACT(month FROM hire_date)) FROM employees 
        WHERE EXTRACT(month FROM hire_date) = 3 AND EXTRACT(year FROM hire_date) = EXTRACT(year FROM e.hire_date)) AS Mar 
FROM employees e
ORDER BY hire_date;