-- difference between the total number of CITY
SELECT COUNT(CITY) AS num1, COUNT(DISTINCT CITY) AS num2, num1-num2 AS result
FROM STATION;

SELECT count(CITY) - COUNT(DISTINCT CITY) AS result
FROM STATION;


SELECT CASE             
    WHEN A + B > C AND B + C > A AND A + C > B THEN
        CASE 
            WHEN A = B AND B = C THEN 'Equilateral'
            WHEN A = B OR B = C OR A = C THEN 'Isosceles'
            ELSE 'Scalene'
        END
    ELSE 'Not A Triangle'
    END
FROM TRIANGLES;

-- mysql
SELECT CONCAT(Name, '(', SUBSTR(Occupation,1,1), ')') AS Name
FROM Occupations
ORDER BY Name;

SELECT CONCAT('There are a total of ', COUNT(Occupation), ' ' , LOWER(Occupation), 's.') AS Total
FROM Occupations
GROUP BY Occupation
ORDER BY Total;
-- ORDER BY COUNT(Name), Occupation;


-- oracle
SELECT Name || '(' || SUBSTR(Occupation, 1, 1) || ')'
FROM OCCUPATIONS
ORDER BY Name;

SELECT 'There are a total of ' || Count(Name) || ' ' || LOWER(Occupation) || 's.'
FROM Occupations
GROUP BY Occupation
ORDER BY Count(Name), Occupation;


SELECT OrderID, Quantity,
CASE
    WHEN Quantity > 30 THEN 'The quantity is greater than 30'
    WHEN Quantity = 30 THEN 'The quantity is 30'
    ELSE 'The quantity is under 30'
END AS QuantityText
FROM OrderDetails;


SELECT CustomerName, City, Country
FROM Customers
ORDER BY
(CASE
    WHEN City IS NULL THEN Country
    ELSE City
END); 