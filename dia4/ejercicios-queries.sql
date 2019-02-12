-- use sakila;
-- insert into actor (first_name,last_name)
-- values ( 'Angel','Martin');
-- insert into actor (first_name,last_name)
-- values ( 'Pepito','De los Palotes');

-- update actor set 
-- first_name= 'Angela',
-- last_name= 'Martinez'
-- where actor_id=201;

-- delete from actor
-- where actor_id>201;

-- delete from actor 
-- where actor_id=200


-- INSERT INTO `sakila`.`film`
-- (`title`,
-- `description`,
-- `release_year`,
-- `language_id`,
-- `original_language_id`,
-- `rental_duration`,
-- `rental_rate`,
-- `length`,
-- `replacement_cost`,
-- `rating`,
-- `special_features`
-- )
-- VALUES
-- ('Mi vida es bella',
-- 'un dramón sobre lo bonito de la vida',
-- 2012,
-- 4,
-- 3,
-- 5,
-- 2.12,
-- 429,
-- 562.56,
-- 'PG-13',
-- 'Trailers,Deleted Scenes'
-- );
-- 
-- insert into film_actor(film_id, actor_id)
-- values (1001,23),(1001,26),(1001,58);
-- 

-- INSERT INTO `sakila`.`film_category`
-- (`film_id`,
-- `category_id`)
-- VALUES
-- (1001,7),(1001,5);
-- 
-- select title as Titulo,release_year,rental_rate
-- from film
-- where 
-- film_id < 500
-- and
-- rental_rate <= 1

-- select film_id as FID, title as Titulo, release_year as Año, length as Duracion, rental_rate as alquiler
-- from film
-- order by length desc, title, rental_rate;

-- select release_year as Año, count(*)
-- from film
-- group by release_year
-- 
-- select title as Titulo, l.name as Idioma, f.language_id, l2.name as Original
-- from film f
-- inner join `language` l on f.language_id= l.language_id
-- left join `language` l2 on f.original_language_id= l2.language_id
-- ;


-- select title as Titulo, l.name as Idioma, f.language_id, coalesce (l2.name, l.name) as Original
-- from film f
-- inner join `language` l on f.language_id= l.language_id
-- left join `language` l2 on f.original_language_id= l2.language_id
-- ;


-- select title, count(*) as cantidadActores
-- from film as f
-- inner join film_actor as fa on f.film_id= fa.film_id
-- inner join actor as a on a.actor_id= fa.actor_id
-- group by title
-- having count(*)>6
-- order by cantidadActores, title
-- ; 

-- select title, count(*) as cantidadActores
-- from film as f
-- inner join film_actor as fa on f.film_id= fa.film_id
-- inner join actor as a on a.actor_id= fa.actor_id
-- group by title
-- having count(*)>6
-- order by cantidadActores, title
-- ; 

-- select f.title, c.name
-- from film as f
-- inner join film_category as fc on f.film_id = fc.film_id
-- inner join category as c on fc.category_id= c.category_id
-- ;

-- 1a. Display the first and last names of all actors from the table actor.
-- select first_name, last_name 
-- from actor;

-- 1b. Display the first and last name of each actor in a single column in upper case letters. Name the column Actor Name.
-- select upper(concat(first_name, ' ', last_name)) as 'Actor Name'
-- from actor;

-- 2a. You need to find the ID number, first name, and last name of an actor, of whom you know only the first name, "Joe." 
--      What is one query would you use to obtain this information?

-- select actor_id,first_name,last_name 
-- from actor
-- where first_name = 'Joe'
-- ;

-- 2b. Find all actors whose last name contain the letters GEN:
-- select actor_id,first_name,last_name 
-- from actor
-- where last_name like '%GEN%'
-- ;

-- 2c. Find all actors whose last names contain the letters LI. This time, order the rows by last name and first name, in that order:
-- select actor_id,first_name,last_name 
-- from actor
-- where last_name like '%LI%'
-- order by last_name, first_name;
-- ;

-- 2d. Using IN, display the country_id and country columns of the following countries: Afghanistan, Bangladesh, and China:
-- select *
-- from country
-- where country in ('Afghanistan', 'Bangladesh', 'China')
-- ;

-- 3a. Add a middle_name column to the table actor. Position it between first_name and last_name. Hint: you will need to specify the data type.
-- ALTER TABLE actor ADD COLUMN middle_name varchar(20) NULL AFTER first_name;
-- 

-- 3b. You realize that some of these actors have tremendously long last names. 
-- Change the data type of the middle_name column to blobs.
-- ALTER TABLE actor MODIFY middle_name blob;

-- 3c. Now delete the middle_name column.
-- alter table actor 
-- drop column middle_name;
-- 

-- 4a. List the last names of actors, as well as how many actors have that last name.
-- select last_name,count(*)
-- from actor
-- group by last_name;

-- 4b. List last names of actors and the number of actors who have that last name, 
--     but only for names that are shared by at least two actors
-- select last_name, count(*)
-- from actor
-- group by last_name
-- having count(*)>=2
-- ;

-- 4c. Oh, no! The actor HARPO WILLIAMS was accidentally entered in the actor table as GROUCHO WILLIAMS, 
--     the name of Harpo's second cousin's husband's yoga teacher. Write a query to fix the record.
-- select replace (first_name,'GROUCHO','HARPO')
-- from actor
-- where first_name = 'GROUCHO' and last_name = 'WILLIAMS';
-- update actor set first_name = 'HARPO' 
-- where first_name = 'GROUCHO' and last_name = 'WILLIAMS';

-- 4d. Perhaps we were too hasty in changing GROUCHO to HARPO. It turns out that GROUCHO was the correct 
-- name after all! 
-- In a single query, if the first name of the actor is currently HARPO, 
-- change it to GROUCHO. Otherwise, change the first name to MUCHO GROUCHO, as that is exactly what 
-- the actor will be with the grievous error. BE CAREFUL NOT TO CHANGE THE FIRST NAME OF EVERY ACTOR 
-- TO MUCHO GROUCHO, HOWEVER! 
-- (Hint: update the record using a unique identifier.)

-- 5a. You cannot locate the schema of the address table. Which query would you use to re-create it?
-- describe address "o" show create table address

-- 6a. Use JOIN to display the first and last names, as well as the address, of each staff member. Use the tables staff and address:
-- select s.first_name, s.last_name, address
-- from staff as s 
-- inner join address as a on s.address_id= a.address_id;

-- 6b. Use JOIN to display the total amount rung up by each staff member in August of 2005. Use tables staff and payment.
-- select s.first_name, sum(amount) as 'Amount'
-- from payment as p
-- inner join staff as s on s.staff_id = p.staff_id
-- where p.payment_date like ('2005-08%')
-- group by s.first_name
-- ;

-- 6c. List each film and the number of actors who are listed for that film. Use tables film_actor and film. Use inner join.
-- select title, count(*) as cantidadActores
-- from film as f
-- inner join film_actor as fa on f.film_id= fa.film_id
-- group by title
-- ; 

-- 6d. How many copies of the film Hunchback Impossible exist in the inventory system?
-- select title, count(*)
-- from inventory as i
-- inner join film as f on i.film_id= f.film_id
-- where f.title = 'Hunchback Impossible'
-- group by i.film_id 
-- ;

-- 6e. Using the tables payment and customer and the JOIN command, list the total paid by each customer. 
--     List the customers alphabetically by last name:
-- select c.last_name, sum(amount) as TotalAmount
-- from payment as p
-- right join customer as c on p.customer_id=c.customer_id
-- group by c.last_name;
 
-- 7a. The music of Queen and Kris Kristofferson have seen an unlikely resurgence. As an unintended consequence, 
-- films starting with the letters K and Q have also soared in popularity. Use subqueries to display the titles of
-- movies starting with the letters K and Q whose language is English.
-- select f.title
-- from film as f
-- inner join language as l on f.language_id=l.language_id
-- where (f.title like 'K%' or f.title like 'Q%') and l.name = 'English'
-- ;

-- 7b. Use subqueries to display all actors who appear in the film Alone Trip.
-- select a.first_name
-- from actor as a 
-- inner join film_actor as fa on fa.actor_id = a.actor_id
-- inner join film as f on fa.film_id = f.film_id
-- where f.title = 'Alone Trip';
-- 

-- 7c. You want to run an email marketing campaign in Canada, for which you will need the names and 
--     email addresses of all Canadian customers. 
--     Use joins to retrieve this information.
-- select c.email
-- from customer as c
-- inner join address as a on c.address_id = a.address_id
-- inner join city as ci on a.city_id = ci.city_id
-- inner join country as co on co.country_id = ci.country_id
-- where country = 'Canada';

-- 7d. Sales have been lagging among young families, and you wish to target all family movies for a promotion. 
--  Identify all movies categorized as famiy films.
-- select f.title
-- from film as f
-- inner join film_category as fc using(film_id)
-- inner join category as c using(category_id)
-- where c.name like 'Family'
-- 
-- 7e. Display the most frequently rented movies in descending order.
-- select f.title, count(inventory_id) as 'MostRent'
-- from rental as r 
-- inner join inventory as i using(inventory_id)
-- inner join film as f using(film_id)
-- group by f.title
-- order by count(*)desc;

-- 7f. Write a query to display how much business, in dollars, each store brought in.
-- select s.store_id, count(amount) as 'Business'
-- from store as s
-- inner join staff using(store_id)
-- inner join payment as p using(staff_id)
-- group by s.store_id;

-- 7g. Write a query to display for each store its store ID, city, and country.
-- select s.store_id, ci.city, co.country
-- from store as s
-- inner join address as a using(address_id)
-- inner join city as ci using(city_id)
-- inner join country as co using(country_id)
--

-- 7h. List the top five genres in gross revenue in descending order. 
-- (Hint: you may need to use the following tables: category, film_category, inventory, payment, and rental.)


-- 8a. In your new role as an executive, you would like to have an easy way of viewing 
--      the Top five genres by gross revenue. Use the solution from the problem above to create a view. 
--      If you haven't solved 7h, you can substitute another query to create a view.

-- 8b. How would you display the view that you created in 8a?

-- 8c. You find that you no longer need the view top_five_genres. Write a query to delete it.

