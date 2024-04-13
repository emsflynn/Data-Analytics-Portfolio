Create database FinanceDB;
Create table financetbl(
fin_id SMALLINT, 
fin_derivative VARCHAR(16),
fin_asset VARCHAR(9),
PRIMARY KEY(fin_id)
);

COPY financetbl(fin_id, fin_derivative, fin_asset) 
FROM 'C:\Users\Public\Public Doc4SQL\finance.csv' DELIMITER ','
csv Header;*/
SELECT * FROM financetbl;
SELECT COUNT(*) FROM financetbl;
SELECT DISTINCT (fin_derivative) FROM financetbl;
SELECT LOWER(fin_derivative) FROM financetbl;
SELECT UPPER(fin_derivative) FROM financetbl;
SELECT COUNT(DISTINCT(fin_asset)) FROM financetbl;
SELECT DISTINCT(fin_asset) FROM financetbl;
SELECT MIN(fin_id) FROM financetbl;
SELECT MAX(fin_id) FROM financetbl;
SELECT SUM(fin_id) FROM financetbl;
SELECT AVG(fin_id) FROM financetbl;

SELECT SUM(fin_id)FROM financetbl WHERE fin_asset='stock';
SELECT COUNT(*)FROM financetbl WHERE fin_asset='stock';

SELECT COUNT(*) FROM financetbl WHERE 
fin_derivative='option contract' AND fin_asset='stock';

SELECT COUNT (*) FROM financetbl WHERE
fin_derivative='option contract' OR fin_asset='stock';

SELECT fin_asset, COUNT(*) FROM financetbl GROUP BY fin_asset;







SELECT fin_asset, COUNT(*) FROM financetbl GROUP BY fin_asset 
ORDER BY fin_asset ASC ;



SELECT fin_asset, COUNT(*) FROM financetbl GROUP BY fin_asset 
ORDER BY fin_asset DESC ;



SELECT fin_asset, COUNT(*) 
FROM financetbl 
GROUP BY fin_asset 
ORDER BY fin_asset ASC
LIMIT 2;

SELECT * 
FROM financetbl
ORDER BY fin_id ASC;

UPDATE financetbl
SET fin_derivative = 'swap contract'
WHERE fin_derivative IS NULL;


UPDATE financetbl
SET fin_derivative = 'call contract'
WHERE fin_derivative = 'option contract';


UPDATE financetbl
SET fin_derivative = 'option contract'
WHERE fin_derivative = 'call contract';


UPDATE financetbl
SET fin_asset = REPLACE(fin_asset, 'commodity', '')
WHERE fin_asset LIKE '%commodity%';