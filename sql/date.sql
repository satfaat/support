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