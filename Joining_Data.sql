create database joining_data;
use joining_data;

-- table 1
DROP TABLE IF EXISTS Artist;
CREATE TABLE Artist (
    artist_id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);
INSERT INTO Artist (artist_id, name) VALUES
(1, 'AC/DC'),
(2, 'Aerosmith'),
(3, 'Alanis Morissette');

-- table 2
DROP TABLE IF EXISTS Album;
CREATE TABLE Album (
    album_id INT PRIMARY KEY,
    title VARCHAR(255),
    artist_id INT
);
INSERT INTO Album (album_id, title, artist_id) VALUES
(1, 'For those who rock', 1),
(2, 'Dream on', 2),
(3, 'Restless and wild', 2),
(4, 'Let there be rock', 1),
(5, 'Rumours', 6);

select * from album;
select * from artist;

-- INNER JOINS
select *
from artist as art
inner join album as alb
on art.artist_id = alb.artist_id;

-- INNER JOIN with USING
select * 
from artist as art
inner join album as alb
using (artist_id);

-- SELF JOIN
SELECT alb1.artist_id,
       alb1.title AS alb1_title,
       alb2.title AS alb2_title
FROM album AS alb1
INNER JOIN album AS alb2
ON alb1.artist_id = alb2.artist_id
WHERE alb1.album_id <> alb2.album_id;

-- LEFT JOIN
select *
from artist as art
left join album as alb
on art.artist_id = alb.artist_id;

-- RIGHT JOIJN
 select *
 from artist art
 right join album as alb
 on art.artist_id = alb.album_id;

-- FULL OUTER JOIN 
-- SELECT *
-- FROM artist AS art
-- FULL OUTER JOIN album AS alb
-- ON art.artist_id = alb.album_id;
 
--  MySQL does not support FULL OUTER JOIN directly. However,
-- you can achieve the same result by combining LEFT JOIN and RIGHT JOIN using UNION.

-- FULL JOIN
select *
from artist art
left join album alb
on art.artist_id = alb.artist_id
union
select *
from artist as art
right join album alb
on art.artist_id = alb.artist_id;

select artist_id
from artist
union
select artist_id
from album;

-- CROSS JOIN
SELECT name, title
from artist
cross join album;

-- UNION ALL
select artist_id
from artist
union all 
select artist_id
from album;

-- INTERSECT
-- select artist_id
-- from artist
-- intersect
-- select artist_id
-- from album;

-- MySQL does not support the INTERSECT operator directly. However, 
-- you can achieve the same result using INNER JOIN or DISTINCT with IN.

SELECT distinct artist.artist_id
from artist
inner join album
on artist.artist_id = album.artist_id;

-- EXCEPT
-- SELECT artist_id
-- from artist
-- except
-- select artist_id
-- from album;

-- MySQL does not support the EXCEPT operator directly. However,
-- you can achieve the same result using LEFT JOIN with WHERE ... IS NULL or NOT IN.

select artist.artist_id
from artist
left join album
on artist.artist_id = album.artist_id
where album.artist_id in null;

-- SEMI JOIN
select * 
from album
where artist_id in (select artist_id from artist);

 -- ANTI JOIN
 SELECT * from album
 where artist_id not in
 (select artist_id from artist);
