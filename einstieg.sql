SELECT 'Hallo Welt' FROM dual;

SELECT 3*8 FROM dual;

SELECT
    'Hallo Welt'
    FROM dual;

DESCRIBE employees;

describe employees;

SELECT first_name, last_name FROM employees;

SELECT first_name AS "vorname meiner ma", last_name AS "NACHname" FROM employees;

SELECT first_name "vorname meiner ma", last_name "NACHname" FROM employees;

-- Jetzt der Befehl zum Gehalt
SELECT first_name, last_name, salary FROM employees;

SELECT year FROM A_BABY_NAMES ORDER BY year;

SELECT job_id, department_id FROM employees ORDER BY job_id;

SELECT first_name || ' das war der Vorname ' || last_name AS "Mitarbeitername" FROM employees;

SELECT '2025' || first_name FROM employees;

SELECT 12/4 FROM dual;

SELECT salary, commission_pct FROM employees;

SELECT 
    salary, commission_pct, salary*commission_pct AS "Provision",
    (salary+50)*12 AS "Jahresgehalt"
    FROM employees;

SELECT manager_id, first_name, last_name, hire_date, hire_date + 7 FROM employees
    WHERE manager_id = 100;
    
SELECT * FROM employees;

SELECT first_name, salary FROM employees
    WHERE salary = 10000;

SELECT first_name, salary FROM employees
    WHERE salary > 10000
    ORDER BY salary;

SELECT first_name, salary FROM employees
    WHERE salary >= 10000 AND salary <= 14000
    ORDER BY salary;

SELECT first_name, salary FROM employees
    WHERE salary BETWEEN 10000 AND 14000
    ORDER BY salary;

SELECT first_name, salary FROM employees
    WHERE salary IN (14000, 10000, 11000)
    ORDER BY salary;
    
SELECT first_name FROM employees ORDER BY first_name;

SELECT first_name FROM employees
    WHERE first_name LIKE 'A%' OR first_name LIKE 'D%'
    ORDER BY first_name;

SELECT first_name FROM employees
    WHERE first_name BETWEEN 'A%' AND 'E%'
    ORDER BY first_name;

SELECT commission_pct FROM employees
    --WHERE commission_pct IS NOT NULL;
    ORDER BY commission_pct ASC NULLS LAST;