SELECT film.title
FROM film
LEFT JOIN inventory ON film.film_id = inventory.film_id
LEFT JOIN rental ON inventory.inventory_id = rental.inventory_id
WHERE rental.return_date IS NULL
  AND film.rating IN ('R', 'PG-13')
  AND film.category IN ('Horror', 'Sci-Fi')
ORDER BY film.title;

SELECT s.store_id, c.city, SUM(p.amount) AS total_sales
FROM payment p
JOIN rental r ON p.rental_id = r.rental_id
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN store s ON i.store_id = s.store_id
JOIN address a ON s.address_id = a.address_id
JOIN city c ON a.city_id = c.city_id
WHERE p.payment_date BETWEEN NOW() - INTERVAL '1 MONTH' AND NOW()
GROUP BY s.store_id, c.city
ORDER BY total_sales DESC;


-- To identify the most expensive step of the query execution plans and propose
-- a solution for it, you can use the EXPLAIN PLAN feature in PostgreSQL. For
-- example, to see the execution plan for the second query, you can run the following code:
EXPLAIN SELECT s.store_id, c.city, SUM(p.amount) AS total_sales
FROM payment p
JOIN rental r ON p.rental_id = r.rental_id
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN store s ON i.store_id = s.store_id
JOIN address a ON s.address_id = a.address_id
JOIN city c ON a.city_id = c.city_id
WHERE p.payment_date BETWEEN NOW() - INTERVAL
