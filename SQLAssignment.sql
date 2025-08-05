create database Assignment1;
use Assignment1;
-- Que7.Write a query to fetch the student_name and class_name for each student using an INNER JOIN.
create table students(student_id int,student_name char(20), class_id int);
INSERT INTO  students (student_id,student_name,class_id)
VALUES
(1,'Alice',101),
(2,'Bob',102),
(3,'Chrlie',103);
select * from students;
create table classes( class_id int , class_name varchar(50));
INSERT INTO classes (class_id, class_name)
values
(101, 'Math'),
(102, 'Science'),
(103, 'History');
SELECT * FROM classes;

SELECT 
    students.student_name,
    classes.class_name
FROM 
    students
INNER JOIN 
    classes
ON 
    students.class_id = classes.class_id;


---- Que8.Consider the following three tables:
USE ASSIGNMENT1;
create table orders(order_id int, order_date date, customer_id int);
insert into orders(order_id,order_date,customer_id)
values
(1,2024-01-01,101),
(2,2024-01-03,102);
select * from orders;

create table customers(customer_id int, customer_name char(20));
insert into customers(customer_id,customer_name)
values
(101,"Alice"),
(102,"Bob");
select * from customers;





create table products(product_id int, product_name char(20),order_id int);
INSERT INTO products(product_id, product_name, order_id)
VALUES
    (1, 'laptop', 1),
    (2, 'phone', NULL);

SELECT * FROM products;
SELECT 
    p.order_id,
    c.customer_name,
    p.product_name
FROM 
    products p
LEFT JOIN 
    orders o ON p.order_id = o.order_id
LEFT JOIN 
    customers c ON o.customer_id = c.customer_id;
    
-- Que9. Given the following tables:Write a query to find the total sales amount for each product using an INNER JOIN and the SUM() function. 

use Assignment1;
create table sales (sales_id int, product_id int, amount int);  
INSERT INTO sales(sales_id, product_id, amount)
values
(1,101,500),
(2,102,300),
(3,101,700);
select * from sales;

-- product table
create table products_new(product_id int , product_name char(20));
insert into products_new(product_id,product_name)
values
(101,'laptop'),
(102,'phone');
 select * from products_new;
 
  SELECT 
    p.product_name,
    SUM(s.amount) AS total_sales
FROM 
    sales s
INNER JOIN 
    products_new p ON s.product_id = p.product_id
GROUP BY 
    p.product_name;

    
 -- Que10. You are given three tables:Write a query to display the order_id, customer_name, and the quantity of products ordered by each customer using an INNER JOIN between all three tables.   
    use assignment1;
    create table orders_new(order_id int, order_date date, customer_id int);
    insert into orders_new(order_id,order_date,customer_id)
    values
    (1,'2024-01-02',1),
    (2,'2024-01-05',2);
    select * from orders_new;
    
    --  create customers table
    create table customers_new(customer_id int, customer_name char(20));
    insert into customers_new(customer_id,customer_name)
    values
    (1,'Alice'),
    (2,'Bob');
    select * from customers_new;
    
    --  ctreate table order_details
    create table order_details( oredr_id int, product_id int, quantity int);
    insert into order_details(oredr_id,product_id,quantity)
    values
    (1,101,2),
    (1,102,1),
    (2,101,3);
    select * from order_details;
    --  final solution
    SELECT 
    o.order_id,
    c.customer_name,
    od.quantity
FROM 
    orders_new o
INNER JOIN 
    customers_new c ON o.customer_id = c.customer_id
INNER JOIN 
    order_details od ON o.order_id = od.oredr_id;

 --    SQL Commands
 -- 1-Identify the primary keys and foreign keys in maven movies db. Discuss the differences
use sakila;
SELECT 
    TABLE_NAME, 
    COLUMN_NAME, 
    CONSTRAINT_NAME
FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE
WHERE CONSTRAINT_NAME = 'PRIMARY'
  AND TABLE_SCHEMA = 'sakila';

-- finding all foregin keys 
SELECT 
    TABLE_NAME,
    COLUMN_NAME,
    CONSTRAINT_NAME,
    REFERENCED_TABLE_NAME,
    REFERENCED_COLUMN_NAME
FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE
WHERE REFERENCED_TABLE_NAME IS NOT NULL
  AND TABLE_SCHEMA = 'sakila';

-- 2- List all details of actors
select * from actor;

-- 3 -List all customer information from DB.
select * from customer;

-- 4 -List different countries.
select * from country;

-- 5 -Display all active customers.
select * from customer
where active = 1;

-- 6 -List of all rental IDs for customer with ID 1.
select * from rental
where customer_id = 1;

-- 7 - Display all the films whose rental duration is greater than 5 .
select * from film
where rental_duration > 5 ;

-- 8 - List the total number of films whose replacement cost is greater than $15 and less than $20.

SELECT COUNT(*) AS total_films
FROM film
WHERE replacement_cost > 15 AND replacement_cost < 20;
-- total films=214

-- 9 - Display the count of unique first names of actors.
SELECT COUNT(DISTINCT first_name) AS unique_first_names
FROM actor;

-- 10- Display the first 10 records from the customer table .
select * from customer
limit 10;

-- 11 - Display the first 3 records from the customer table whose first name starts with ‘b’.
select * from customer 
where first_name like 'b%'
limit 3;

-- 12 -Display the names of the first 5 movies which are rated as ‘G’.
select title from  film
where rating = 'G'
limit 5;

-- 13-Find all customers whose first name starts with "a".
select * from customer
where first_name like 'a%';

-- 14- Find all customers whose first name ends with "a".
select * from customer
where first_name like '%a';

-- 15- Display the list of first 4 cities which start and end with ‘a’ .
select * from  city
where city like 'a%a'
limit 4;

 -- 16- Find all customers whose first name have "NI" in any position.   
 select * from customer 
 where first_name like '%ni%';
 
 -- 17- Find all customers whose first name have "r" in the second position .
 SELECT *
FROM customer
WHERE first_name LIKE '_r%';

-- 18 - Find all customers whose first name starts with "a" and are at least 5 characters in length
select * from customer 
where first_name like 'a%'
and length(first_name)>=5;
    
-- 19- Find all customers whose first name starts with "a" and ends with "o".    
select * from customer 
where first_name like 'a%o';

-- 20 - Get the films with pg and pg-13 rating using IN operator.
SELECT *
FROM film
WHERE rating IN ('PG', 'PG-13');


-- 21 - Get the films with length between 50 to 100 using between operator.
SELECT *
FROM film
WHERE length BETWEEN 50 AND 100;

-- 22 - Get the top 50 actors using limit operator.
select * from film_actor
limit 50;

-- 23 - Get the distinct film ids from inventory table.
select distinct film_id from inventory;

-- FUNCTIONS
-- Basic Aggregate Functions:
-- Question 1: Retrieve the total number of rentals made in the Sakila database. Hint: Use the COUNT() function.
use sakila;
SELECT COUNT(*) AS total_rentals
FROM rental;

-- Question 2: Find the average rental duration (in days) of movies rented from the Sakila database. Hint: Utilize the AVG() function.
select avg(rental_duration) as average_rental_duration
from film;

-- String Functions: 
-- Question 3: Display the first name and last name of customers in uppercase. Hint: Use the UPPER () function.
select 
upper(first_name) as first_name_upper,
upper(last_name) as last_name_upper
from customer;

-- Question 4: Extract the month from the rental date and display it alongside the rental ID. Hint: Employ the MONTH() function.
select * from rental;
select rental_id,
month(rental_date) as month_rental_date
from rental;
    
-- GROUP BY:
 -- Question 5: Retrieve the count of rentals for each customer (display customer ID and the count of rentals). Hint: Use COUNT () in conjunction with GROUP BY.    
SELECT 
    customer_id,
    COUNT(*) AS rental_count
FROM rental
GROUP BY customer_id;

-- Question 6: Find the total revenue generated by each store. Hint: Combine SUM() and GROUP BY.
SELECT 
    s.store_id,
    SUM(p.amount) AS total_revenue
FROM payment p
JOIN staff s ON p.staff_id = s.staff_id
GROUP BY s.store_id;

-- Question 7: Determine the total number of rentals for each category of movies. Hint: JOIN film_category, film, and rental tables, then use cOUNT () and GROUP BY.
SELECT 
    c.name AS category_name,
    COUNT(r.rental_id) AS total_rentals
FROM category c
JOIN film_category fc ON c.category_id = fc.category_id
JOIN film f ON fc.film_id = f.film_id
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
GROUP BY c.name
ORDER BY total_rentals DESC;

-- Question 8: Find the average rental rate of movies in each language. Hint: JOIN film and language tables, then use AVG () and GROUP BY.
SELECT 
    l.name AS language_name,
    AVG(f.rental_rate) AS average_rental_rate
FROM film f
JOIN language l ON f.language_id = l.language_id
GROUP BY l.name;

-- Questions 9 - Display the title of the movie, customer s first name, and last name who rented it. Hint: Use JOIN between the film, inventory, rental, and customer tables.
SELECT 
    f.title AS movie_title,
    c.first_name,
    c.last_name
FROM rental r
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film f ON i.film_id = f.film_id
JOIN customer c ON r.customer_id = c.customer_id;

-- Question 10: Retrieve the names of all actors who have appeared in the film "Gone with the Wind." Hint: Use JOIN between the film actor, film, and actor tables.
SELECT 
    a.first_name,
    a.last_name
FROM film f
JOIN film_actor fa ON f.film_id = fa.film_id
JOIN actor a ON fa.actor_id = a.actor_id
WHERE f.title = 'Gone with the Wind';

-- Question 11: Retrieve the customer names along with the total amount they've spent on rentals. Hint: JOIN customer, payment, and rental tables, then use SUM() and GROUP BY.
SELECT 
    c.first_name,
    c.last_name,
    SUM(p.amount) AS total_spent
FROM customer c
JOIN payment p ON c.customer_id = p.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY total_spent DESC;

-- Question 12: List the titles of movies rented by each customer in a particular city (e.g., 'London'). Hint: JOIN customer, address, city, rental, inventory, and film tables, then use GROUP BY.
select
c.first_name,
c.last_name,
f.title as movie_title
from customer c
join address a on c.address_id = a.address_id
join city ci on a.city_id = ci.city_id
join rental r on c.customer_id = r.customer_id
join inventory i on r.inventory_id = i.inventory_id
join film f on i.film_id = f.film_id
WHERE ci.city = 'London'
ORDER BY c.first_name, f.title;

-- Question 13: Display the top 5 rented movies along with the number of times they've been rented. Hint: JOIN film, inventory, and rental tables, then use COUNT () and GROUP BY, and limit the results.
SELECT 
    f.title AS movie_title,
    COUNT(r.rental_id) AS times_rented
FROM film f
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
GROUP BY f.film_id, f.title
ORDER BY times_rented DESC
LIMIT 5;

-- Question 14: Determine the customers who have rented movies from both stores (store ID 1 and store ID 2). Hint: Use JOINS with rental, inventory, and customer tables and consider COUNT() and GROUP BY.
SELECT 
    c.customer_id,
    c.first_name,
    c.last_name
FROM customer c
JOIN rental r ON c.customer_id = r.customer_id
JOIN inventory i ON r.inventory_id = i.inventory_id
GROUP BY c.customer_id, c.first_name, c.last_name
HAVING COUNT(DISTINCT i.store_id) = 2;

-- Windows Function:
-- 1. Rank the customers based on the total amount they've spent on rentals.
SELECT 
    c.customer_id,
    c.first_name,
    c.last_name,
    SUM(p.amount) AS total_spent,
    RANK() OVER (ORDER BY SUM(p.amount) DESC) AS spending_rank
FROM customer c
JOIN payment p ON c.customer_id = p.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY spending_rank;

-- 2. Calculate the cumulative revenue generated by each film over time.
SELECT 
    f.title AS film_title,
    DATE(r.rental_date) AS rental_date,
    p.amount AS daily_revenue,
    SUM(p.amount) OVER (
        PARTITION BY f.film_id 
        ORDER BY DATE(r.rental_date)
    ) AS cumulative_revenue
FROM film f
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
JOIN payment p ON r.rental_id = p.rental_id
ORDER BY f.title, rental_date;

-- 3. Determine the average rental duration for each film, considering films with similar lengths.
SELECT 
    CONCAT(FLOOR(length / 10) * 10, '-', FLOOR(length / 10) * 10 + 9) AS length_range,
    AVG(rental_duration) AS avg_rental_duration
FROM film
GROUP BY CONCAT(FLOOR(length / 10) * 10, '-', FLOOR(length / 10) * 10 + 9)
ORDER BY CONCAT(FLOOR(length / 10) * 10, '-', FLOOR(length / 10) * 10 + 9)
LIMIT 0, 1000;

-- 4. Identify the top 3 films in each category based on their rental counts.
SELECT *
FROM (
    SELECT
        c.name AS category,
        f.title AS film_title,
        COUNT(r.rental_id) AS rental_count,
        DENSE_RANK() OVER (
            PARTITION BY c.name
            ORDER BY COUNT(r.rental_id) DESC
        ) AS rank_in_category
    FROM category c
    JOIN film_category fc ON c.category_id = fc.category_id
    JOIN film f ON fc.film_id = f.film_id
    JOIN inventory i ON f.film_id = i.film_id
    JOIN rental r ON i.inventory_id = r.inventory_id
    GROUP BY c.name, f.title
) AS ranked_films
WHERE rank_in_category <= 3
ORDER BY category, rank_in_category;

-- 5. Calculate the difference in rental counts between each customer's total rentals and the average rentals across all customers.
SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    COUNT(r.rental_id) AS total_rentals,
    ROUND(AVG(COUNT(r.rental_id)) OVER (), 2) AS average_rentals,
    COUNT(r.rental_id) - AVG(COUNT(r.rental_id)) OVER () AS rental_difference
FROM customer c
JOIN rental r ON c.customer_id = r.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY rental_difference DESC;

-- 6. Find the monthly revenue trend for the entire rental store over time.
SELECT
    DATE_FORMAT(payment_date, '%Y-%m') AS month,
    SUM(amount) AS total_revenue
FROM payment
GROUP BY DATE_FORMAT(payment_date, '%Y-%m')
ORDER BY month;

-- 7. Identify the customers whose total spending on rentals falls within the top 20% of all customers.
WITH customer_spending AS (
    SELECT
        c.customer_id,
        c.first_name,
        c.last_name,
        SUM(p.amount) AS total_spent,
        NTILE(5) OVER (ORDER BY SUM(p.amount) DESC) AS spending_percentile
    FROM customer c
    JOIN payment p ON c.customer_id = p.customer_id
    GROUP BY c.customer_id, c.first_name, c.last_name
)
SELECT *
FROM customer_spending
WHERE spending_percentile = 1
ORDER BY total_spent DESC;


-- 8. Calculate the running total of rentals per category, ordered by rental count.
SELECT
    c.name AS category_name,
    COUNT(r.rental_id) AS rental_count,
    SUM(COUNT(r.rental_id)) OVER (ORDER BY COUNT(r.rental_id)) AS running_total
FROM category c
JOIN film_category fc ON c.category_id = fc.category_id
JOIN film f ON fc.film_id = f.film_id
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
GROUP BY c.category_id, c.name
ORDER BY rental_count;

-- 9. Find the films that have been rented less than the average rental count for their respective categories
WITH film_rentals AS (
    SELECT 
        f.film_id,
        f.title,
        c.name AS category_name,
        COUNT(r.rental_id) AS rental_count
    FROM film f
    JOIN film_category fc ON f.film_id = fc.film_id
    JOIN category c ON fc.category_id = c.category_id
    JOIN inventory i ON f.film_id = i.film_id
    JOIN rental r ON i.inventory_id = r.inventory_id
    GROUP BY f.film_id, f.title, c.name
),
category_avg AS (
    SELECT 
        category_name,
        AVG(rental_count) AS avg_rentals
    FROM film_rentals
    GROUP BY category_name
)
SELECT 
    fr.title,
    fr.category_name,
    fr.rental_count,
    ca.avg_rentals
FROM film_rentals fr
JOIN category_avg ca ON fr.category_name = ca.category_name
WHERE fr.rental_count < ca.avg_rentals
ORDER BY fr.category_name, fr.rental_count;


-- 10. Identify the top 5 months with the highest revenue and display the revenue generated in each month.
SELECT 
    DATE_FORMAT(payment_date, '%Y-%m') AS month,
    SUM(amount) AS total_revenue
FROM payment
GROUP BY DATE_FORMAT(payment_date, '%Y-%m')
ORDER BY total_revenue DESC
LIMIT 5;


-- Normalisation & CTE

-- Que5. CTE Basics: 
--  a. Write a query using a CTE to retrieve the distinct list of actor names and the number of films they have acted in from the actor and film_actor tables. 
WITH actor_film_count AS (
    SELECT
        a.actor_id,
        CONCAT(a.first_name, ' ', a.last_name) AS actor_name,
        COUNT(fa.film_id) AS film_count
    FROM actor a
    JOIN film_actor fa ON a.actor_id = fa.actor_id
    GROUP BY a.actor_id, a.first_name, a.last_name
)
SELECT * FROM actor_film_count
ORDER BY film_count DESC;

-- 6. CTE with Joins:a. Create a CTE that combines information from the film and language tables to display the film title,language name, and rental rate.
#a. Query using a CTE to display the film title, language name, and rental rate:
WITH film_language_cte AS (
    SELECT
        f.film_id,
        f.title AS film_title,
        l.name AS language_name,
        f.rental_rate
    FROM film f
    JOIN language l ON f.language_id = l.language_id
)
SELECT film_title, language_name, rental_rate
FROM film_language_cte
ORDER BY film_title;

-- Que7. CTE for Aggregation:a. Write a query using a CTE to find the total revenue generated by each customer (sum of payments) from the customer and payment tables.
WITH customer_revenue_cte AS (
    SELECT
        c.customer_id,
        c.first_name,
        c.last_name,
        SUM(p.amount) AS total_revenue
    FROM customer c
    JOIN payment p ON c.customer_id = p.customer_id
    GROUP BY c.customer_id, c.first_name, c.last_name
)
SELECT *
FROM customer_revenue_cte
ORDER BY total_revenue DESC;

 -- Que8. CTE with Window Functions:a. Utilize a CTE with a window function to rank films based on their rental duration from the film table.
 
 -- a. Query to rank films based on their rental duration using a CTE and a window function:
 WITH film_ranking_cte AS (
    SELECT
        film_id,
        title,
        rental_duration,
        RANK() OVER (ORDER BY rental_duration DESC) AS duration_rank
    FROM film
)
SELECT *
FROM film_ranking_cte
ORDER BY duration_rank;

-- Que9. CTE and Filtering:a. Create a CTE to list customers who have made more than two rentals, and then join this CTE with the customer table to retrieve additional customer details.
-- a. Query to list customers who have made more than two rentals and join with the customer table:
WITH frequent_customers AS (
    SELECT
        customer_id,
        COUNT(rental_id) AS rental_count
    FROM rental
    GROUP BY customer_id
    HAVING COUNT(rental_id) > 2
)

SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    c.email,
    fc.rental_count
FROM frequent_customers fc
JOIN customer c ON c.customer_id = fc.customer_id
ORDER BY fc.rental_count DESC;

-- 10. CTE for Date Calculations: a. Write a query using a CTE to find the total number of rentals made each month, considering the rental_date from the rental table CTE and Self-Join:
WITH monthly_rentals AS (
    SELECT
        DATE_FORMAT(rental_date, '%Y-%m') AS rental_month,
        COUNT(*) AS total_rentals
    FROM rental
    GROUP BY DATE_FORMAT(rental_date, '%Y-%m')
)

SELECT * FROM monthly_rentals
ORDER BY rental_month;

-- Que11. CTE and Self-Join: a. Create a CTE to generate a report showing pairs of actors who have appeared in the same film together, using the film_actor table.
WITH actor_pairs AS (
    SELECT
        fa1.actor_id AS actor1_id,
        fa2.actor_id AS actor2_id,
        fa1.film_id
    FROM film_actor fa1
    JOIN film_actor fa2
        ON fa1.film_id = fa2.film_id
        AND fa1.actor_id < fa2.actor_id
)

SELECT
    ap.film_id,
    a1.first_name || ' ' || a1.last_name AS actor1_name,
    a2.first_name || ' ' || a2.last_name AS actor2_name
FROM actor_pairs ap
JOIN actor a1 ON ap.actor1_id = a1.actor_id
JOIN actor a2 ON ap.actor2_id = a2.actor_id
ORDER BY ap.film_id, actor1_name, actor2_name;

-- Que12. CTE for Recursive Search: a. Implement a recursive CTE to find all employees in the staff table who report to a specific manager, considering the reports_to column
WITH RECURSIVE staff_hierarchy AS (
    -- Anchor member: start with the manager
    SELECT 
        staff_id,
        first_name,
        last_name,
        reports_to
    FROM staff
    WHERE staff_id = 1  -- Replace with specific manager ID

    UNION ALL

    -- Recursive member: find staff who report to the current staff
    SELECT 
        s.staff_id,
        s.first_name,
        s.last_name,
        s.reports_to
    FROM staff s
    JOIN staff_hierarchy sh ON s.reports_to = sh.staff_id
)

SELECT * FROM staff_hierarchy;



