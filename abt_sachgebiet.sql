CREATE TABLE i_abteilung (
    abt_id NUMBER(4) NOT NULL,
    abteilung VARCHAR2(20),
    man_id NUMBER(4)
);

ALTER TABLE i_abteilung MODIFY man_id NUMBER(4) DEFAULT 0;

SELECT * FROM i_abteilung;

INSERT INTO i_abteilung 
    (abt_id, abteilung)
    VALUES(10, 'Immobilien');
INSERT INTO i_abteilung 
    (abt_id, abteilung)
    VALUES(20, 'Reinigung');
INSERT INTO i_abteilung 
    (abt_id, abteilung)
    VALUES(30, 'Instandhaltung');
    
CREATE TABLE i_sachgebiet (
    sg_id NUMBER(4) NOT NULL,
    abt_id NUMBER(4) NOT NULL,
    sachgebiet VARCHAR2(20),
    man_id NUMBER(4) DEFAULT 0
);

SELECT * FROM i_sachgebiet;

INSERT INTO i_sachgebiet (sg_id, abt_id, sachgebiet)
    VALUES(1, 10, 'Mieter');
INSERT INTO i_sachgebiet (sg_id, abt_id, sachgebiet)
    VALUES(2, 10, 'Sicherheit');
INSERT INTO i_sachgebiet (sg_id, abt_id, sachgebiet)
    VALUES(3, 10, 'Sanitär');
    
SELECT a.abt_id ||'.'||
    CASE WHEN sg_id < 10 THEN '0'||TO_CHAR(sg_id)
        ELSE TO_CHAR(sg_id)
        END AS Kennung
    , a.abteilung ||' | ' || s.sachgebiet
    FROM i_abteilung a
    LEFT JOIN i_sachgebiet s
    ON (a.abt_id = s.abt_id)
ORDER BY a.abt_id;

SELECT a.abt_id || '.' ||
    CASE 
        WHEN s.sg_id < 10 THEN '0'||TO_CHAR(s.sg_id)
        ELSE TO_CHAR(s.sg_id)
        END AS Kennung
        , a.abteilung || ' | ' || s.sachgebiet AS Kombi
FROM i_abteilung a
JOIN i_sachgebiet s
ON (a.abt_id = s.abt_id);