-- JOINS

    -- syntax
    select *
    from tb_name_left tnl
        join tb_name_right tnr on tnl.col = tnr.col

-- SUB QUERIES
    SELECT * 
    FROM FamilyMembers 
    WHERE birthday = (SELECT MAX(birthday) FROM FamilyMembers);

    SELECT cols
    FROM tbl_1
    WHERE (tbl_1.col1, tbl_1.col2) = -- subquery
        (
            SELECT col1, col2 
            FROM tbl2 
            WHERE id = 10
        );

    SELECT cols FROM (subquery) as alias_name


-- just where as inner join

    SELECT *
    FROM Payments, FamilyMembers
    WHERE family_member = member_id;

-- CTE aka Common Table Expressions

    WITH Aeroflot_trips AS
        (SELECT TRIP.* FROM Company
            INNER JOIN Trip ON Trip.company = Company.id WHERE name = "Aeroflot")

    SELECT plane, COUNT(plane) AS amount FROM Aeroflot_trips GROUP BY plane;

    WITH Aeroflot_trips AS
        (SELECT plane, town_from, town_to FROM Company
            INNER JOIN Trip ON Trip.company = Company.id WHERE name = "Aeroflot")

    SELECT * FROM Aeroflot_trips;

    WITH Aeroflot_trips AS
        (SELECT TRIP.* FROM Company
            INNER JOIN Trip ON Trip.company = Company.id WHERE name = "Aeroflot"),
        Don_avia_trips AS
        (SELECT TRIP.* FROM Company
            INNER JOIN Trip ON Trip.company = Company.id WHERE name = "Don_avia")

    SELECT * FROM Don_avia_trips UNION SELECT * FROM  Aeroflot_trips;

-- UNION
    SELECT DISTINCT Goods.good_name AS name FROM Goods
    UNION
    SELECT DISTINCT FamilyMembers.member_name AS name FROM FamilyMembers;



SELECT *
FROM
  (SELECT m.rating,
          AVG(m.rental_rate) AS average_rental
   FROM movie AS m
   GROUP BY m.rating
   ORDER BY average_rental DESC
   LIMIT 5) AS best_rating; 


SELECT AVG(best_rating.average_rental)
FROM
  (SELECT m.rating,
          AVG(m.rental_rate) AS average_rental
   FROM movie AS m
   GROUP BY m.rating
   ORDER BY average_rental DESC
   LIMIT 5) AS best_rating; 


select
    avg(min_length) as avg_min_length,
    avg(max_length) as avg_max_length
from(
SELECT top.rating,
       MIN(top.length) AS min_length,
       MAX(top.length) AS max_length,
       AVG(top.length) AS avg_length,
       MIN(top.rental_rate) AS min_rental_rate,
       MAX(top.rental_rate) AS max_rental_rate,
       AVG(top.rental_rate) AS avg_rental_rate
FROM
  (SELECT title,
          rental_rate,
          length,
          rating
   FROM movie
   WHERE rental_rate > 2
   ORDER BY length DESC
   LIMIT 40) AS top
GROUP BY top.rating
ORDER BY avg_length
) as t3


SELECT *
FROM client
WHERE customer_id IN (SELECT customer_id
                      FROM invoice
                      GROUP BY customer_id
                      ORDER BY SUM(total) DESC
                      LIMIT 10); 


SELECT *
FROM
  (SELECT billing_country AS country,
          COUNT(total) AS total_invoice
   FROM invoice
   GROUP BY billing_country
   ORDER BY total_invoice DESC
   LIMIT 5) AS i
LEFT OUTER JOIN
  (SELECT country AS country,
          COUNT(customer_id) AS total_clients
   FROM client
   GROUP BY country) AS c ON i.country = c.country; 


SELECT i.country,
       i.total_invoice,
       c.total_clients
FROM
  (SELECT billing_country AS country,
          COUNT(total) AS total_invoice
   FROM invoice
   GROUP BY billing_country
   ORDER BY total_invoice DESC
   LIMIT 5) AS i
LEFT OUTER JOIN
  (SELECT country AS country,
          COUNT(customer_id) AS total_clients
   FROM client
   GROUP BY country) AS c ON i.country = c.country
ORDER BY i.total_invoice DESC; 


select 
    c.last_name
from client c
where 
    c.customer_id in (
    select
    i.customer_id
    from invoice i
    where 
    extract(year from invoice_date::date) = 2013
    and 
    extract(month from invoice_date::date) between 2 and 12
)
and c.customer_id in (
    select
    i.customer_id
    from invoice i
    where 
    extract(year from invoice_date::date) = 2013
    and 
    extract(month from invoice_date::date) = 1
)

select 
    c.name as name_category,
    count(distinct fa.film_id) as total_films
from film_actor fa
    join film_category fc using(film_id)
    join category c using(category_id)
    where fa.actor_id in (
        SELECT 
            fa.actor_id
        FROM movie m
        JOIN film_actor fa using(film_id)
        WHERE m.release_year > 2013
        GROUP BY fa.actor_id
        HAVING COUNT(fa.film_id) > 7
    )
    group by 
        name_category
    order by 
        total_films DESC,
        name_category 


 select
     t1.billing_country as country,
     t1.count as total_invoice,
     t2.count as total_customer
 from 
 (
     select 
     billing_country,
     count(invoice_id)
     from invoice
     where
     extract(year from invoice_date::timestamp) in 
     (
         select
            extract(year from invoice_date::timestamp) as year
        from invoice
        where 
         extract(month from invoice_date::timestamp) between 6 and 8
         group by 
             year
         order by sum(total) desc
         limit 1
     )
     group by billing_country
 ) as t1 left join
 (
      select 
     country,
     count(customer_id)
     from client
     group by country
) as t2 on t1.billing_country = t2.country
order by
    total_invoice DESC,
    country


WITH 
-- первый подзапрос с псевдонимом i
i AS (SELECT billing_country AS country,
             COUNT(total) AS total_invoice
      FROM invoice
      GROUP BY billing_country
      ORDER BY total_invoice DESC
      LIMIT 5), -- подзапросы разделяют запятыми
-- второй подзапрос с псевдонимом c
 c AS (SELECT country AS country,
              COUNT(customer_id) AS total_clients
              FROM client
              GROUP BY country)

-- основной запрос, в котором указаны псевдонимы для подзапросов
SELECT i.country,
       i.total_invoice,
       c.total_clients
FROM i LEFT OUTER JOIN c ON i.country=c.country
ORDER BY i.total_invoice DESC; 


with 
m as (SELECT title,
              rental_rate,
              length,
              rating
       FROM movie
       WHERE rental_rate > 2
       ORDER BY length DESC
       LIMIT 40),
m2 as (SELECT top.rating,
           MIN(top.length) AS min_length,
           MAX(top.length) AS max_length,
           AVG(top.length) AS avg_length,
           MIN(top.rental_rate) AS min_rental_rate,
           MAX(top.rental_rate) AS max_rental_rate,
           AVG(top.rental_rate) AS avg_rental_rate
    FROM
      (SELECT title,
              rental_rate,
              length,
              rating
       FROM movie
       WHERE rental_rate > 2
       ORDER BY length DESC
       LIMIT 40) AS top
    GROUP BY top.rating
    ORDER BY avg_length)
select 
    distinct m.rating,
    m2.min_length,
    m2.max_length,
    m2.avg_length,
    m2.min_rental_rate,
    m2.max_rental_rate,
    m2.avg_rental_rate
from m left join m2 using(rating)
order by avg_length


with
y11 as (select 
    extract(month from invoice_date::date) invoice_month,
    count(invoice_id) as year_2011
    from invoice i
    where 
    extract(year from invoice_date::date) = 2011
    group by 
    invoice_month),
y12 as (select 
    extract(month from invoice_date::date) invoice_month,
    count(invoice_id) as year_2012
    from invoice i
    where 
    extract(year from invoice_date::date) = 2012
    group by 
    invoice_month),
y13 as (select 
    extract(month from invoice_date::date) invoice_month,
    count(invoice_id) as year_2013
    from invoice i
    where 
    extract(year from invoice_date::date) = 2013
    group by 
    invoice_month)
select 
    y11.invoice_month,
    y11.year_2011,
    y12.year_2012,
    y13.year_2013
from y11 as y11 
left join y12 as y12 using(invoice_month)
left join y13 as y13 using(invoice_month)


with 
i12 as (select 
    extract(month from invoice_date::timestamp) as month,
    sum(total)
    from invoice i
    where
    extract(year from invoice_date::timestamp) = 2012
    group by month),
i13 as (select 
    extract(month from invoice_date::timestamp) as month,
    sum(total)
    from invoice i
    where
    extract(year from invoice_date::timestamp) = 2013
    group by month)
select
    i12.month,
    i12.sum as sum_total_2012,
    i13.sum as sum_total_2013,
    round(((i13.sum/i12.sum)-1)*100) as perc 
from i12 left join i13 using (month)
order by i12.month