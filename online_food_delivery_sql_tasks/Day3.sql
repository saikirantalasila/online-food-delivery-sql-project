-- Day 3 joins

use online_food_del;

-- 1.show all orders along with the restaurant name from which they were placed

select o.order_id, r.restaurant_name
from orders o
join restaurants r
on 
o.restaurant_id = r.restaurant_id;

-- 2.show customer names and order dates for orders placed in january 2023

select c.customer_name, o.order_date, o.order_id
from 
customers c join orders o
on 
c.customer_id = o.customer_id
where o.order_date between '2023-01-01' AND '2023-01-31';

-- Tasks
-- 1.List all customers along with their city who placed an order on or after '2023-01-01'

select c.customer_name, c.city , o.order_date
from
customers c join orders o
on 
c.customer_id = o.customer_id
where o.order_date >= '2023-01-01';

-- 2.Show restaurant names and order IDs for orders placed from restaurants in Mumbai

select r.restaurant_name, o.order_id, r.city
from 
restaurants r join orders o
on r.restaurant_id = o.restaurant_id
where r.city = 'Mumbai';

-- 3.Customers who have ordered from a specific restaurant - ‘Spice Villa’

select c.customer_name, o.order_id, r.restaurant_name
from 
customers c join orders o 
on 
c.customer_id = o.customer_id
join restaurants r
on o.restaurant_id = r.restaurant_id
where r.restaurant_name = 'Spice Villa';
