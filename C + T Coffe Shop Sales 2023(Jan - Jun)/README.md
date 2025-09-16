# Coffee Shop Sales: Tea and Coffee Product Breakdown, Jan - Jun 2023

***

### Data Viz

[Coffee Shop Sales Dashboard](https://public.tableau.com/app/profile/amana.ezennia6720/viz/CoffeeShopSales-TeaandCoffee/Dashboard1?publish=yes)

***

## Selecting project database
````
use projects;
````

## Creating table for data ingestion
````
/*
# table formatting
drop table if exists coffee_shop_sales_2;
create table coffee_shop_sales_2
(
transaction_id int primary key,
transaction_date date,
transaction_time char(10),
transaction_qty int,
store_id int,
store_location varchar(100),
product_id int,
unit_price decimal(5,3),
product_category varchar(20),
product_type varchar(100),
productt_detail varchar(100))
*/
````

***

## Taking a look at the dataset
````
select *
from coffee_shop_sales
limit 5;
````

## First and last day of sales
````
select min((transaction_date)) first_day, max(transaction_date) last_day
from coffee_shop_sales;
````

## Checking count of rows
````
select count(*)
from coffee_shop_sales;
````

***

## Checking distinct product categories
````
select distinct product_category
from coffee_shop_sales;
````

## Filtering and checking count for **tea** and **coffee** for analysis
````
select count(*)
from(
select *
from coffee_shop_sales
where product_category = 'coffee' or product_category = 'tea')a;
````

## Available coffee and tea product types and details
````
select distinct product_category, product_type, product_detail
from coffee_shop_sales
where product_category = 'coffee' or product_category = 'tea'
order by 1;
````

***

## Store locations
````
select distinct store_location
from coffee_shop_sales
where product_category = 'coffee' or product_category = 'tea';
````

## Store income from tea and coffee sales
````
select store_location, product_category, sum(unit_price * transaction_qty) total_made
from coffee_shop_sales
where product_category = 'coffee' or product_category = 'tea'
group by 1,2
order by 1;
````

***

## Monthly income from tea and coffee sales
````
select monthname(transaction_date) month, product_category, sum(unit_price * transaction_qty) total_made
from coffee_shop_sales
where product_category = 'coffee' or product_category = 'tea'
group by 1,2;
````

***

## Final select query for dashboard creation
````
select 
	transaction_id, 
    transaction_date, left(dayname(transaction_date), 3) day, left(monthname(transaction_date),3) month,quarter(transaction_date) quarter,
    transaction_time, hour(transaction_time) hour,
    transaction_qty, store_id, store_location, product_id, 
    round(unit_price, 2) unit_price, product_category, product_type, product_detail, 
    round(unit_price * transaction_qty,2) income_revenue
from coffee_shop_sales
where product_category = 'coffee' or product_category = 'tea'
;
-- limit 10;
````

***

## Source file

- [Coffee Shop Sales](https://www.mavenanalytics.io/data-playground/coffee-shop-sales)
