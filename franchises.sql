create database franchises;
use franchises;

CREATE TABLE franchises (
    franchise VARCHAR(50),
    inception_year INT,
    total_revenue_busd DECIMAL(5,1),
    original_medium VARCHAR(20),
    owner VARCHAR(50),
    n_movies INT
);

INSERT INTO franchises (franchise, inception_year, total_revenue_busd, original_medium, owner, n_movies) VALUES
('Star Wars', 1977, 46.7, 'movie', 'The Walt Disney Company', 12),
('Mickey Mouse and Friends', 1928, 52.2, 'cartoon', 'The Walt Disney Company', null),
('Anpanman', 1973, 38.4, 'book', 'Froebel-kan', 33),
('Winnie the Pooh', 1924, 48.5, 'book', 'The Walt Disney Company', 6),
('Pokémon', 1996, 88, 'video game', 'The Pokémon Company', 24),
('Disney Princess', 2000, 45.4, 'movie', 'The Walt Disney Company', null);

-- Querying tables:

-- Get all the columns from a table using SELECT *
select * from franchises;

-- Get a column from a table by name using SELECT col
select franchise
from franchises;

-- Get multiple columns from a table by name using SELECT col1, col2
select franchise, inception_year
from franchises;

-- Override column names with SELECT col AS new_name
select franchise, inception_year as creation_year
from franchises;

-- Arrange the rows in ascending order of values in a column with ORDER BY col
select franchise, inception_year
from franchises
order by inception_year;

-- Arrange the rows in descending order of values in a column with ORDER BY col DESC
select franchise, total_revenue_busd
from franchises
order by total_revenue_busd desc;

-- Limit the number of rows returned with LIMIT n
select * from franchises
limit 2;

-- Get unique values with SELECT DISTINCT
SELECT distinct owner
from franchises;

-- Filtering Data
-- Filtering on numeric columns

-- Get rows where a number is greater than a value with WHERE col > n
select franchise, inception_year
from franchises
where inception_year > 1928;

-- Get rows where a number is greater than or equal to a value with WHERE col >= n
SELECT franchise, inception_year
from franchises
where inception_year >= 1928;

-- Get rows where a number is less than a value with WHERE col < n
SELECT franchise, inception_year
from franchises
where inception_year <= 1977;

-- Get rows where a number is equal to a value with WHERE col = n
select franchise, inception_year
from franchises
where inception_year = 1996;

-- Get rows where a number is not equal to a value with WHERE col <> n or WHERE col != n
select franchise, inception_year
from franchises
where inception_year <> 1996;

-- Get rows where a number is between two values (inclusive) with WHERE col BETWEEN m AND n
select franchise, inception_year
from franchises
where inception_year between 1928 and 1977;

-- Filtering on text columns

-- Get rows where text is equal to a value with WHERE col = 'x'
select franchise, original_medium
from franchises
where original_medium = 'book';

-- Get rows where text is one of several values with WHERE col IN ('x', 'y') 
select franchise, original_medium
from franchises
where original_medium in ('movie', 'video game');

-- Get rows where text contains specific letters with WHERE col LIKE ' '
-- (% represents any characters)
select franchise, original_medium
from franchises
where original_medium LIKE '%oo%';

-- Filtering on multiple columns

-- Get the rows where one condition and another condition holds with WHERE condn1 AND condn2
select franchise, inception_year, total_revenue_busd
from franchises
where inception_year < 1950
and total_revenue_busd > 50;

-- Get the rows where one condition or another condition holds with WHERE condn1 OR condn2
select franchise, inception_year, total_revenue_busd
from franchises
where inception_year < 1950 or total_revenue_busd > 50;

-- Filtering on missing data

-- Get rows where values are missing with WHERE col IS NULL
select franchise, n_movies
from franchises
where n_movies IS NULL;

-- Get rows where values are not missing with WHERE col IS NOT NULL
select franchise, n_movies
from franchises
where n_movies IS NOT NULL;

-- Aggregating Data
-- Simple aggregations

-- Get the total number of rows SELECT COUNT(*)
select count(*) from franchises;

-- Get the total value of a column with SELECT SUM(col)
select sum(total_revenue_busd) from franchises;

-- Get the mean value of a column with SELECT AVG(col)
select avg(total_revenue_busd) from franchises;

-- Get the minimum value of a column with SELECT MIN(col)
select min(total_revenue_busd) from franchises;

-- Get the maximum value of a column with SELECT MAX(col)
select max(total_revenue_busd)
from franchises;

-- Grouping, filtering, and sorting

-- Get summaries grouped by values with GROUP BY col
select owner, count(*) 
from franchises
group by owner;

-- Get summaries grouped by values, in order of summaries with GROUP BY col ORDER BY smmry DESC
select original_medium, sum(n_movies) as total_movies
from franchises
group by original_medium
order by total_movies desc;

-- Get rows where values in a group meet a criterion with GROUP BY col HAVING condn
select original_medium, sum(n_movies) as total_movies
from franchises
group by original_medium
order by total_movies desc;
-- having total_movies > 10;

-- Filter before and after grouping with WHERE condn_before GROUP BY col HAVING condn_after
-- select original_medium, sum(n_movies) as total_movies
-- from franchises
-- where owner = 'the walt disney company'
-- group by total_movies desc
-- having total_movies > 10;

--  MySQL-Specific Syntax
-- Limit the number of rows returned, offset from the top with LIMIT m, n
select *
from franchises
limit 2,3;

--  By default, MySQL uses case insensitive matching in WHERE clauses
select * from franchises
where owner = 'the walt disney compnay';

--  To get case sensitive matching, use WHERE BINARY condn
select * from franchises
where binary owner = 'THE WALT DISNEY COMPANY';

--  Get the current date with CURDATE() and the current datetime with NOW() or CURTIME()
select curdate(), now(), curtime();

--  List available tables with show tables
show tables;