SELECT customer_id
FROM client
WHERE customer_id IN (SELECT customer_id
                      FROM invoice
                      GROUP BY customer_id
                      ORDER BY SUM(total) DESC
                      LIMIT 10); 


SELECT *
FROM (SELECT i.customer_id
      FROM invoice AS i 
      INNER JOIN client AS c ON i.customer_id = c.customer_id
      GROUP BY i.customer_id
      ORDER BY SUM(total) DESC
      LIMIT 10) AS c_1
ORDER BY c_1.customer_id; 