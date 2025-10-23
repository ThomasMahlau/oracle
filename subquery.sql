--SELECT ... -
--FROM ...
--WHERE ...
--GROUP BY ...
--HAVING ...
--ORDER BY ...
--FETCH ...

-- Wann muss gruppiert werden?

SELECT * FROM employees;

SELECT MAX(department_id), AVG(salary), MAX(salary)
FROM employees;

SELECT first_name, last_name, salary, MIN(salary), MAX(salary)
FROM employees
GROUP BY first_name, last_name, salary
ORDER BY first_name, last_name;

SELECT DISTINCT department_id FROM employees ORDER BY department_id;

SELECT department_id, job_id,first_name, last_name, salary, 
    (SELECT MIN(salary) FROM employees WHERE department_id = e.department_id) AS min,
    (SELECT MAX(salary) FROM employees WHERE department_id = e.department_id) AS max,
    (SELECT ROUND(AVG(salary)) FROM employees WHERE department_id = e.department_id) AS avg,
    salary - (SELECT ROUND(AVG(salary)) FROM employees WHERE department_id = e.department_id)
    AS diff
FROM employees e
GROUP BY department_id, job_id, first_name, last_name, salary
ORDER BY first_name, last_name;

SELECT e.department_id, e.job_id, e.first_name, e.last_name, e.salary, MIN(b.salary) AS min, MAX(b.salary) AS max,
    ROUND(AVG(b.salary)) AS avg, e.salary - ROUND(AVG(b.salary))  AS diff
FROM employees e
JOIN employees b
ON (e.department_id = b.department_id)
GROUP BY e.department_id, e.job_id, e.first_name, e.last_name, e.salary
ORDER BY e.first_name, e.last_name;

SELECT department_id, job_id,first_name, last_name, salary
FROM employees
-- WHERE department_id < 40
-- WHERE department_id IN (10, 20, 30)
WHERE department_id IN (
SELECT DISTINCT department_id FROM employees ORDER BY department_id FETCH FIRST 3 ROWS ONLY
)
ORDER BY department_id,first_name,last_name;


SELECT department_id, job_id,first_name, last_name, salary
FROM (
    SELECT department_id, job_id,first_name, last_name, salary
    FROM employees
    WHERE department_id IN (
        SELECT DISTINCT department_id FROM employees ORDER BY department_id FETCH FIRST 3 ROWS ONLY
    )
)
ORDER BY department_id,first_name,last_name;


-- Wo können Subqueries eingebunden werden?
-- SELECT
-- FROM
-- WHERE
-- HAVING
-- ORDER BY

