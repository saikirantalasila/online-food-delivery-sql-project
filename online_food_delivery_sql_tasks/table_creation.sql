-- CREATE ONLINE_FOOD_DEL DATABASE

CREATE DATABASE ONLINE_FOOD_DEL;

USE ONLINE_FOOD_DEL;

-- CREATE TABLES (customer,restaurants,menu,orders,order_details)

CREATE TABLE customers
(
customer_id int primary key,
customer_name varchar(60),
email varchar(60),
city varchar(60),
signup_date date
);

-- CREATE TABLE "restaurants"

CREATE TABLE restaurants
(
restaurant_id int primary key,
restaurant_name varchar(60),
city varchar(60),
registration_date date
);

-- create menu_items table

CREATE TABLE menu_items
(
item_id int primary key,
restaurant_id int,
item_name varchar(60),
price decimal(10,2),
constraint fk_menu_rest
foreign key(restaurant_id)
references restaurants(restaurant_id)
);

-- create orders table

CREATE TABLE orders
(
order_id int primary key,
customer_id int,
restaurant_id int,
order_date date,
constraint fk_order_cust
foreign key(customer_id)
references customers(customer_id),
constraint fk_order_rest
foreign key(restaurant_id)
references restaurants(restaurant_id)
);

-- create order_details table

CREATE TABLE order_details
(
order_detail_id int primary key,
order_id int,
item_id int,
quantity int,
constraint fk_ordDet_ord
foreign key(order_id)
references orders(order_id),
constraint fk_ordDet_menu
foreign key(item_id)
references menu_items(item_id)
);