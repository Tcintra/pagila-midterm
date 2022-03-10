/*
 * You love the acting in the movie 'AMERICAN CIRCUS' and want to watch similar movies.
 * You've already watched all other movies with the same actors,
 * so now you need a new strategy for finding similar movies.
 * You decide that two movies X and Y are similar if they have been rented by the same customer,
 * and you further quantify this similarity by defining the "similarity score" to be the number of distinct customers that have rented both X and Y.
 *
 * Write a SQL SELECT query that:
 * computes the "similarity score" for all movies with 'AMERICAN CIRCUS'
 * and orders the results from highest to lowest.
 *
 * NOTE:
 * Your results should not contain any duplicate titles.
 *
 * NOTE:
 * You do not have to include movies with similarity score 0 in your results (but you may if you like).
 */

SELECT DISTINCT title, count(DISTINCT t.customer_id) AS score
FROM film
JOIN inventory ON (film.film_id = inventory.film_id)
JOIN rental ON (inventory.inventory_id = rental.inventory_id)
JOIN (
    SELECT customer.customer_id
    FROM customer
    JOIN rental ON (customer.customer_id = rental.customer_id)
    JOIN inventory ON (rental.inventory_id = inventory.inventory_id)
    JOIN film ON (inventory.film_id = film.film_id)
    WHERE film.title = 'AMERICAN CIRCUS'
) t ON (rental.customer_id = t.customer_id)
GROUP BY title
ORDER BY score DESC, title;
