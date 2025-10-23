select * from employees;

-- Erstellen einer neuen Tabelle als Kopie einer vorhandenen
DROP TABLE employee_copy;
CREATE TABLE employees_copy AS SELECT * FROM employees;
CREATE TABLE employees_leer AS SELECT * FROM employees WHERE 1=2;

select * from employees_leer;
SELECT * FROM employees_copy;

DROP TABLE mitarbeiter;
CREATE TABLE mitarbeiter(
    maid NUMBER(6) NOT NULL,
    vorname VARCHAR2(50),
    nachname VARCHAR2(50),
    email VARCHAR2(30)
);

SELECT * FROM mitarbeiter;

INFO mitarbeiter;

INSERT INTO mitarbeiter(maid,vorname,nachname,email)
    VALUES(1,'Andreas','Haffner','AHAFFNER');

ALTER TABLE mitarbeiter ADD add_id NUMBER(6);

UPDATE mitarbeiter SET ADD_ID = 0;

ALTER TABLE mitarbeiter MODIFY add_id NUMBER(6) DEFAULT 0;
ALTER TABLE mitarbeiter ADD gehalt_id NUMBER(3) DEFAULT 0;

DROP TABLE gehalt;
CREATE TABLE gehalt(
    gehalt_id NUMBER(6) NOT NULL,
    gehalt NUMBER(6) DEFAULT 0
);

INSERT INTO gehalt(gehalt_id, gehalt) VALUES(1,1000);
INSERT INTO gehalt(gehalt_id, gehalt) VALUES(2,2000);
INSERT INTO gehalt(gehalt_id, gehalt) VALUES(3,3000);

SELECT * FROM gehalt;
SELECT * FROM mitarbeiter;

INSERT INTO mitarbeiter(maid, vorname, nachname)
    VALUES(2,'Michael','Kirschner');
INSERT INTO mitarbeiter(maid, vorname, nachname)
    VALUES(3,'Holger','Karl');
INSERT INTO mitarbeiter(maid, vorname, nachname)
    VALUES(4,'Jeff','Beck');
    
UPDATE mitarbeiter SET gehalt_id =2 WHERE maid = 1;
UPDATE mitarbeiter SET gehalt_id =3 WHERE maid = 2;
UPDATE mitarbeiter SET gehalt_id =3 WHERE maid = 3;
UPDATE mitarbeiter SET gehalt_id =1 WHERE maid = 4;

DELETE FROM mitarbeiter;