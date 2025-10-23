-- JOIN
select * from employees;

select * from departments;

SELECT * FROM employees NATURAL JOIN departments;

SELECT first_name, last_name, department_name, department_id
    FROM employees JOIN departments USING (department_id);

SELECT * FROM employees
    WHERE department_id IS NULL;
    
SELECT e.first_name, e.last_name, d.manager_id, d.department_name
    FROM employees e 
    JOIN departments d
    ON (e.department_id = d.department_id AND e.manager_id = d.manager_id);

SELECT e.first_name, e.last_name, d.manager_id, d.department_name
    FROM employees e 
    JOIN departments d
    ON (e.department_id = d.department_id);

SELECT e.first_name, e.last_name, d.department_name, l.city, l.street_address, c.country_name
    FROM employees e
    JOIN departments d
    ON (e.department_id = d.department_id)
    JOIN locations l
    USING (location_id)
    NATURAL JOIN countries c;
    
SELECT e.first_name, d.department_name,l.city, c.country_name
    FROM employees e
    LEFT JOIN departments d
    ON (e.department_id = d.department_id)
    LEFT JOIN locations l
    ON (d.location_id = l.location_id)
    LEFT JOIN countries c
    ON (l.country_id = c.country_id)
    ORDER BY e.first_name;
    
--1 Zeige alle Departments an und die Anzahl der MA

--2 Zeige alle Departments an und die Anzahl der Städte und die Länder

--3 Zeige Anzahl der MA nach Ländern an.

--4 Zeige alle Länder mit Anzahl Departments an.
SELECT c.country_name, COUNT(d.department_name) AS anz
    FROM countries c
    LEFT JOIN locations l
    ON (c.country_id = l.country_id)
    LEFT JOIN departments d
    ON (l.location_id = d.location_id)
    GROUP BY c.country_name, c.country_id
    HAVING COUNT(d.department_name) > 0
    ORDER by anz DESC, c.country_name;

--5 Zeige alle Departments mit Summe Jahresgehälter, durchschnittliches Jahresgehalt und Anzahl MA an.
SELECT d.department_name, ROUND((SUM(e.salary)*12),2) AS JH, ROUND((AVG(e.salary)*12),2) AS JAVG, COUNT(e.employee_id) AS anz
FROM departments d
LEFT JOIN employees e
ON (d.department_id = e.department_id)
GROUP BY d.department_name
HAVING COUNT(e.employee_id) > 0
ORDER BY anz DESC;

--6 Zeige alle Städte an und die MA, die in diesen Städten arbeiten

--7 Es gibt eine Gehaltserhöhung nach folgendem Schema:
--        Salary < 3000 => + 500
--        Salary < 5000 => + 300
--        Salary > 5000 => + 100
--  Es sollen Vorname, Nachname, Salary und neues Gehalts ausgegeben werden.

--8 Wieviel Mehrkosten (Jahresgehalt) entstehen den einzelnen Ländern durch die Gehaltserhöhung?
--  Länder, alte Gehaltskosten/Jahr (alle MA/Land) und neue Gehaltskosten/Jahr (alle MA/Land)

SELECT 2000 AS altg, 3500 AS neug, 3500 - 2000 FROM dual;



select distinct department_id from employees order by department_id;
select distinct location_id,department_id from departments order by location_id;
select distinct location_id from locations order by location_id;
select distinct country_id, country_name from countries order by country_id;
