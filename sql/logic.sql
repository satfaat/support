select
	client_id,
	hitdatetime,
	case 
		when action = 'visit' then hitdatetime
		else NULL
	end as visit_dt,
	case
		when action = 'registration' then 1
		else 0
	end as is_registration
	from user_activity_log ual
limit 10;

SELECT client_id,
       CASE WHEN action = 'visit' THEN hitdatetime ELSE NULL END AS visit_dt,
       CASE WHEN action = 'login' THEN 1 ELSE 0 END AS is_login,
       CASE WHEN action = 'registration' THEN 1 ELSE 0 END AS is_registration
FROM user_activity_log
LIMIT 10;

select
	client_id,
	case 
		when action = 'visit' then min(hitdatetime::date)
	end as fst_visit_dt,
	case
		when action = 'registration' then max(hitdatetime::date)
	end as registration_dt,
	case
		when action = 'registration' then 1
		else 0
	end as is_registration
	from user_activity_log ual
	group by
		ual.client_id,
		ual.action
limit 10;

select
	client_id,
	min(
	  case
	  	when action='visit' then hitdatetime::date
	  	else null
	  end) as fst_visit_dt,
	min(case
			when action = 'registration' then hitdatetime::date
			else null
		end) as registration_dt,
	max(case
		  when action = 'registration' then 1
		  else 0
		end) as is_registration
			from user_activity_log ual
			  group by
				ual.client_id
				limit 10;

SELECT client_id,
       DATE(MIN(CASE WHEN action = 'visit' THEN hitdatetime ELSE NULL END)) AS fst_visit_dt,
       DATE(MIN(CASE WHEN action = 'registration' THEN hitdatetime ELSE NULL END)) AS registration_dt,
       MAX(CASE WHEN action = 'registration' THEN 1 ELSE 0 END) AS is_registration
FROM user_activity_log
GROUP BY client_id
LIMIT 10;

	select
	ual.client_id,
	ua.utm_campaign,
	min(case when ual.action='visit' then ual.hitdatetime::date
	  	else null end) as fst_visit_dt,
	min(case when ual.action = 'registration' then ual.hitdatetime::date
			else null end) as registration_dt,
	max(case when ual.action = 'registration' then 1
		  else 0 end) as is_registration,
	upl.total_payment_amount
			from user_activity_log ual
				join (select client_id, utm_campaign from user_attributes group by client_id, utm_campaign) ua 
					on ual.client_id = ua.client_id
				left join (select client_id, sum(payment_amount) as total_payment_amount from user_payment_log group by client_id) upl 
					on ual.client_id = upl.client_id
			  group by
				ual.client_id,
				ua.utm_campaign,
				upl.total_payment_amount
				limit 10;

SELECT ua.client_id,
       ua.utm_campaign,
       ual.fst_visit_dt,
       ual.registration_dt,
       ual.is_registration,
       upl.total_payment_amount
FROM user_attributes ua
LEFT JOIN (
       SELECT client_id,
              DATE(MIN(CASE WHEN action = 'visit' THEN hitdatetime ELSE NULL END)) AS fst_visit_dt,
              DATE(MIN(CASE WHEN action = 'registration' THEN hitdatetime ELSE NULL END)) AS registration_dt,
              MAX(CASE WHEN action = 'registration' THEN 1 ELSE 0 END) AS is_registration
       FROM user_activity_log
       GROUP BY client_id
  ) ual
  ON ua.client_id = ual.client_id
LEFT JOIN (
       SELECT client_id,
              SUM(payment_amount) AS total_payment_amount
       FROM user_payment_log
       GROUP BY client_id
) upl
ON ua.client_id = upl.client_id;

with cteReports_1 as 
	(
	  SELECT client_id,
		DATE(MIN(CASE WHEN action = 'visit' THEN hitdatetime ELSE NULL END)) AS fst_visit_dt,
		DATE(MIN(CASE WHEN action = 'registration' THEN hitdatetime ELSE NULL END)) AS registration_dt,
		MAX(CASE WHEN action = 'registration' THEN 1 ELSE 0 END) AS is_registration
	  FROM user_activity_log
	  GROUP BY client_id
	),
	ctereports_2 as
	(
	  SELECT client_id,
			SUM(payment_amount) AS total_payment_amount
			   FROM user_payment_log
			   GROUP BY client_id
	)
select 
*
from cteReports_1 cte1
	left join ctereports_2 cte2 on cte1.client_id = cte2.client_id
	order by cte1.client_id desc