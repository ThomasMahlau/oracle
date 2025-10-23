SELECT * FROM employees 
WHERE employee_id = 110;

SELECT * FROM employees
WHERE employee_id = &emp_no;

SELECT * FROM employees
WHERE last_name = '&lname';

SELECT * FROM employees
WHERE last_name = 'King';

SELECT CONCAT(CONCAT(first_name,' '),last_name)
FROM employees;

SELECT CONCAT('2025-',employee_id), last_name, first_name
FROM employees;

select * from employees;

SELECT sysdate FROM dual;

SELECT ADD_MONTHS(sysdate,3) FROM dual;

SELECT last_name, first_name, ROUND(MONTHS_BETWEEN(sysdate,hire_date)/12) AS Dauer
FROM employees;

SELECT sysdate FROM dual;
SELECT ROUND(sysdate, 'YEAR') FROM dual;

SELECT TRUNC(sysdate, 'YEAR') FROM dual;

SELECT sysdate - 5 FROM dual;

SELECT sysdate - hire_date FROM employees;

SELECT first_name, last_name, EXTRACT(day FROM hire_date),EXTRACT(month FROM hire_date),EXTRACT(year FROM hire_date) FROM employees
WHERE EXTRACT(year FROM hire_date) = 1987;

SELECT LISTAGG(first_name,', ') WITHIN GROUP(ORDER BY first_name) "Employees"FROM employees WHERE job_id = 'IT_PROG';

SELECT job_id, LISTAGG(first_name,', ') WITHIN GROUP(ORDER BY first_name) "Employees"
    FROM employees
    GROUP BY job_id
    ORDER BY job_id;

SELECT DISTINCT job_id FROM employees ORDER BY job_id;

SELECT department_id, 
    (SELECT department_name FROM departments d
        WHERE d.department_id = e.department_id) AS abteilung,
    COUNT(*) AS anzahl, LISTAGG(first_name,', ') WITHIN GROUP(ORDER BY first_name) "Employees"
    FROM employees e
    GROUP BY department_id
    ORDER BY department_id;
