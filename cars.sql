create database cars;
use cars;
create table cars (
	make VARCHAR(50),
    model VARCHAR(50),
    year INT,
    propulsion_type VARCHAR(50),
    time_to_60_mph_s DECIMAL(3,2),
    limited_production_count INT
);
insert into cars (make, model, year, propulsion_type, time_to_60_mph_s, limited_production_count) 
values
('Lamborghini', 'Huracán Performante', 2018, 'ICE', 2.2, NULL),
('Ferrari', 'SF90 Stradale', 2021, 'Hybrid', 2.0, NULL),
('Tesla', 'Model S Plaid', 2021, 'Electric', 1.98, NULL),
('Porsche', '918 Spyder', 2015, 'Hybrid', 2.1, 918),
('Rimac', 'Nevera', 2021, 'Electric', 1.74, 150),
('Porsche', '911 Turbo S (992)', 2020, 'ICE', 2.1, NULL);

-- querying tables

select * from cars;

select model from cars;

select make, model from cars;

select make, model, propulsion_type as engine_type
from cars;

select make, model, propulsion_type
as engine_type
from cars;

select make, model, time_to_60_mph_s
from cars
order by time_to_60_mph_s;

select make, model, year
from cars
order by year desc;

select *
from cars
limit 2;

select distinct propulsion_type
from cars;

-- filtering data
--  Filtering on numeric columns

select make, model, time_to_60_mph_s
from cars
where time_to_60_mph_s > 2.1;

select make, model, time_to_60_mph_s
from cars
where time_to_60_mph_s >= 2.1;

select make, model, time_to_60_mph_s
from cars
where time_to_60_mph_s < 2.1;

select make, model, time_to_60_mph_s
from cars
where time_to_60_mph_s <= 2.1;

select make, model time_to_60_mph_s
from cars
where time_to_60_mph_s = 2.1;

select make, model, time_to_60_mph_s
from cars
where time_to_60_mph_s <> 2.1;

select make, model, time_to_60_mph_s
from cars
where time_to_60_mph_s between 1.9 and 2.1;

--  Filtering on text columns

select make, model, propulsion_type
from cars
where propulsion_type = 'Hybrid';

select make, model, propulsion_type
from cars
where propulsion_type in ('electric', 'hybrid');

select make, model, propulsion_type
from cars
where propulsion_type like '%ic%';

-- select make, model, propulsion_type
-- from cars
-- where propulsion_type ILIKE '%ic%';

-- Filtering on multiple columns

select make, model, propulsion_type, year
from cars
where propulsion_type = 'Hybrid' and year < 2020;

select make, model, propulsion_type, year
from cars
where propulsion_type = 'Hybrid' or year < 2020;

-- Filtering on missing data

select make, model, limited_production_count
from cars
where limited_production_count is null;

select make, model, limited_production_count
from cars
where limited_production_count is not null;

--  Aggregating Data
-- Simple aggregations

select count(*) from cars;

select sum(limited_production_count)
from cars;

select avg(time_to_60_mph_s)
from cars;

select max(time_to_60_mph_s)
from cars;

select min(time_to_60_mph_s)
from cars;

-- Grouping, filtering, and sorting

select propulsion_type, count(*)
from cars
group by propulsion_type;

-- select propultion_type, avg(time_to_60_mph_s) as mean_time_to_60_mph_s
-- from cars
-- group by propulsion_type
-- order by mean_time_to_60_mph_s;

select propultion_type, avg(time_to_60_mph_s) as mean_time_to_60_mph_s
from cars
group by propultion_type
having mean_time_to_60_mph_s > 2;

select propulsion_type, avg(time_to_60_mph_s) as mean_time_to_60_mph_s
from cars
where limited_production_count IS NOT NULL
group by propulsion_type
having mean_time_to_60_mph_s > 2;

-- PostgreSQL-Specific Syntax

select *
from cars
limit 2 offset 3;

select make || ' ' || model AS make_and_model
from cars;

select now(), current_date, current_time;

-- select *
-- from pg_catalog.pg_tables;






