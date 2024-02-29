-- JOIN queries used to gain insight into geographic sales data

-- Sales figures by country
SELECT
  country.country,
  COUNT(customer.customer_id) AS customer_count,
  SUM(payment.amount) AS amount_paid
FROM payment
INNER JOIN rental ON payment.rental_id = rental.rental_id
INNER JOIN customer ON rental.customer_id = customer.customer_id
INNER JOIN address ON customer.address_id = address.address_id
INNER JOIN city ON address.city_id = city.city_id
INNER JOIN country ON city.country_id = country.country_id
GROUP BY country
ORDER BY customer_count DESC;

-- Store locations worldwide
SELECT DISTINCT city.city, country.country
FROM store
JOIN address ON store.address_id = address.address_id
JOIN city ON address.city_id = city.city_id
JOIN country ON city.country_id = country.country_id;
