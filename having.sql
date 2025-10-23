SELECT * FROM A_CUSTOMERS_ORG;


-- WHERE & HAVING

SELECT firstname, lastname, city,
        (SELECT SUM(amount) FROM A_ORDERS_ORG o
            WHERE o.customer_id = c.id) AS Gesamt
    FROM A_CUSTOMERS_ORG c
    WHERE city LIKE 'S%'
    GROUP BY id, firstname, lastname, city
    HAVING lastname LIKE 'A%';

-- Kunden mit höchstem Umsatz ermitteln
-- Achtung: Umsätze OHNE customer_id bilden in der Summe den höchsten Umsatz
                        
SELECT firstname, lastname, 
    (SELECT SUM(amount) FROM A_ORDERS_ORG o
            WHERE o.customer_id = c.id) AS Gesamt
    FROM A_CUSTOMERS_ORG c
    GROUP BY id, firstname, lastname
    HAVING (SELECT SUM(amount) FROM A_ORDERS_ORG o
            WHERE o.customer_id = c.id) IS NOT NULL
    ORDER BY Gesamt DESC
    FETCH FIRST 1 rows ONLY;
    

-- A_BOOKS_ORG aufräumen

SELECT * FROM A_BOOKS_ORG
    ORDER BY LENGTH(id) DESC;
    
SELECT id, LENGTH(id) FROM A_BOOKS_ORG
    ORDER BY LENGTH(id) DESC;

DELETE FROM A_BOOKS_ORG
    WHERE LENGTH(id)>5;