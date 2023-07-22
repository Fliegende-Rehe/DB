-- Query 1: create indexes on various tables
CREATE INDEX idx_customer_actor_first_name ON customer (first_name);
CREATE INDEX idx_rental_customer_id_inventory_id ON rental (customer_id, inventory_id);
CREATE INDEX idx_inventory_film_id ON inventory (film_id);
CREATE INDEX idx_film_film_id ON film (film_id);
CREATE INDEX idx_film_category_film_id ON film_category (film_id);
CREATE INDEX idx_category_category_id ON category (category_id);
CREATE INDEX idx_payment_rental_id ON payment (rental_id);

-- Query 2: create additional indexes on rental, payment, film, and inventory tables
CREATE INDEX idx_rental_customer_id_rental_date ON rental (customer_id, rental_date);
CREATE INDEX idx_rental_inventory_id_rental_date ON rental (inventory_id, rental_date);
CREATE INDEX idx_payment_rental_id ON payment (rental_id);
CREATE INDEX idx_film_film_id ON film (film_id);
CREATE INDEX idx_inventory_film_id ON inventory (film_id);

-- Query 3: create more indexes on rental, customer, and payment tables
CREATE INDEX idx_rental_rental_id ON rental (rental_id);
CREATE INDEX idx_rental_last_update ON rental (last_update);
CREATE INDEX idx_customer_customer_id ON customer (customer_id);
CREATE INDEX idx_customer_active_last_update ON customer (active, last_update);
CREATE INDEX idx_payment_rental_id ON payment (rental_id);

-- Query 4: create an index on the film table with specific columns and conditions
CREATE INDEX idx_film_rating_language_id ON film (rating, language_id);
CREATE INDEX idx_film_category_film_id ON film_category (film_id);
CREATE INDEX idx_category_name_category_id ON category (name, category_id);
CREATE INDEX idx_film_rental_rate_length_category_id ON film (rating, language_id, category_id, rental_rate DESC, length ASC)
    WHERE rating IN ('G', 'PG') AND language_id = 1 AND category_id IN (1, 7);