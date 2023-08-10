--Question 1
SELECT c.first_name, c.last_name, a.district
FROM customer c
JOIN address a
ON c.address_id  = a.address_id
WHERE district = 'Texas'


--first_name|last_name|district|
------------+---------+--------+
--Jennifer  |Davis    |Texas   |
--Richard   |Mccrary  |Texas   |
--Bryan     |Hardison |Texas   |
--Ian       |Still    |Texas   |
--Kim       |Cruz     |Texas   |


-- Question 2
SELECT c.first_name, c.last_name, p.amount
FROM customer c 
JOIN rental r 
ON c.customer_id = r.customer_id
JOIN payment p 
ON r.rental_id = p.rental_id 
WHERE amount > 7
ORDER BY amount


--first_name |last_name   |amount|
-------------+------------+------+
--Justin     |Ngo         |  7.98|
--Gail       |Knight      |  7.98|
--Margie     |Wade        |  7.98|
--Cathy      |Spencer     |  7.98|
--Heather    |Morris      |  7.98|
--Charlie    |Bess        |  7.99|
--Roberto    |Vu          |  7.99|
--Brittany   |Riley       |  7.99|
--Eileen     |Carr        |  7.99|
--Johnny     |Turpin      |  7.99|
--Pearl      |Garza       |  7.99|
--Beatrice   |Arnold      |  7.99|
--Steve      |Mackenzie   |  7.99|
--Alvin      |Deloach     |  7.99|
--Lillian    |Griffin     |  7.99|
--June       |Carroll     |  7.99|
--Denise     |Kelly       |  7.99|
--Arlene     |Harvey      |  7.99|
--....


-- Question 3
SELECT sum(amount), c.customer_id, c.first_name, c.last_name, c.email, c.address_id, c.activebool, c.create_date, c.last_update , c.active 
FROM customer c
JOIN payment p 
ON c.customer_id = p.customer_id
WHERE c.customer_id IN (
	SELECT p.customer_id
	FROM payment p
	GROUP BY customer_id
	HAVING sum(amount) > 175
)
GROUP BY c.customer_id, c.first_name, c.last_name, c.email, c.address_id, c.activebool, c.create_date, c.last_update , c.active
ORDER BY sum ASC;

SELECT sum(p.amount), c.customer_id, c.first_name, c.last_name, c.email, c.address_id
FROM customer c
JOIN payment p
ON c.customer_id = p.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name, c.email, c.address_id
HAVING sum(amount) > 175
ORDER BY sum DESC



--sum   |customer_id|first_name|last_name|email                            |address_id|activebool|create_date|last_update            |active|
--------+-----------+----------+---------+---------------------------------+----------+----------+-----------+-----------------------+------+
--183.63|        459|Tommy     |Collazo  |tommy.collazo@sakilacustomer.org |       464|true      | 2006-02-14|2023-08-09 15:08:31.351|     1|
--189.60|        144|Clara     |Shaw     |clara.shaw@sakilacustomer.org    |       148|true      | 2006-02-14|2023-08-09 15:08:31.351|     1|
--191.62|        137|Rhonda    |Kennedy  |rhonda.kennedy@sakilacustomer.org|       141|true      | 2006-02-14|2023-08-09 15:08:31.351|     1|
--194.61|        178|Marion    |Snyder   |marion.snyder@sakilacustomer.org |       182|true      | 2006-02-14|2023-08-09 15:08:31.351|     1|
--208.58|        526|Karl      |Seal     |karl.seal@sakilacustomer.org     |       532|true      | 2006-02-14|2023-08-09 15:08:31.351|     1|
--211.55|        148|Eleanor   |Hunt     |eleanor.hunt@sakilacustomer.org  |       152|true      | 2006-02-14|2023-08-09 15:08:31.351|     1|


-- Question 4
SELECT *
FROM customer c
JOIN address a
ON c.address_id = a.address_id
JOIN city c2
ON a.city_id = c2.city_id
JOIN country c3
ON c2.country_id = c3.country_id
WHERE country = 'Argentina'



--customer_id|store_id|first_name|last_name|email                               |address_id|activebool|create_date|last_update            |active|loyalty_member|address_id|address                         |address2|district    |city_id|postal_code|phone       |last_update            |city_id|city                |country_id|last_update            |country_id|country  |last_update            |
-------------+--------+----------+---------+------------------------------------+----------+----------+-----------+-----------------------+------+--------------+----------+--------------------------------+--------+------------+-------+-----------+------------+-----------------------+-------+--------------------+----------+-----------------------+----------+---------+-----------------------+
--        359|       2|Willie    |Markham  |willie.markham@sakilacustomer.org   |       364|true      | 2006-02-14|2023-08-09 15:08:31.351|     1|true          |       364|1623 Kingstown Drive            |        |Buenos Aires|     20|91299      |296394569728|2006-02-15 09:45:30.000|     20|Almirante Brown     |         6|2006-02-15 09:45:25.000|         6|Argentina|2006-02-15 09:44:00.000|
--        560|       1|Jordan    |Archuleta|jordan.archuleta@sakilacustomer.org |       566|true      | 2006-02-14|2023-08-09 15:08:31.351|     1|true          |       566|1229 Varanasi (Benares) Manor   |        |Buenos Aires|     43|40195      |817740355461|2006-02-15 09:45:30.000|     43|Avellaneda          |         6|2006-02-15 09:45:25.000|         6|Argentina|2006-02-15 09:44:00.000|
--        322|       1|Jason     |Morrissey|jason.morrissey@sakilacustomer.org  |       327|true      | 2006-02-14|2023-08-09 15:08:31.351|     1|true          |       327|1427 A Corua (La Corua) Place   |        |Buenos Aires|     45|85799      |972574862516|2006-02-15 09:45:30.000|     45|Baha Blanca         |         6|2006-02-15 09:45:25.000|         6|Argentina|2006-02-15 09:44:00.000|
--         24|       2|Kimberly  |Lee      |kimberly.lee@sakilacustomer.org     |        28|true      | 2006-02-14|2023-08-09 15:08:31.351|     1|true          |        28|96 Tafuna Way                   |        |Crdoba      |    128|99865      |934730187245|2006-02-15 09:45:30.000|    128|Crdoba              |         6|2006-02-15 09:45:25.000|         6|Argentina|2006-02-15 09:44:00.000|
--        445|       1|Micheal   |Forman   |micheal.forman@sakilacustomer.org   |       450|true      | 2006-02-14|2023-08-09 15:08:31.351|     1|true          |       450|203 Tambaram Street             |        |Buenos Aires|    161|73942      |411549550611|2006-02-15 09:45:30.000|    161|Escobar             |         6|2006-02-15 09:45:25.000|         6|Argentina|2006-02-15 09:44:00.000|
--        530|       2|Darryl    |Ashcraft |darryl.ashcraft@sakilacustomer.org  |       536|true      | 2006-02-14|2023-08-09 15:04:08.743|     1|false         |       536|166 Jinchang Street             |        |Buenos Aires|    165|86760      |717566026669|2006-02-15 09:45:30.000|    165|Ezeiza              |         6|2006-02-15 09:45:25.000|         6|Argentina|2006-02-15 09:44:00.000|
--         89|       1|Julia     |Flores   |julia.flores@sakilacustomer.org     |        93|true      | 2006-02-14|2023-08-09 15:08:31.351|     1|true          |        93|1926 El Alto Avenue             |        |Buenos Aires|    289|75543      |846225459260|2006-02-15 09:45:30.000|    289|La Plata            |         6|2006-02-15 09:45:25.000|         6|Argentina|2006-02-15 09:44:00.000|
--        107|       1|Florence  |Woods    |florence.woods@sakilacustomer.org   |       111|true      | 2006-02-14|2023-08-09 15:08:31.351|     1|true          |       111|1532 Dzerzinsk Way              |        |Buenos Aires|    334|9599       |330838016880|2006-02-15 09:45:30.000|    334|Merlo               |         6|2006-02-15 09:45:25.000|         6|Argentina|2006-02-15 09:44:00.000|
--        585|       1|Perry     |Swafford |perry.swafford@sakilacustomer.org   |       591|true      | 2006-02-14|2023-08-09 15:04:08.743|     1|false         |       591|773 Dallas Manor                |        |Buenos Aires|    424|12664      |914466027044|2006-02-15 09:45:30.000|    424|Quilmes             |         6|2006-02-15 09:45:25.000|         6|Argentina|2006-02-15 09:44:00.000|
--        243|       1|Lydia     |Burke    |lydia.burke@sakilacustomer.org      |       247|true      | 2006-02-14|2023-08-09 15:04:08.743|     1|false         |       247|1483 Pathankot Street           |        |Tucumn      |    454|37288      |686015532180|2006-02-15 09:45:30.000|    454|San Miguel de Tucumn|         6|2006-02-15 09:45:25.000|         6|Argentina|2006-02-15 09:44:00.000|
--        331|       1|Eric      |Robert   |eric.robert@sakilacustomer.org      |       336|true      | 2006-02-14|2023-08-09 15:08:31.351|     1|true          |       336|430 Kumbakonam Drive            |        |Santa F     |    457|28814      |105470691550|2006-02-15 09:45:30.000|    457|Santa F             |         6|2006-02-15 09:45:25.000|         6|Argentina|2006-02-15 09:44:00.000|
--        405|       1|Leonard   |Schofield|leonard.schofield@sakilacustomer.org|       410|true      | 2006-02-14|2023-08-09 15:08:31.351|     1|true          |       410|88 Nagaon Manor                 |        |Buenos Aires|    524|86868      |779461480495|2006-02-15 09:45:30.000|    524|Tandil              |         6|2006-02-15 09:45:25.000|         6|Argentina|2006-02-15 09:44:00.000|
--        219|       2|Willie    |Howell   |willie.howell@sakilacustomer.org    |       223|true      | 2006-02-14|2023-08-09 15:08:31.351|     1|true          |       223|1244 Allappuzha (Alleppey) Place|        |Buenos Aires|    567|20657      |991802825778|2006-02-15 09:45:30.000|    567|Vicente Lpez        |         6|2006-02-15 09:45:25.000|         6|Argentina|2006-02-15 09:44:00.000|


-- Question 5
SELECT fc.category_id, c."name", count(c."name") AS num_movies
FROM film f
JOIN film_category fc 
ON f.film_id = fc.film_id
JOIN category c
ON c.category_id = fc.category_id
GROUP BY fc.category_id, c."name"
ORDER BY count(*) DESC

--category_id|name       |num_movies|
-------------+-----------+----------+
--         15|Sports     |        74|
--          9|Foreign    |        73|
--          8|Family     |        69|
--          6|Documentary|        68|
--          2|Animation  |        66|
--          1|Action     |        64|
--         13|New        |        63|
--          7|Drama      |        62|
--         14|Sci-Fi     |        61|
--         10|Games      |        61|
--          3|Children   |        60|
--          5|Comedy     |        58|
--         16|Travel     |        57|
--          4|Classics   |        57|
--         11|Horror     |        56|
--         12|Music      |        51|



-- Question 6
SELECT f.film_id, f.title, count(*) AS num_actors
FROM actor a
JOIN film_actor fa 
ON a.actor_id = fa.actor_id 
JOIN film f
ON f.film_id = fa.film_id
GROUP BY f.film_id, f.title
ORDER BY num_actors DESC
LIMIT 1;

-- Answer = Lambs Cincinatti

--film_id|title           |num_actors|
---------+----------------+----------+
--    508|Lambs Cincinatti|        15|


-- Question 7 
SELECT a.actor_id, a.first_name, a.last_name, count(*) AS num_films
FROM actor a
JOIN film_actor fa 
ON a.actor_id = fa.actor_id 
JOIN film f
ON f.film_id = fa.film_id
GROUP BY a.actor_id, a.first_name, a.last_name
ORDER BY num_films ASC
LIMIT 1;

-- Answer = Emily Dee

--actor_id|first_name|last_name|num_films|
----------+----------+---------+---------+
--     148|Emily     |Dee      |       14|


-- Question 8
SELECT c2.country_id, c2.country, count(*) AS num_cities
FROM city c 
JOIN country c2 
ON c.country_id = c2.country_id 
GROUP BY c2.country_id, c2.country
ORDER BY num_cities DESC
LIMIT 1;

-- Answer = India
--country_id|country|num_cities|
------------+-------+----------+
--        44|India  |        60|

-- Question 9
SELECT a.actor_id, a.first_name, a.last_name, count(*)
FROM actor a
JOIN film_actor fa
ON a.actor_id = fa.actor_id 
JOIN film f 
ON f.film_id = fa.film_id 
GROUP BY a.actor_id, a.first_name, a.last_name
HAVING count(*) BETWEEN 20 AND 25
ORDER BY count DESC

--actor_id|first_name |last_name  |count|
----------+-----------+-----------+-----+
--      93|Ellen      |Presley    |   25|
--       9|Joe        |Swank      |   25|
--      61|Christian  |Neeson     |   25|
--      19|Bob        |Fawcett    |   25|
--      38|Tom        |Mckellen   |   25|
--       2|Nick       |Wahlberg   |   25|
--     172|Groucho    |Williams   |   25|
--     131|Jane       |Jackman    |   25|
--     122|Salma      |Nolte      |   25|
--     180|Jeff       |Silverstone|   25|
--     114|Morgan     |Mcdormand  |   25|
--     112|Russell    |Bacall     |   25|
--      51|Gary       |Phoenix    |   25|
--      34|Audrey     |Olivier    |   25|
--      54|Penelope   |Pinkett    |   25|
--      11|Zero       |Cage       |   25|
--     118|Cuba       |Allen      |   25|
--     121|Liza       |Bergman    |   25|
--     162|Oprah      |Kilmer     |   25|
--      46|Parker     |Goldberg   |   24|
--     100|Spencer    |Depp       |   24|
--     170|Mena       |Hopper     |   24|
--     116|Dan        |Streep     |   24|
--     189|Cuba       |Birch      |   24|
--      33|Milla      |Peck       |   24|
--     182|Debbie     |Akroyd     |   24|
--      47|Julia      |Barrymore  |   24|
--      77|Cary       |Mcconaughey|   24|
--     138|Lucille    |Dee        |   24|
--     174|Michael    |Bening     |   24|
--      24|Cameron    |Streep     |   24|
--      89|Charlize   |Dench      |   24|
--      75|Burt       |Posey      |   24|
--      96|Gene       |Willis     |   23|
--      67|Jessica    |Bailey     |   23|
--     152|Ben        |Harris     |   23|
--      70|Michelle   |Mcconaughey|   23|
--     193|Burt       |Temple     |   23|
--      32|Tim        |Hackman    |   23|
--     126|Frances    |Tomei      |   23|
--     178|Lisa       |Monroe     |   23|
--       4|Jennifer   |Davis      |   22|
--     109|Sylvester  |Dern       |   22|
--       3|Ed         |Chase      |   22|
--      18|Dan        |Torn       |   22|
--      10|Christian  |Gable      |   22|
--     194|Meryl      |Allen      |   22|
--     166|Nick       |Degeneres  |   22|
--     134|Gene       |Hopkins    |   22|
--     156|Fay        |Wood       |   22|
--     132|Adam       |Hopper     |   22|
--      25|Kevin      |Bloom      |   21|
--      87|Spencer    |Peck       |   21|
--      69|Kenneth    |Paltrow    |   21|
--     163|Christopher|West       |   21|
--     110|Susan      |Davis      |   21|
--       8|Matthew    |Johansson  |   20|
--      91|Christopher|Berry      |   20|
--     160|Chris      |Depp       |   20|
--     153|Minnie     |Kilmer     |   20|
--      88|Kenneth    |Pesci      |   20|
--     200|Thora      |Temple     |   20|
--      55|Fay        |Kilmer     |   20|
--     135|Rita       |Reynolds   |   20|
--       6|Bette      |Nicholson  |   20|