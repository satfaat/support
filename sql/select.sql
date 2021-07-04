-- exclude duplicates and cities that have an even ID number
SELECT DISTINCT CITY
FROM STATION
WHERE MOD(ID, 2) = 0;
-- WHERE ID % 2 = 0;


-- Sorting by multiple columns

-- SELECT TOP 2 *
-- SELECT TOP 2 CITY

SELECT CITY, LENGTH(CITY)
FROM STATION
WHERE LENGTH(CITY) IN (
            SELECT MAX(LENGTH(CITY))
            FROM STATION
            UNION
            SELECT MIN(LENGTH(CITY))
            FROM STATION)
ORDER BY LENGTH(CITY) DESC, CITY ASC 
LIMIT 0, 2;

-- LIMIT offset, row_count;
-- LIMIT 5 OFFSET 3; mysql
-- LIMIT 3; mysql
-- FETCH FIRST 2 ROWS ONLY; oracle


SELECT * 
FROM DimCustomer 
ORDER BY MiddleName DESC
OFFSET 0 ROWS
FETCH NEXT 5 ROWS ONLY;

SELECT MIN(CITY), LENGTH(CITY)
FROM STATION 
GROUP BY LENGTH(CITY) 
ORDER BY LENGTH(CITY) DESC;

SELECT
    city,
    CHAR_LENGTH(city)
FROM STATION
WHERE city = (
    SELECT
        MIN(city)
    FROM STATION
    WHERE CHAR_LENGTH(city) = (
        SELECT
            MIN(CHAR_LENGTH(city))
        FROM STATION
    )
)
OR city = (
    SELECT
        MIN(city)
    FROM STATION
    WHERE CHAR_LENGTH(city) = (
        SELECT
            MAX(CHAR_LENGTH(city))
        FROM STATION
    )
);

/*
SELECT COUNT(columnName)
FROM tableName
WHERE condition;
*/
SELECT COUNT(ProductID)
FROM Products;


-- finds the average price of all products:
SELECT AVG(Price)
FROM Products;


SELECT * FROM Customers 
WHERE (CustomerName LIKE 'L%'
        OR CustomerName LIKE 'R%')
AND Country = 'USA'
ORDER BY CustomerName;


SELECT* FROM contacts
WHERE (name = 'Tom'
	    OR name = 'Gun')
AND height > '5';


SELECT * FROM contacts
WHERE weight BETWEEN '1000'
AND '800';


SELECT 
    name_store,
	count (name) as name_cnt,
    count (distinct name) as name_uniq_cnt
FROM products_data_all
GROUP BY name_store;


SELECT 
    -- СОСЧИТАТЬ все строки и вернуть результат В СТОЛБЦЕ ПО ИМЕНИ cnt
    COUNT(*) AS cnt
FROM
    -- ИЗ ТАБЛИЦЫ author
    author;


SELECT 
    -- НАЙТИ НАИМЕНЬШЕЕ ЗНАЧЕНИЕ в колонке birth_year 
    -- и вернуть результат В СТОЛБЦЕ ПО ИМЕНИ min_year
    MIN(birth_year) AS min_year
FROM author;


SELECT 
    AVG(pages :: integer) AS average
FROM books;

SELECT 
    AVG (CAST(pages AS integer)) AS average
FROM books;


SELECT 
	AVG(weight :: real) as average
FROM products_data_all
 Where units='г';


 SELECT 
    name,
    --max(price) as max_price,
    --min(price) as min_price,
    max(price) - min(price) as max_min_diff
FROM products_data_all
WHERE category = 'масло сливочное и маргарин' and date_upd :: date = '2019-06-10'
GROUP BY name;


SELECT 
    author, 
    COUNT(name) AS cnt
FROM books
GROUP BY author 
ORDER BY cnt;


SELECT 
    author, 
    COUNT(name) AS cnt
FROM books
GROUP BY author 
ORDER BY cnt DESC;


SELECT 
    name,
	max(price) as max_price
FROM products_data_all
GROUP BY name 
ORDER BY max_price DESC
LIMIT 5;

SELECT 
    name,
    genre 
FROM books
WHERE genre = 
            (SELECT id 
            FROM genre
            WHERE name ='Роман');


SELECT id_product
FROM products_data_all
WHERE (category = 'молоко и сливки' AND price > 120) 
    OR (category = 'масло сливочное и маргарин' AND price > 354);


SELECT name
FROM Employee
WHERE salary > 2000
AND months < 10
ORDER BY employee_id;