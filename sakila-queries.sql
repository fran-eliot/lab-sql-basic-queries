-- 1. Display all available tables in the Sakila database.
USE sakila;
SHOW TABLES;
-- 2. Retrieve all the data from the tables `actor`, `film` and `customer.
SELECT *
FROM actor;
SELECT *
FROM film;
SELECT *
FROM customer;
-- 3. Retrieve the following columns from their respective tables:
--	- 3.1 Titles of all films from the `film` table
SELECT film.title
FROM film;
--	- 3.2 List of languages used in films, with the column aliased as `language` from the `language` table
SELECT 
    film.title,
    language.name AS language
FROM 
    film
JOIN 
    language ON film.language_id = language.language_id;
--	- 3.3 List of first names of all employees from the `staff` table
SELECT first_name FROM staff;
-- 4. Retrieve unique release years.
SELECT DISTINCT film.release_year
FROM film;
-- 5. Counting records for database insights:
--	- 5.1 Determine the number of stores that the company has.
SELECT count(*) as 'number of stores' FROM store;
--	- 5.2 Determine the number of employees that the company has.
SELECT count(*) as 'number of employees' FROM staff;
--	- 5.3 Determine how many films are available for rent and how many have been rented.
SELECT COUNT(*) AS 'films available for rent' FROM inventory;
SELECT COUNT(DISTINCT inventory_id) AS 'films rented at least once' FROM rental;
SELECT COUNT(DISTINCT i.film_id) AS 'distinct films rented'
FROM rental r
JOIN inventory i ON r.inventory_id = i.inventory_id;
--	- 5.4 Determine the number of distinct last names of the actors in the database.
SELECT count(DISTINCT last_name) as 'number of distinct last names' FROM actor;
-- 6. Retrieve the 10 longest films.
SELECT film.title, film.length FROM film
ORDER BY film.length DESC
LIMIT 10;
-- 7.  Use filtering techniques in order to:
--	- 7.1 Retrieve all actors with the first name "SCARLETT".
SELECT * FROM actor WHERE first_name LIKE 'SCARLETT';
-- 	- 7.2 Retrieve all movies that have ARMAGEDDON in their title and have a duration longer than 100 minutes.
SELECT * FROM film WHERE title LIKE '%ARMAGEDDON%' AND length>100;
-- 	- 7.3 Determine the number of films that include Behind the Scenes content
SELECT count(*) as 'number of films that include Behind the Scenes content' FROM film WHERE special_features LIKE '%Behind the Scenes%';
