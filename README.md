USE sakila;

SELECT 
r.customer_id AS id_cliente,
cat.category_id AS categoria_filme,
COUNT(*) AS total

FROM rental r
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film_category fm ON fm.film_id = i.film_id
JOIN category cat ON fm.category_id = cat.category_id

GROUP BY
r.customer_id,
cat.category_id

ORDER BY
r.customer_id,
total DESC;


Implementação de consulta SQL utilizando operações de JOIN para interligação das tabelas do banco de dados, seguida da aplicação de GROUP BY para agregação dos dados. O resultado apresenta o total de filmes alugados por categoria, segmentado por cliente.
