## query para ver cuantas peliculas hay por categoría.

Select c.name, count(distinct(f.title))
from film_curated as f

left join old_HDD as o
on f.title = o.title

left join category as c
on c.category_id = o.category_id

group by c.name;

## query para ver cuantas peliculas tiene cada actor

Select a.first_name, a.last_name, count(distinct(f.title))
from film_curated as f

left join old_HDD as o
on f.title = o.title

left join actors as a
on o.actor_id = a.actor_id

group by a.first_name, a.last_name;

## query para conocer la pelicula que mas dinero generó.

Select r.film_id, f.title, SUM(TIMESTAMPDIFF(HOUR, r.rental_date, r.return_date) * f.rental_rate) AS ganancia_total
from rental as r

join film_curated as f 
on r.film_id = f.film_id

group by r.film_id, f.title
order by ganancia_total DESC;

## query para conocer el actor que mas dinero generó.

Select o.actor_id, o.first_name, o.last_name, SUM(TIMESTAMPDIFF(HOUR, r.rental_date, r.return_date) * f.rental_rate) AS ganancias_totales
from rental as r

join film_curated as f 
on r.film_id = f.film_id

join old_hdd as o 
on f.film_id = o.film_id

group by o.actor_id, o.first_name, o.last_name
order by ganancias_totales DESC;