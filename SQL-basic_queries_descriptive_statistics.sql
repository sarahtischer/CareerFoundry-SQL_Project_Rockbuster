-- Basic queries to obtain descriptive statistics on various variables

-- Descriptive statistics of rental duration, rental rate, film length, and replacements costs
SELECT 
  MIN(rental_duration) AS min_rent_duration,
  MAX(rental_duration) AS max_rent_duration,
  AVG(rental_duration) AS avg_rent_duration,
  MIN(rental_rate) AS min_rental_rate,
  MAX(rental_rate) AS max_rental_rate,
  AVG(rental_rate) AS avg_rental_rate,
  MIN(length) AS min_length,
  MAX(length) AS max_length,
  AVG(length) AS avg_length,
  MIN(replacement_cost) AS min_replace_cost,
  MAX(replacement_cost) AS max_replace_cost,
  AVG(replacement_cost) AS avg_replace_cost
FROM film;
