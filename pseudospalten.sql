-- ROWID & ROWNUM

SELECT ROWID, last_name FROM employees;

SELECT ROWNUM, last_name FROM employees
    WHERE ROWNUM < 11;

-- Pseudospalte ora_rowscn

SELECT ora_rowscn,
    scn_to_timestamp(ora_rowscn) AS last_change_date, last_name
    FROM employees
    WHERE department_id = 30;
    
-- FETCH
SELECT * FROM employees ORDER BY last_name;

SELECT last_name FROM employees
    ORDER BY last_name
    OFFSET 5 rows;
    
SELECT last_name FROM employees
    ORDER BY last_name
    FETCH FIRST 5 ROWS ONLY;
    
SELECT last_name FROM employees
    ORDER BY last_name
    FETCH FIRST 10 PERCENT ROWS ONLY;
    
-- User Variablen

SELECT employee_id, first_name, last_name
    FROM employees
    WHERE employee_id = &emp_no;

SELECT DISTINCT department_id FROM employees
    ORDER BY department_id;

SELECT department_id, first_name, last_name
    FROM employees
    WHERE department_id = &dep_no;

SELECT first_name FROM employees;

SELECT first_name, last_name
    FROM employees
    WHERE first_name = '&vorname';
    
SELECT first_name, last_name
    FROM employees
    WHERE first_name = '&vorname'
    AND last_name = '&nachname';
    
ACCEPT emp_id PROMPT 'Bitte Personalnummer eingeben:';

SELECT first_name, last_name FROM employees
    WHERE employee_id = &emp_id;
