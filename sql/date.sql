SELECT CURRENT_DATE;
SELECT CURRENT_TIME;
SELECT CURRENT_TIMESTAMP;


/*
CENTURY — век;
DAY — день;
DOY (от англ. day of the year) — день года, выраженный числом от 1 до 365 или 366, если год високосный;
DOW (от англ. day of the week) — день недели, выраженный числом от 0 до 6, где понедельник — 1, воскресенье — 0.
ISODOW (от англ. day of the week и ISO 8601) — день недели, выраженный числом от 1 до 7, где понедельник — 1, воскресенье — 7.
HOUR — час;
MILLISECOND — миллисекунда;
MINUTE — минута;
MONTH — месяц;
SECOND — секунда;
QUARTER — квартал;
WEEK — неделя в году;
YEAR — год
*/


SELECT 
    id_user,
    EXTRACT(MONTH FROM log_on) AS month_activity,
    EXTRACT(DAY FROM log_on) AS day_activity
FROM user_activity;

SELECT 
    DATE_TRUNC('hour',log_on) as date_log_on
FROM user_activity;

SELECT 
	EXTRACT(HOUR FROM date) as hours
FROM transactions;

SELECT  
    count(distinct id_transaction) as transaction_per_day,
    DATE_TRUNC('day',date) as trunc_date
FROM transactions
group by trunc_date;

SELECT 
    EXTRACT(WEEK FROM SUBQ.trunc_date) as week_number,
    avg(SUBQ.transaction_per_day) as avg_week_transaction
FROM
	(SELECT  
		COUNT(distinct id_transaction) as transaction_per_day,
		DATE_TRUNC('day', date) AS trunc_date
	FROM transactions
	GROUP BY trunc_date) as SUBQ
group by week_number;


SELECT customer_id,
       invoice_date,
       total,
       DATE_TRUNC('month', CAST(invoice_date AS timestamp)),
       EXTRACT(WEEK FROM CAST(invoice_date AS timestamp))
FROM invoice
WHERE customer_id BETWEEN 20 AND 50 
and
EXTRACT(WEEK FROM CAST(invoice_date AS timestamp)) in (5, 7, 10, 33, 48)

select *
from invoice 
where 
EXTRACT(DAY from invoice_date::timestamp) = 1

select
email
from staff
where 
city = 'Calgary' and
extract(year from hire_date::timestamp) = '2002'

SELECT DATE_TRUNC('year', birth_date)
FROM staff
LIMIT 5; 

SELECT 
*
FROM invoice
WHERE 
extract(MONTH from invoice_date::timestamp) = 9
--EXTRACT(MONTH FROM CAST(invoice_date AS timestamp)) = 9
--DATE_TRUNC('week', invoice_date::date),
