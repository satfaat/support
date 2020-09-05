SELECT 
    name,
    genre 
FROM books
WHERE genre = 
            (SELECT id 
            FROM genre
            WHERE name ='Роман');

SELECT 
    name, 
    genre 
FROM books
WHERE genre IN 
            (SELECT id
            FROM genre
            WHERE name IN ( 'Роман', 'Драма', 'Повесть' ));

SELECT id_product
FROM products_data_all
WHERE (category = 'молоко и сливки' AND price > 120) 
    OR (category = 'масло сливочное и маргарин' AND price > 354);

SELECT distinct user_id
FROM transactions
WHERE id_product in
	(SELECT id_product 
	FROM products_data_all
	WHERE 
	(category='молоко и сливки' AND  price > 120) OR 
	(category='масло сливочное и маргарин' AND price > 354));

