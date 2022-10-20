--1. List all customers who live in Texas (use JOINs)
SELECT district 
FROM address
WHERE district = 'Texas';

SELECT first_name, last_name, district
FROM customer c
JOIN address a
ON c.address_id = a.address_id
WHERE district = 'Texas';

--2. List all payments of more than $7.00 with the customer’s first and last name

SELECT first_name, last_name, amount
FROM payment p
JOIN customer c 
ON p.customer_id = c.customer_id 
WHERE amount > 7;

--3. Show all customer names who have made over $175 in payments (use
--subqueries)
SELECT customer_id
FROM payment 
GROUP BY customer_id
HAVING SUM(amount) > 175;

--144
--526
--178
--459
--137
--148

SELECT *
FROM customer
WHERE customer_id IN (
	144,
    526,
    178,
    459,
    137,
    148
);

SELECT *
FROM customer
WHERE customer_id IN (
	SELECT customer_id
	FROM payment 
	GROUP BY customer_id
	HAVING SUM(amount) > 175
);

--4. List all customers that live in Argentina (use the city table)


--5. Show all the film categories with their count in descending order
SELECT c.category_id, c."name", COUNT(*)
FROM category c 
JOIN film_category fc
ON c.category_id = fc.category_id 
GROUP BY c.category_id
ORDER BY COUNT(*) DESC
LIMIT 1;

--6. What film had the most actors in it (show film info)?
SELECT f.film_id, title, COUNT(*)
FROM film f 
JOIN film_actor fa 
ON f.film_id = fa.film_id
GROUP BY f.film_id 
ORDER BY COUNT(f.film_id) DESC
LIMIT 1;

--7. Which actor has been in the least movies?
-- Emily Dee
SELECT *
FROM film_actor 

SELECT actor_id, COUNT (film_id)
FROM film_actor 
GROUP BY actor_id 
ORDER BY COUNT (film_id) ASC  ;


--8. Which country has the most cities?
--9. List the actors who have been in between 20 and 25 films.