use online_food_del;

-- Day 4 – GROUP BY & Aggregations
-- 1.Query 1: Count how many orders each customer has placed

select c.customer_name, count(o.order_id) as total_orders
from customers c
join orders o 
on c.customer_id = o.customer_id
group by c.customer_name;

-- 2: Show total revenue earned from each city

select r.city, sum(m.price*od.quantity) as total_revenue
from restaurants r
join menu_items m
on r.restaurant_id = m.restaurant_id
join order_details od
on m.item_id = od.item_id
group by r.city;

-- Tasks
-- 1. Find the total number of times each food item was ordered

select m.item_name, count(od.order_detail_id) as total_orders
from menu_items m
join order_details od 
on m.item_id = od.item_id
group by m.item_name;

-- 2. Calculate the average order value for each customer city

select c.city, AVG(m.price*od.quantity) as Avg_order_value
from 
customers c join orders o
on c.customer_id = o.customer_id
join order_details od 
on o.order_id = od.order_id
join menu_items m 
on m.item_id = od.item_id
group by c.city;

-- 3. Find how many different food items were ordered per restaurant

select r.restaurant_name, count( distinct od.item_id) as diff_food_items
from restaurants r 
join menu_items m
on r.restaurant_id = m.restaurant_id
join order_details od
on od.item_id = m.item_id
group by r.restaurant_name;
