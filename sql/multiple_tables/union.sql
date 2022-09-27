SELECT i.billing_country,
       COUNT(i.total) AS total_purchases
FROM invoice AS i
WHERE i.billing_country IN ('USA',
                            'Germany',
                            'Brazil')
  AND EXTRACT(YEAR
              FROM cast(invoice_date AS date)) = 2009
GROUP BY i.billing_country
UNION
SELECT i.billing_country,
       COUNT(i.total) AS total_purchases
FROM invoice AS i
WHERE i.billing_country IN ('USA',
                            'Germany',
                            'Brazil')
  AND EXTRACT(YEAR
              FROM cast(invoice_date AS date)) = 2013
GROUP BY i.billing_country; 


SELECT i.billing_country,
       COUNT(i.total) AS total_purchases
FROM invoice AS i
WHERE i.billing_country IN ('USA',
                            'Germany',
                            'Brazil')
  AND EXTRACT(YEAR
              FROM cast(invoice_date AS date)) = 2009
GROUP BY i.billing_country
UNION ALL
SELECT i.billing_country,
       COUNT(i.total) AS total_purchases
FROM invoice AS i
WHERE i.billing_country IN ('USA',
                            'Germany',
                            'Brazil')
  AND EXTRACT(YEAR
              FROM cast(invoice_date AS date)) = 2013
GROUP BY i.billing_country; 