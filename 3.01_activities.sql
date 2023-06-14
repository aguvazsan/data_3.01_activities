# 3.01 Activity 1

#Keep working on the `bank` database.

USE BANK;

-- 1. Get the number of clients by district, returning district name.

SELECT * FROM district
ORDER BY A1 DESC;

SELECT d.A2 as District, COUNT(c.client_id) AS Amount_Clients FROM BANK.District d JOIN BANK.client c ON d.A1= c.district_id
GROUP BY d.A2
ORDER BY Amount_clients ASC;

-- 2. Are there districts with no clients? Move all clients from `Strakonice` to a new district with `district_id = 100`. Check again.
 -- NO
 
 SELECT A1 FROM BANK.district
WHERE A2= 'Strakonice';
 
 SET SQL_SAFE_UPDATES = 0; -- PARA DESACTIVAR EL MODO SEGURO
 
 UPDATE BANK.client SET district_id= 100
 WHERE district_id= 20;
 
SELECT * FROM BANK.client
WHERE district_id= 100;
 
SELECT d.A2 , COUNT(c.client_id) AS Amount_Clients FROM BANK.District d LEFT JOIN BANK.client c ON d.A1= c.district_id
GROUP BY d.A2
ORDER BY d.A2 ASC;

 #  **Hint**: In case you have some doubts, you can check [here](https://www.w3schools.com/sql/sql_update.asp) how to use the update statement.

-- 3. How would you spot clients with wrong or missing `district_id`?

SELECT c.client_id AS client , d.A1 AS District FROM BANK.client c LEFT JOIN BANK.district d ON c.district_id= d.A1
WHERE d.A1 IS NULL;


-- 4. Return clients to `Strakonice`.

SELECT * FROM BANK.client
WHERE district_id= 20;

 UPDATE BANK.client SET district_id= 20
 WHERE district_id= 100;
 
SELECT * FROM BANK.client
WHERE district_id= 20;

-- ----------------------------------------------------------------
--                 3.01 Activity 4
-- ----------------------------------------------------------------

-- 1. Make a list of all the clients together with region and district, ordered by region and district.

SELECT c.client_id AS CLIENTS, d.A2 AS DISTRICT, d.A3 AS REGION
FROM bank.client c
JOIN bank.district d ON c.district_id=d.A1
GROUP BY c.client_id, d.A2, d.A3
ORDER BY REGION, DISTRICT;


-- 2. Count how many clients do we have per region and district.

SELECT COUNT(c.client_id) AS CLIENTS, d.A2 AS DISTRICT, d.A3 AS REGION
FROM bank.client c
JOIN bank.district d ON c.district_id=d.A1
GROUP BY  d.A3, d.A2
ORDER BY CLIENTS DESC;


-- 2.1 How many clients do we have per 10000 inhabitants?

-- d.A4 = inhabitants

SELECT COUNT(c.client_id)/d.A4*10000 AS RATIO, d.A2 AS DISTRICT, d.A3 AS REGION
FROM bank.client c
JOIN bank.district d ON c.district_id=d.A1
GROUP BY  d.A3, d.A2, d.A4
ORDER BY RATIO DESC;
