-- 1. How many actors are there with the last name 'Wahlberg'?
SELECT COUNT(last_name)
FROM actor
WHERE last_name LIKE 'Wahlberg';
-- Answer: 2

-- 2. How many payments were made between $3.99 and $5.99?
SELECT COUNT(amount)
FROM payment
WHERE amount BETWEEN 3.99 AND 5.99;
-- Answer: 5607

-- 3. What film does the store have the most of? (search in inventory)
SELECT film_id, COUNT(film_id)
FROM inventory
GROUP BY film_id
ORDER BY COUNT(film_id) DESC;
-- Answer: There are 72 films that the store have the most of 8

-- 4. How many customers have the last name 'William'?
SELECT COUNT(last_name)
FROM customer
WHERE last_name LIKE 'William';
-- Answer: 0

-- 5. What store employee (get the id) sold the most rentals?
SELECT staff_id, COUNT(staff_id)
FROM rental
GROUP BY staff_id
ORDER BY staff_id;
-- Answer: 1 - 8040

-- 6. How many different district names are there?
SELECT COUNT(DISTINCT district)
FROM address;
-- Answer: 378

-- 7. What film has the most actors in it?
SELECT film_id, COUNT(DISTINCT actor_id)
FROM film_actor
GROUP BY film_id
ORDER BY COUNT(DISTINCT actor_id) DESC;
-- Answer: film_id 508 - 15 actors

-- 8. From store_id 1, how many customers have a last name ending with 'es'?
SELECT COUNT(last_name)
FROM customer
WHERE store_id = 1 AND last_name LIKE '%es';
-- Answer: 13

-- 9. How many payment amounts (4.99, 5.99, etc.) 
-- had a number of rentals above 250 for customers with ids between 380 and 430?
SELECT amount, COUNT(amount)
FROM payment
WHERE customer_id BETWEEN 380 AND 430
GROUP BY amount
HAVING COUNT(amount) > 250;
-- Answer: 3 which are 2.99 for 290 rentals, 4.99 for 281 rentals and 0.99 for 269 rentals

-- 10. Within the film table, how many rating categories are there?
-- And what rating has the most movies total?
SELECT rating, COUNT(rating)
FROM film
GROUP BY rating
ORDER BY COUNT(rating) DESC;
-- Answer: 5 rating, PG-13 has the most (223 movies)