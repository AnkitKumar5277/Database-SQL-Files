create database ola;
use ola;
select * from bookings;

-- 1
create view successful_bookings as
select * from bookings
where booking_status = "success";

-- 2
create view ride_distance as
select vehicle_type, avg(ride_distance) as avg_distance
from bookings
group by vehicle_type
order by avg_distance desc;
select * from ride_distance;

-- 3
create view canceled_rides_by_customer as
select count(*) from bookings
where booking_status = "Canceled by Driver";
select * from canceled_rides_by_customer;

-- 4
create view top_5_customer as
select customer_id, count(booking_id) as count_booked
from bookings
where Booking_value
group by customer_id
order by count_booked desc
limit 5;
select * from top_5_customer;

-- 5
create view rides_canceled_by_driver_personal_car_issues as
select count(*) 
from bookings
where Canceled_rides_by_driver = "personal & car related issue";
select * from rides_canceled_by_driver_personal_car_issues;

-- 6
create view max_min_rating_for_prime_sedan as
select min(driver_ratings) as min_rating, max(driver_ratings) as max_rating
from bookings
where vehicle_type = "prime sedan";
select * 
from max_min_rating_for_prime_sedan;

-- 7
select * from bookings;
create view upi_payment as
select * from bookings
where payment_method = "upi";
select * from upi_payment;

-- 8
select avg(customer_rating) as avg_rating, vehicle_type
from bookings
group by vehicle_type;

-- 9
select * from  bookings;
select sum(booking_value) as total_booking
from bookings
where booking_status = 'success';

-- 10
select booking_id, incomplete_rides_reason
from bookings
where incomplete_rides = 'yes';