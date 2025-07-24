-- DAY-6 Theme: Subquery

use online_food_del;

-- 1.Show all menu items,price along with the average price of all items
-- item_name,price,Avg(price)-->using sub query we get

select item_name, price, (select avg(price) from menu_items) as Avg_price
from menu_items;

-- 2. Show customers who placed at least one order
-- customer_name,customer_id,
-- (selects customer id in orders table) whose is order atleast once->subquery

select customer_id, customer_name
from customers
where customer_id in (select distinct customer_id from orders);

-- DAY-6 TASKS LIST
-- 1. Show each food item and how much more it costs than the average
-- item_name, price -> from menu_items table
-- avg_price -> calculated using subquery
-- Subtract avg_price from item price → show as price_difference

select item_name, price, Avg_price, (price-Avg_price) as Price_Difference
from(
	select item_name, price, (select Avg(price) from menu_items) as Avg_price
	from menu_items
    ) as result_table;

-- 2. List food items that cost more than the average price
-- item_name,price->menu_items
-- avg_price -> via subquery
-- Filter where price > avg_price from result_table

select item_name, price, Avg_Price
from (
	select item_name, price, (select Avg(price) from menu_items) as Avg_Price
	from menu_items
    ) as result_table
where price > Avg_Price;

-- 3. Show customers who haven’t placed any orders (HINT: USE “not in” )
-- customer_id, customer_name-->customers
-- Exclude those with customer_id present in orders table using NOT IN

select customer_id, customer_name
from customers
where customer_id not in (select customer_id from orders);





