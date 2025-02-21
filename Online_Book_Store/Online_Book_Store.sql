create database online_book_store;
use online_book_store;

SELECT * FROM books;
SELECT * FROM customers;
SELECT * FROM orders;

-- 1
select * from books
where genre = "Fiction";

-- 2
select * from books
where Published_Year > 1950;

-- 3
select * from Customers
where country = 'Canada';

-- 4
select * from orders
where Order_Date between '2023-11-01' and '2023-11-30';

-- 5
select sum(Stock) as sum_stock
from books;

-- 6
select * from books
order by price desc
limit 1;

-- 7
select * from orders
where quantity >= 1;

-- 8
select * from orders
where Total_Amount > 20;

-- 9
select distinct genre
from books;

-- 10
select * from books
order by stock
limit 1;

-- 11
select sum(Total_amount) as total_revenue
from orders;

# advance
-- Retrieve the total number of books sold for each genre:
select * from orders;
select b.Genre, sum(o.Quantity) as total_books_sold
from orders o
join books b 
on o.book_id = b.book_id
group by b.genre;

# 2
select * from books;
select avg(price) as avg_price
from books
where genre = "Fantasy";

# 3
select * from orders;
select * from customers;

SELECT customers.name, COUNT(orders.order_id) AS order_count
FROM customers
JOIN orders 
ON customers.customer_id = orders.customer_id
GROUP BY customers.customer_id, customers.name
HAVING order_count >= 2;

# 4
select * from orders;
select * from books;
select orders.Book_ID, books.title, count(orders.Order_ID) as orders_count 
from books
join orders
on books.Book_ID = orders.Book_ID
group by books.Title, orders.book_id
order by orders_count desc
limit 1;

# 5
select * from books;
select Title, price from books
where Genre = "Fantasy"
order by price desc
limit 3;

# 6
select * from books;
select * from orders;
select books.Author, sum(orders.Quantity) as total_quantity
from books
join orders
on books.Book_ID = orders.Book_ID
group by books.Author
order by total_quantity desc;

# 7
select * from customers;
select * from orders;
select distinct customers.Name, customers.City, orders.Total_Amount
from customers
join orders
on customers.Customer_ID = orders.Customer_ID
where orders.Total_Amount > 30;

# 8
select * from customers;
select * from orders;
select c.customer_id, c.name, sum(o.Total_Amount) as total_spent
from customers c
join orders o
on c.Customer_ID = o.Customer_ID
group by c.Customer_ID, c.name
order by total_spent desc 
limit 1;

# 9
SELECT 
    b.book_id, b.title, b.stock, 
    COALESCE(SUM(o.quantity), 0) AS order_quantity, b.stock - 
    COALESCE(SUM(o.quantity), 0) AS remaining_quantity
FROM books b
LEFT JOIN orders o 
ON b.book_id = o.book_id
GROUP BY b.book_id, b.title, b.stock 
ORDER BY b.book_id;
