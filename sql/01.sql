/*
 * You want to watch a movie tonight.
 * But you're superstitious,
 * and don't want anything to do with the letter 'F'.
 * List the titles of all movies that:
 * 1) do not have the letter 'F' in their title,
 * 2) have no actors with the letter 'F' in their names (first or last),
 * 3) have never been rented by a customer with the letter 'F' in their names (first or last).
 *
 * NOTE:
 * Your results should not contain any duplicate titles.
 */

SELECT DISTINCT film.title
FROM film 
WHERE film.title NOT IN (
    SELECT title
    FROM film
    JOIN film_actor ON (film.film_id = film_actor.film_id)
    JOIN actor USING (actor_id)
    WHERE STRPOS(actor.first_name, 'F') > 0
      OR STRPOS(actor.last_name, 'F') > 0
) 
  AND film.title NOT IN (
    SELECT title
    FROM film
    JOIN inventory ON (film.film_id = inventory.film_id)
    JOIN rental ON (inventory.inventory_id = rental.inventory_id)
    JOIN customer ON (rental.customer_id = customer.customer_id)
    WHERE STRPOS(customer.first_name, 'F') > 0
      OR STRPOS(customer.last_name, 'F') > 0
)
  AND STRPOS(title, 'F') <= 0
ORDER BY title;
