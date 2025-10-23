SELECT * FROM employees;

SELECT a.employee_id || ' ' || a.first_name AS vorgesetzter, a.last_name, b.employee_id, b.last_name, b.first_name FROM employees a
JOIN employees b
on a.employee_id = b.manager_id
--WHERE b.manager_id = 100
order by b.manager_id, b.last_name, b.first_name;

SELECT last_name, first_name, manager_id FROM employees WHERE manager_id = 100 order by last_name, first_name;

-- Ermittle die Anzahl MA pro FK
SELECT DISTINCT a.manager_id,
(SELECT COUNT(*) FROM employees b WHERE a.manager_id = b.manager_id) anzahl
FROM employees a
WHERE manager_id IS NOT NULL
ORDER BY manager_id NULLS FIRST;

SELECT DISTINCT a.manager_id, count(*) as anz
FROM employees a
WHERE manager_id IS NOT NULL
group by a.manager_id
order by a.manager_id;



