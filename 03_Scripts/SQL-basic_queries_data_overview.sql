-- Basic queries to obtain a general overview on various variables

-- Distinct languages in the inventory
SELECT DISTINCT language.name
FROM inventory
JOIN film ON inventory.film_id = film.film_id
JOIN language ON film.language_id = language.language_id;

-- Count of languages in the inventory
SELECT COUNT(DISTINCT language.name)
FROM inventory
JOIN film ON inventory.film_id = film.film_id
JOIN language ON film.language_id = language.language_id;

-- Titles in the inventory
SELECT COUNT(DISTINCT film.title)
FROM inventory
FULL JOIN film ON inventory.film_id = film.film_id;

-- Cities & countries in store database
SELECT DISTINCT city.city, country.country
FROM store
JOIN address ON store.address_id = address.address_id
JOIN city ON address.city_id = city.city_id
JOIN country ON city.country_id = country.country_id;

-- Distinct countries in database
SELECT COUNT(DISTINCT country.country)
FROM country;

-- Active customers
SELECT COUNT(DISTINCT customer.customer_id)
FROM customer
WHERE active = '1';

-- Total revenue
SELECT SUM(amount) FROM payment;

-- Total rentals
SELECT COUNT(DISTINCT rental_id) FROM rental;
