-- DAY-5 Theme: Performance Filtering
-- GROUP BY, HAVING, Aggregate Filtering

use online_food_del;

-- 1.Find cities with more than 5 total orders
-- city->restaurants,count(order_id)=>orders

select r.city, count(o.order_id) as total_orders
from restaurants r
join orders o
on r.restaurant_id = o.restaurant_id
group by r.city
having count(o.order_id)>5;

-- 2. Show food items that earned more than ₹1000 in total revenue
-- item_name-->menu_items, sum(revenue= price*quantity)

select m.item_name, sum(m.price*od.quantity) as total_revenue
from menu_items m
join order_details od
on m.item_id = od.item_id
group by m.item_name
having sum(m.price*od.quantity)>1000;

-- DAY-5 TASKS LIST
-- 1. List customers who placed more than 3 orders
-- customer_id,customer_name,count(order_id)>3

select c.customer_id, c.customer_name, count(o.order_id) as total_orders_placed
from customers c 
join orders o
on c.customer_id = o.customer_id
group by c.customer_id, c.customer_name
having count(o.order_id)>3;

-- 2. Display menu items that were ordered more than 2 times
-- item_id,item_name -->menu_items
-- count(distinct order_id) as total_orders-->order_details

select m.item_id, m.item_name, count(Distinct od.order_id) as total_orders
from menu_items m 
join order_details od
on m.item_id = od.item_id
group by m.item_id, m.item_name
having count(Distinct od.order_id)>2;

-- 3. Find categories where the average item price is greater than ₹300
-- there is no categories column in menu_items table












