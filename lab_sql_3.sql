USE sakila;

#1. How many distinct (different) actors' last names are there?
SELECT COUNT(DISTINCT(last_name)) FROM actor;


#2. In how many different languages where the films originally produced? (Use the column language_id from the film table)
SELECT COUNT(DISTINCT(language_id)) FROM film;


#3. How many movies were released with "PG-13" rating?
SELECT COUNT(rating) AS PG_13_movies FROM film
WHERE rating = 'PG-13';


#4. Get 10 the longest movies from 2006.
SELECT title, length, release_year FROM film
WHERE release_year = 2006
ORDER BY length DESC
LIMIT 10;


#5. How many days has been the company operating (check DATEDIFF() function)?

SELECT rental_id, DATE_FORMAT(rental_date,"%Y-%m-%d") AS first_rental_date, datediff('2005-05-24',DATE_FORMAT(rental_date,"%Y-%m-%d")) AS days_of_dif
FROM rental
ORDER BY rental_date DESC
LIMIT 1;


#6. Show rental info with additional columns month and weekday. Get 20.
SELECT customer_id, DATE_FORMAT(rental_date, '%M') AS month, 
DATE_FORMAT(rental_date, '%D') AS weekday FROM rental
LIMIT 20;


#7. Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.

SELECT *, 
CASE
	WHEN (DAYNAME(rental_date) = "Saturday" OR DAYNAME(rental_date) = 'Sunday') THEN "weekend"
	ELSE "workday"
    END as day_date
FROM rental;


#8. How many rentals were in the last month of activity?
SELECT COUNT(DISTINCT(rental_id)) AS number_of_rentals FROM rental
WHERE rental_date LIKE '2006-02%';
