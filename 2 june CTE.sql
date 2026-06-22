-- cte
-- storing a result on a temporary 
select * from sakila.film_actor;

select * from 
(select actor_id,count(film_id) from sakila.film_actor group by actor_id)as tmp 
where actor_id >10;