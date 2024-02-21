-- Top 10 countries with most customers
SELECT 
  country.country,
  COUNT(customer.customer_id) AS customer_count
FROM customer
INNER JOIN address ON customer.address_id = address.address_id
INNER JOIN city ON address.city_id = city.city_id
INNER JOIN country ON city.country_id = country.country_id
GROUP BY country
ORDER BY customer_count DESC
LIMIT 10;

-- Top 10 cities with most customers from Top 10 countries determined above
SELECT country.country,
  city.city,
  COUNT(customer.customer_id) AS customer_count
FROM customer
INNER JOIN address ON customer.address_id = address.address_id
INNER JOIN city ON address.city_id = city.city_id
INNER JOIN country ON city.country_id = country.country_id
WHERE country IN (
  'India', 'China', 'United States', 'Japan', 'Mexico', 
  'Brazil', 'Russian Federation', 'Philippines', 'Turkey', 'Indonesia'
)
GROUP BY country, city
ORDER BY customer_count DESC
LIMIT 10;

-- Top 5 customers from Top 10 cities determined above
SELECT 
  customer.customer_id,
  CONCAT_WS(' ', customer.first_name, customer.last_name) AS customer_name,
  CONCAT_WS(', ', city.city, country.country) AS customer_location,
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
GROUP BY country.country, city.city, customer_name, customer.customer_id
ORDER BY amount_paid DESC
LIMIT 5;

-- Top 5 customers by revenue
SELECT 
  customer.customer_id,
  CONCAT_WS(' ', customer.first_name, customer.last_name) AS customer_name,
  CONCAT_WS(', ', city.city, country.country) AS customer_location,
  SUM(payment.amount) AS amount_paid
FROM payment
INNER JOIN customer ON payment.customer_id = customer.customer_id
INNER JOIN address ON customer.address_id = address.address_id
INNER JOIN city ON address.city_id = city.city_id
INNER JOIN country ON city.country_id = country.country_id
GROUP BY country.country, city.city, customer_name, customer.customer_id
ORDER BY amount_paid DESC
LIMIT 5;
