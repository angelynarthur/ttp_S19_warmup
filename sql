-- SEE HOW MANY YOU CAN GET THROUGH BY 10am :) 

-- What's the title and ID of the longest film?
-- BONUS points if you use a subquery :) 

SELECT title, film_id, length 
FROM film
WHERE length = (SELECT MAX(length) FROM film);


-- What is the title and ID of the film with the lowest replacement cost?
-- BONUS points if you use a subquery :) 

SELECT title, film_id, replacement_cost 
 FROM film
WHERE replacement_cost = (SELECT MIN(replacement_cost) FROM film);


-- What is the tile and ID of the film with the highest rental_rate?

SELECT title, film_id
FROM film 
WHERE rental_rate = (SELECT MAX(rental_rate) FROM film);

-- Show the payment_id's of all transactions after or on May 1st 2007

SELECT payment_id, payment_date
FROM payment
WHERE payment_date > =‘2017-05-01'; 

-- Show all payment ID's and payment date's with a transaction amount less than $3.

SELECT payment_id, payment_date, amount
FROM payment
WHERE amount < 3;

-- Get the emails of all customers that shop at store 1 that are inactive (use 'active')

SELECT email
FROM customer
WHERE store_id = 1 AND active = 0;

--How much have these customers spent? (Use code from the previous query to
-- make a subquery or a CTE to solve this one.) 

SELECT email, SUM(payment.amount)
FROM customer INNER JOIN payment on customer.customer_id = payment.customer_id
WHERE (SELECT store_id = 1 AND active = 0)
GROUP BY email;


