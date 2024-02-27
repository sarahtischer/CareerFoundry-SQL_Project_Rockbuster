-- JOIN queries used to gather insights on revenue details

-- Revenue details by film rating
SELECT
  film.rating,
  COUNT(DISTINCT film.film_id) AS count_of_films,
  COUNT(DISTINCT rental.rental_id) AS count_of_rents,
  SUM(payment.amount) AS total_revenue
FROM film
FULL JOIN inventory ON film.film_id = inventory.film_id
FULL JOIN rental ON inventory.inventory_id = rental.inventory_id
FULL JOIN payment ON rental.rental_id = payment.rental_id
GROUP by rating
ORDER BY total_revenue DESC;

-- Revenue details by film category
SELECT 
  category.name,
  COUNT(DISTINCT film.film_id) AS count_of_films,
  COUNT(DISTINCT rental.rental_id) AS count_of_rents,
  SUM(payment.amount) AS total_revenue
FROM category
FULL JOIN film_category ON category.category_id = film_category.category_id
FULL JOIN film ON film_category.film_id = film.film_id
FULL JOIN inventory ON film_category.film_id = inventory.film_id
FULL JOIN rental ON inventory.inventory_id = rental.inventory_id
FULL JOIN payment ON rental.rental_id = payment.rental_id
GROUP by category.name
ORDER BY count_of_rents DESC, count_of_films DESC;

-- Most revenue by film title
SELECT 
  film.title,
  category.name AS category,
  SUM(payment.amount) AS total_amount
FROM film
INNER JOIN inventory ON film.film_id = inventory.film_id
INNER JOIN rental ON inventory.inventory_id = rental.inventory_id
INNER JOIN payment ON rental.rental_id = payment.rental_id
INNER JOIN film_category ON film.film_id = film_category.film_id
INNER JOIN category ON film_category.category_id = category.category_id
GROUP BY film.title, category.name
ORDER BY SUM(payment.amount) DESC
LIMIT 10;

-- Least revenue by film title
SELECT 
  film.title,
  category.name AS category,
  SUM(payment.amount) AS total_amount
FROM film
INNER JOIN inventory ON film.film_id = inventory.film_id
INNER JOIN rental ON inventory.inventory_id = rental.inventory_id
INNER JOIN payment ON rental.rental_id = payment.rental_id
INNER JOIN film_category ON film.film_id = film_category.film_id
INNER JOIN category ON film_category.category_id = category.category_id
GROUP BY film.title, category.name
ORDER BY SUM(payment.amount) ASC
LIMIT 10;
