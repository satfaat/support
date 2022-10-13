-- scalar functions
select * from table
where
lcase(column) like 'v%'

SELECT 
    total,
    CASE
        WHEN total < 5 THEN 'маленький'
        WHEN total >= 5 AND total < 10 THEN 'средний'
        WHEN total >= 10 THEN 'крупный'
    END
FROM invoice
LIMIT 10; 

SELECT 
    total,
    CASE
        WHEN total >= 5 AND total < 10 THEN 'средний'
        WHEN total >= 10 THEN 'крупный'
    END
FROM invoice
LIMIT 10; 

SELECT 
    total,
    CASE
        WHEN total >= 5 AND total < 10 THEN 'средний'
        WHEN total >= 10 THEN 'крупный'
        ELSE 'маленький'
    END
FROM invoice
LIMIT 10; 

SELECT last_name, first_name, title,
    CASE
        when title like '%IT%' then 'разработка'
        when title like '%Manager%' and title not like '%IT%' then 'отдел продаж'
        when title like '%Support%' then 'поддержка' end
FROM staff;

SELECT title, rental_rate,
    case
        when rental_rate < 1 then 'категория 1'
        when rental_rate >= 1 and rental_rate < 3 then 'категория 2'
        when rental_rate  >= 3 then 'категория 3'
        end
FROM movie;

SELECT 
    first_name,
    last_name,
    country
FROM client
WHERE (company, state, phone, fax) IS NULL;


SELECT DISTINCT CAST(invoice_date AS date),
       billing_country
FROM invoice
ORDER BY CAST(invoice_date AS date) DESC
LIMIT 10; 