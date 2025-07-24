-- DAY-8 Theme: Summarizing Queries
use online_food_del;

-- 1.Monthly Order Trends

select month(order_date) as month_number, monthname(order_date) as month_name, count(order_id) as monthly_orders
from orders
group by month(order_date), monthname(order_date)
order by month_number;

-- May has the highest orders; push premium items and combos during this month.
-- December shows the lowest orders; consider year-end offers and campaigns.
-- Jan to June shows consistent order volume; focus marketing budget here.
-- Orders dip from July onwards; analyze and address seasonal behavior changes.

-- 2.Top 3 Cities by Revenue
select c.city, sum(m.price*od.quantity) as Total_Revenue
from customers c
join orders o on c.customer_id = o.customer_id
join order_details od on o.order_id = od.order_id
join menu_items m on m.item_id = od.item_id
group by c.city
order by Total_Revenue desc
limit 3;

-- Chennai is the top revenue city; increase local promotions.
-- Pune and Bangalore have strong sales; customize offers for these markets.
-- Enhance delivery and customer service in these cities.
-- Monitor competitors closely in revenue-leading cities.

-- Tasks
-- 1. Number of Unique Customers per City

select city, count(distinct customer_id) as unique_customers
from customers
group by city;

-- Ahmedabad and Kolkata have strong customer bases; focus marketing here.
-- Jaipur and Hyderabad have fewer customers; increase promotional efforts.
-- Mumbai, Pune, and Chennai show balanced customer numbers; maintain engagement.
-- Use customer distribution to allocate city-wise marketing budget effectively.

-- 2.Most Frequently Ordered Items
select m.item_id, m.item_name, sum(od.quantity) as total_orders
from menu_items m
join order_details od on od.item_id = m.item_id
group by m.item_id, m.item_name
order by total_orders desc;

-- Top ordered food items show customer preferences
-- Hakka Noodles and Gulab Jamun are most popular, each ordered 70+ times
-- Momos and Veg Biryani also have strong demand
-- Insights can help focus inventory and promotions on these best-sellers

-- 3.Restaurants with Low Order Counts (< 30)
select r.restaurant_id, r.restaurant_name, count(o.order_id) as total_orders
from restaurants r
join orders o on r.restaurant_id = o.restaurant_id
group by r.restaurant_id, r.restaurant_name
having total_orders < 30
order by total_orders;
-- Business can target these for:
-- 1. Marketing campaigns to boost awareness.
-- 2. Menu refresh or special offers to attract customers.
-- 3. Operational review to improve service speed and quality.
