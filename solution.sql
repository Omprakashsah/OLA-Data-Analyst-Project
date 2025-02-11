create database ola;
use ola;

-- 1. Retrieve all successful bookings:

create view Success_Bookings as
select * from bookings
where Booking_Status = 'Success';

select * from Success_Bookings;

-- 2. Find the average ride distance for each vehicle type:

create view Avg_Ride_Dist_Of_EachVehicle as
select Vehicle_Type, avg(Ride_Distance)
as avg_distance
from bookings group by Vehicle_Type;

select * from Avg_Ride_Dist_Of_EachVehicle;

-- 3. Get the total number of cancelled rides by customers:
select * from bookings;

select count(*) as cancelled_rides_customers from bookings
where Booking_Status = 'Cancelled by Customer';


-- 4. List the top 5 customers who booked the highest number of rides:
select * from bookings;
select Customer_ID, count(Booking_ID) as no_Of_rides
from bookings group by Customer_ID order by no_Of_rides DESC limit 5;

-- 5. Get the number of rides cancelled by drivers due to personal and car-related issues:
select count(Cancelled_Rides_by_Driver) as cancelled_by_driver from bookings
where Reason_for_cancelling_by_Driver = 'Personal & Car related issues';


-- 6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
select * from bookings;

select max(Driver_ratings) as max_ratings from bookings
where Vehicle_Type = 'Prime Sedan';

select min(Driver_ratings) as min_ratings from bookings
where Vehicle_Type = 'Prime Sedan';

-- 7.Find the average customer rating per vehicle type:
select * from bookings;

select Vehicle_Type, Round(avg(Customer_Rating),2) as Avg_Rating_perVehicle
from bookings group by Vehicle_Type;


-- 8.Find the average ride distance per vehicle type:
select Vehicle_Type, Round(avg(Ride_Distance),2) as avg_ride_PerVehicle
from bookings group by Vehicle_Type order by  avg_ride_PerVehicle Desc;


-- 9. Calculate the total booking value of rides completed successfully:
select * from bookings;

select round(sum(Booking_Value),2) as total_booking_value
from bookings where Booking_Status = 'Success';

-- 10. List all incomplete rides along with the reason:
select * from bookings;

select Customer_ID, Vehicle_Type, Reason_for_cancelling_by_Customer from bookings
where Booking_Status = 'Failure';