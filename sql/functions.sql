-- LEFT RIGHT SUBSTRING SUBSTR
-- names starting with vowels
SELECT DISTINCT CITY
FROM STATION
WHERE LEFT(CITY,1) in ('A','E','I','O','U');
-- WHERE LOWER(SUBSTR(CITY,LENGTH(CITY),1)) IN ('a','e','i','o','u');
-- WHERE UPPER(substr(city,-1)) in ('A','E','I','O','U');

/*
SELECT ColumnName
FROM Table
WHERE ColumnName REGEXP '^[aeiouAEIOU].*[aeiouAEIOU]$'
*/
/*
SELECT ColumnName
FROM Table
WHERE LOWER(SUBSTRING(ColumnName, 1, 1)) IN ('a', 'e', 'i', 'o', 'u') AND
      LOWER(SUBSTRING(ColumnName, CHAR_LENGTH(ColumnName), 1)) IN ('a', 'e', 'i', 'o', 'u')
*/

SELECT DISTINCT CITY
FROM STATION
WHERE LOWER(LEFT(CITY,1)) IN ('a', 'e', 'i', 'o', 'u')
AND LOWER(RIGHT(CITY,1)) IN ('a', 'e', 'i', 'o', 'u');

SELECT DISTINCT CITY
FROM STATION
WHERE LOWER(LEFT(CITY, 1)) NOT IN ('a', 'e', 'i', 'o', 'u');

SELECT DISTINCT CITY
FROM STATION
WHERE LOWER(RIGHT(CITY, 1)) NOT IN ('a', 'e', 'i', 'o', 'u');
-- WHERE CITY NOT REGEXP '[aeiou]$'


SELECT NAME
FROM STUDENTS
WHERE MARKS > 75
ORDER BY RIGHT(NAME, 3), ID ASC;

