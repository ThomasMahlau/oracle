SELECT q'* Meine Name ist Jeff *' text1, q'bMein Name ist textb' text2 FROM dual;

SELECT job_id, department_id FROM employees;

SELECT * FROM employees;

SELECT first_name || ' ' || manager_id AS "Vorname und Manager-ID" FROM employees;

SELECT employee_id, salary, salary+50*12 AS "Jahreseinkommen" FROM employees;

SELECT * FROM employees WHERE job_id = 'IT_PROG';

SELECT first_name, salary FROM employees WHERE salary BETWEEN 10000 AND 20000;

SELECT first_name, salary FROM employees WHERE first_name BETWEEN 'A%' AND 'F%'
    ORDER BY first_name;

SELECT * FROM employees WHERE employee_id IN (100, 105, 102, 200);

SELECT first_name,job_id FROM employees WHERE job_id LIKE 'SA_%';

SELECT 'My name is ' || first_name FROM employees;

SELECT first_name, last_name, manager_id FROM employees WHERE manager_id IS NULL;

SELECT first_name, last_name, manager_id FROM employees WHERE manager_id IS NOT NULL;

SELECT first_name, job_id, salary FROM employees WHERE job_id = 'IT_PROG'  AND salary >= 5000;

SELECT first_name, job_id, salary FROM employees WHERE job_id = 'IT_PROG' OR salary >= 5000;

SELECT last_name, job_id, salary
		FROM employees
			WHERE salary > 10000
				AND job_id NOT IN ('SA_MAN', 'ST_CLERK', 'SH_CLERK');

SELECT last_name, job_id, salary FROM employees 
    WHERE job_id ='IT_PROG' OR job_id='ST_CLERK' AND salary > 5000;

SELECT last_name, job_id, salary AS sal FROM employees 
    WHERE job_id ='IT_PROG' OR job_id='ST_CLERK' AND salary > 5000 
        ORDER BY sal DESC, last_name;

SELECT * FROM employees WHERE 1 = 1;






