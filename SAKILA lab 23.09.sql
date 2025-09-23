-- Q1
use sakila;
-- Q2
SELECT * FROM actor;
SELECT * FROM film;
SELECT * FROM customer;
 
-- Q3
SELECT title FROM film;
 
-- Q4
SELECT DISTINCT name AS language
FROM language;
 
-- Q5.1
SELECT COUNT(*) AS total_stores
FROM store;
 
-- Q5.2
SELECT COUNT(*) AS total_employees
FROM staff;
 
-- Q5.3
SELECT first_name, last_name
FROM staff;
 
-- Q6
SELECT * 
FROM actor
WHERE first_name = 'Scarlett';
 
-- Q7
SELECT * 
FROM actor
WHERE last_name = 'Johansson';
 
-- Q8
SELECT COUNT(*) AS available_for_rent
FROM film
WHERE rental_duration > 0;
 
-- Q9
SELECT COUNT(DISTINCT rental_id) AS rented_films
FROM rental;
 
-- Q10
SELECT MIN(rental_duration) AS min_rental, MAX(rental_duration) AS max_rental
FROM film;
 
-- Q11
SELECT MIN(length) AS min_duration, MAX(length) AS max_duration
FROM film;
 
-- Q12
SELECT AVG(length) AS avg_duration
FROM film;
 
-- Q13
SELECT CONCAT(FLOOR(AVG(length)/60), ' hours, ', AVG(length)%60, ' minutes') AS avg_duration_hm
FROM film;
 
-- Q14
SELECT COUNT(*) AS films_over_3h
FROM film
WHERE length > 180;
 
-- Q15
SELECT CONCAT(first_name, ' ', UPPER(last_name), ' - ', email) AS formatted_customer
FROM customer;
 
-- Q16
SELECT title, length AS duration
FROM film
ORDER BY LENGTH(title) DESC
LIMIT 1;