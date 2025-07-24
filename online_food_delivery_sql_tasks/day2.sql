-- understand our food ordering system - queries

use online_food_del;

-- 1.Find name & price of all foood items costing more than 300

select item_name, price
from menu_items
where price > 300;

-- 2. List top 5 cheapest food items

select item_name, price
from menu_items
order by price asc
limit 5;

-- Tasks
-- 1.List all restaurants located in Delhi

select restaurant_name, city
from restaurants
where city =  'Delhi';

-- 2.Show the top 3 most expensive menu items

select item_name, price
from menu_items
order by price desc
limit 3;

-- 3.List all order IDs where quantity is greater than 2

select order_id, quantity
from order_details
where quantity > 2;