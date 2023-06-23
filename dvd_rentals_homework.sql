
-- 1. List all customers who live in Texas (use JOINs)

SELECT customer_id, first_name, last_name
FROM customer
FULL JOIN address
ON customer.address_id = address.address_id
WHERE district = 'Texas';

-- Answer: There are 5 people who are Jennifer Davis, Kim Cruz, Richard Mccrary, Bryan Hardison, Ian Still

-- 2. Get all payments above $6.99 with the Customer's Full Name

SELECT payment.customer_id, first_name, last_name, payment.amount
FROM payment
FULL JOIN customer
ON payment.customer_id = customer.customer_id
WHERE payment.amount > 6.99;

-- Answer: There are 1406 payments

-- 3. Show all customers names who have made payments over $175(use subqueries)

SELECT customer_id, first_name, last_name
FROM customer
WHERE customer_id IN(
	SELECT customer_id
	FROM payment
	GROUP BY customer_id
	HAVING SUM(amount) > 175
	ORDER BY SUM(amount)
);

-- Answer: There are 6 customers that have made payments over $175: Rhonda Kennedy, Clara Shaw, Eleanor Hunt, Marion Snyder, Tommy Collazo, Karl Seal

-- 4. List all customers that live in Nepal (use the city table)

SELECT customer_id, first_name, last_name
FROM customer
FULL JOIN address
ON customer.address_id = address.address_id
FULL JOIN city
ON address.city_id = city.city_id
FULL JOIN country
ON city.country_id = country.country_id
WHERE country = 'Nepal'

-- Answer: There is one customer that lives in Nepal: Kevin Schuler

-- 5. Which staff member had the most transactions?

SELECT payment.staff_id, staff.first_name, staff.last_name, COUNT(payment.amount)
FROM payment
FULL JOIN staff
ON payment.staff_id = staff.staff_id
GROUP BY payment.staff_id, staff.first_name, staff.last_name;

-- Answer: Jon Stephens (staff id 2) got 7304 transactions

-- 6. How many movies of each rating are there?

SELECT rating, COUNT(rating)
FROM film
GROUP BY rating;

-- Answer: G: 178, PG-13: 223, PG: 194, R: 195, NC-17:210

-- 7.Show all customers who have made a single payment above $6.99 (Use Subqueries)

SELECT customer_id, first_name, last_name
FROM customer
WHERE customer_id IN(
	SELECT customer_id
	FROM payment
	WHERE amount > 6.99
	GROUP BY customer_id
	HAVING COUNT(*) = 1
)
ORDER BY customer_id;


-- Answer: there are 130 customers who have made a single payment above $6.99

-- 8. How many free rentals did our stores give away?

SELECT amount, COUNT(amount)
FROM payment
GROUP BY amount
HAVING amount = 0;

-- Answer: There are 24 free rentals ($0)