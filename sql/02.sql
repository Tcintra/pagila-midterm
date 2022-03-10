/*
 * Count the number of distinct customers who have rented a movie that 'RUSSELL BACALL' has acted in.
 *
 * NOTE:
 * You cannot hard-code Russell Bacall's actor_id.
 * You're where clause must include a condition using the "first_name" and "last_name" fields of the "actor" table.
 */

SELECT count(DISTINCT customer.customer_id)
FROM customer
JOIN rental ON (customer.customer_id = rental.customer_id)
JOIN inventory ON (rental.inventory_id = inventory.inventory_id)
JOIN film ON (inventory.film_id = film.film_id)
JOIN film_actor ON (film.film_id = film_actor.film_id)
JOIN actor ON (film_actor.actor_id = actor.actor_id)
WHERE actor.first_name = 'RUSSELL' AND actor.last_name = 'BACALL';
