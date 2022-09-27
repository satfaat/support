SELECT SUM(total),
       MIN(total),
       MAX(total)
FROM invoice; 

SELECT ROUND(AVG(total), 2)
FROM invoice; 

SELECT COUNT(*)
FROM invoice; 

SELECT DISTINCT billing_country -- unique
FROM invoice
LIMIT 5; 

SELECT COUNT(DISTINCT billing_country)
FROM invoice; 

SELECT
billing_city,
sum(total),
count(total),
avg(total)
FROM invoice
WHERE billing_country = 'USA'
GROUP BY billing_city

SELECT 
count( distinct customer_id),
sum(total),
SUM(total)/COUNT(distinct customer_id) as total_per_customer
FROM invoice
WHERE billing_country = 'USA'


SELECT 
    DATE_TRUNC('week', invoice_date::timestamp),
    SUM(total),
    COUNT(DISTINCT customer_id),
    SUM(total)/COUNT(DISTINCT customer_id)
FROM invoice
WHERE billing_country = 'USA'
group by DATE_TRUNC('week', invoice_date::timestamp)

select 
support_rep_id,
count(customer_id)
from client
where
email like '%yahoo%' or
email like '%gmail%'
group by 
    support_rep_id


select 
case
    when total < 1 then 'low cost'
    when total >= 1 then 'high cost'
    end,
    sum(total)
from invoice
where 
billing_postal_code is not null
group by 
case
    when total < 1 then 'low cost'
    when total >= 1 then 'high cost'
    end

SELECT billing_city,
       SUM(total),
       COUNT(total),
       AVG(total)
FROM invoice
WHERE billing_country = 'USA'
GROUP BY billing_city
ORDER BY AVG(total); 


SELECT customer_id,
       COUNT(customer_id)
FROM invoice
WHERE 
billing_country = 'USA' and
invoice_date::date between '2011-05-25' and '2011-09-25'
GROUP BY customer_id
ORDER BY COUNT(customer_id) DESC
LIMIT 5;

select 
    extract(year from invoice_date::timestamp) as year,
    min(total),
    max(total),
    sum(total),
    count(total),
    round(sum(total)/count(distinct customer_id))
from invoice
where 
    billing_country in ('USA', 'United Kingdom', 'Germany') 
group by 
    extract(year from invoice_date::timestamp)
order by extract(year from invoice_date::timestamp) DESC


SELECT CAST(invoice_date AS date),
       billing_country,
       COUNT(total)
FROM invoice
GROUP BY CAST(invoice_date AS date),
         billing_country 
ORDER BY CAST(invoice_date AS date) DESC
LIMIT 10;


SELECT customer_id,
       SUM(total)
FROM invoice
GROUP BY customer_id
HAVING SUM(total) > 41
ORDER BY SUM(total) DESC;

SELECT EXTRACT(YEAR FROM CAST(i.invoice_date AS DATE)) AS year_of_purchase,
       MIN(i.total) AS min_cost,
       MAX(i.total) AS max_cost,
       SUM(i.total) AS total_revenue,
       COUNT(i.total) AS total_purchases,
       ROUND(SUM(i.total)/COUNT(DISTINCT(i.customer_id))) AS average_receipt
FROM invoice AS i
WHERE billing_country IN ('USA', 'United Kingdom', 'Germany')
GROUP BY year_of_purchase
ORDER BY year_of_purchase DESC; 


select 
    case 
        when rating = 'G' then 'без ограничений' 
        else 'с ограничениями'
        end as new_rating,
     sum(rental_rate)
from movie
group by new_rating