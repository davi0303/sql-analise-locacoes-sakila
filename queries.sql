USE sakila;

-- 1. Total de locações por cliente
SELECT 
    c.customer_id,
    c.first_name,
    c.last_name,
    COUNT(r.rental_id) AS total_locacoes
FROM customer c
JOIN rental r ON c.customer_id = r.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY total_locacoes DESC;


-- 2. Categorias mais alugadas
SELECT 
    cat.name AS categoria,
    COUNT(r.rental_id) AS total_alugueis
FROM rental r
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film_category fc ON i.film_id = fc.film_id
JOIN category cat ON fc.category_id = cat.category_id
GROUP BY cat.name
ORDER BY total_alugueis DESC;


-- 3. Receita por cliente
SELECT 
    c.customer_id,
    c.first_name,
    c.last_name,
    SUM(p.amount) AS receita_total
FROM customer c
JOIN payment p ON c.customer_id = p.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY receita_total DESC;


-- 4. Clientes por cidade
SELECT 
    ci.city,
    COUNT(c.customer_id) AS total_clientes
FROM customer c
JOIN address a ON c.address_id = a.address_id
JOIN city ci ON a.city_id = ci.city_id
GROUP BY ci.city
ORDER BY total_clientes DESC;
