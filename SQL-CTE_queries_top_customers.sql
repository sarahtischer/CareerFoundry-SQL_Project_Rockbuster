-- Queries using Common Table Expressions to evaluate details about the top 5 customers

-- Finding average amount paid by the top 5 customers from top 10 cities
WITH total_amount_paid (customer_id, first_name, last_name, city, country, amount_paid) AS (
	SELECT customer.customer_id,
		customer.first_name,
		customer.last_name,
		city.city,
		country.country,
	SUM(payment.amount) AS amount_paid
	FROM payment
	INNER JOIN customer ON payment.customer_id = customer.customer_id
	INNER JOIN address ON customer.address_id = address.address_id
	INNER JOIN city ON address.city_id = city.city_id
	INNER JOIN country ON city.country_id = country.country_id
	WHERE city IN (
		'Aurora', 'Acua', 'Citrus Heights', 'Iwaki', 'Ambattur',
		'Shanwei', 'So Leopoldo', 'Teboksary', 'Tianjin', 'Cianjur'
	)
	GROUP BY customer.customer_id, first_name, last_name, city, country
	ORDER BY amount_paid DESC
	LIMIT 5
)

SELECT AVG(amount_paid) AS average
FROM total_amount_paid;

-- Finding out how many of the top 5 customers are based within each country
WITH top_5_customers (customer_id, first_name, last_name, city, country, amount_paid) AS (
	SELECT customer.customer_id,
		customer.first_name,
		customer.last_name,
		city.city,
		country.country,
	SUM(payment.amount) AS amount_paid
	FROM payment
	INNER JOIN customer ON payment.customer_id = customer.customer_id
	INNER JOIN address ON customer.address_id = address.address_id
	INNER JOIN city ON address.city_id = city.city_id
	INNER JOIN country ON city.country_id = country.country_id
	WHERE city IN (
		'Aurora', 'Acua', 'Citrus Heights', 'Iwaki', 'Ambattur',
		'Shanwei', 'So Leopoldo', 'Teboksary', 'Tianjin', 'Cianjur'
	)
	GROUP BY customer.customer_id, first_name, last_name, city, country
	ORDER BY amount_paid DESC
	LIMIT 5
)
	
SELECT country.country,
	COUNT(DISTINCT customer.customer_id) AS all_customer_count,
	COUNT(DISTINCT top_5_customers.customer_id) AS top_customer_count
FROM country
INNER JOIN city ON country.country_id = city.country_id
INNER JOIN address ON city.city_id = address.city_id
INNER JOIN customer ON address.address_id = customer.address_id
LEFT JOIN top_5_customers ON customer.customer_id = top_5_customers.customer_id
GROUP BY country.country
ORDER BY top_customer_count DESC;
