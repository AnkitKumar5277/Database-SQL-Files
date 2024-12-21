create database city;
use city;

create table airbnb_listings (
id int primary key,
city varchar(100),
country varchar(100),
number_of_rooms int,
year_listed int
);

insert into airbnb_listings (id, city, country, number_of_rooms, year_listed) values
(1, 'Paris', 'France', 5, 2018),
(2, 'Tokyo', 'Japan', 2, 2017),
(3, 'New York', 'USA', 2, 2022);

-- Get all the columns from a table
select *
from airbnb_listings;

-- Get the city column from the table
select city
from airbnb_listings;

-- Get the city and year_listed columns from the table
select city, year_listed
from airbnb_listings;

-- Get the listing id, city, ordered by the number_of_rooms in ascending order
select id, city from  airbnb_listings
order by number_of_rooms ASC;

-- Get the listing id, city, ordered by the number_of_rooms in descending order
select id, city from  airbnb_listings
order by number_of_rooms Desc;

-- Get the first 5 rows from the airbnb_listings table
 select * from airbnb_listings
 limit 5;
 
-- Get a unique list of cities where there are listing
select distinct city
from airbnb_listings;

-- Filtering Data 
-- Filtering on numeric columns

-- Get all the listings where number_of_rooms is more or equal to 3
  select * from airbnb_listings 
  where number_of_rooms >= 3;
  
-- Get all the listings where number_of_rooms is more than 3
    select * from airbnb_listings 
    where number_of_rooms >= 3;
  
-- Get all the listings where number_of_rooms is exactly equal to 3
   select * from airbnb_listings
   where number_of_rooms = 3;
   
-- Get all the listings where number_of_rooms is lower or equal to 3
	select * from airbnb_listings 
    where number_of_rooms <= 3;
    
 -- Get all the listings where number_of_rooms is lower than 3
	select * from airbnb_listings 
    where number_of_rooms < 3;
    
-- Get all the listings with 3 to 6 rooms
    select * from airbnb_listings 
    where number_of_rooms between 3 and 6;
    
-- Filtering on text columns
-- Get all the listings that are based in 'Paris'-
	SELECT * from airbnb_listings
    where city = 'Paris';
    
-- Get the listings based in the  and in 'USA' 'France'
	select * FROM airbnb_listings
	where country in ('usa','france'); 
    
-- Get all the listings where the city starts with j and where the city does not end in 'j' 't'
	select * FROM airbnb_listings
    where city like 'P%' and city not like '%k';
    
--  Filtering on multiple columns
-- Get all the listings in  where number_of_rooms is bigger than 3
	select * FROM airbnb_listings
    where city = 'Paris' and number_of_rooms > 3;

-- Get all the listings in  OR the ones that were listed after 2012
	select * FROM airbnb_listings
    where city = 'Paris' or year_listed > 2012;
    
--  Filtering on missing data
-- Return the listings where number_of_rooms is missing
select * from airbnb_listings
where number_of_rooms is null ;
   
-- Return the listings where number_of_rooms is not missing
select * from airbnb_listings
where number_of_rooms is not null ;

-- Aggregating Data
-- Simple aggregations
 -- Get the total number of rooms available across all listings
 select sum(number_of_rooms)
 from airbnb_listings;
 
--  Get the average number of rooms per listing across all listings
select avg(number_of_rooms)
from airbnb_listings;

-- Get the listing with the highest number of rooms across all listings
select max(number_of_roooms)
from airbnb_listings;

-- Get the listing with the lowest number of rooms across all listings
select min(number_of_rooms)
from airbnb_listings;

--  Grouping, filtering, and sorting
-- Get the total number of rooms for each country
select country, sum(number_of_rooms)
from airbnb_listings
group by country;

-- Get the average number of rooms for each country
select country, avg(number_of_rooms)
from airbnb_listings
group by country;

-- Get the listing with the maximum number of rooms per country
select country, max(number_of_rooms)
from airbnb_listings
group by country;

--  Get the listing with the lowest amount of rooms per country
select country, min(number_of_rooms)
from airbnb_listings
group by country;

--  For each country, get the average number of rooms per listing, sorted by ascending order
select country, avg(number_of_rooms) as avg_rooms
from airbnb_listings
group by country
order by avg_rooms asc;

-- For Japan and the USA, get the average number of rooms per listing  in each country
select country, max(number_of_rooms)
from airbnb_listings
where country in ('usa', 'japan')
group by country;

-- Get the number of cities per country, where there are listings
select country, count(city) as number_of_cities
from airbnb_listings
group by country;

-- Get all the years where there were more than 100 listings per year
select year_listed
from airbnb_listings
group by year_listed
having count(id) > 100;