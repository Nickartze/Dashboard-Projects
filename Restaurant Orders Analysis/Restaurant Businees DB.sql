# Sampling tables
select *
from menu_items
limit 2;
select *
from order_details
limit 2;

# checking for duplicates
select distinct *
from order_details;

# random sampling and table combination
select o.order_details_id, o.order_id, concat(o.order_date,' ', o.order_time) date_time, o.item_id, item_name, category, price
from order_details o
left join menu_items m
on o.item_id = m.menu_item_id
-- where item_id is null
-- where order_details_id = 12233
order by order_details_id desc;

# checking number of items in an order and if an order has more than one NULL value item
with a as(
select *
from order_details
where order_id in (
select order_id
from order_details
where item_id is null)
order by order_id)

Select 
	order_id, count(*) no_order_items,
	sum(case when item_id is null then 1 else 0 end) as no_nulls
from a
group by 1
order by 2 desc,3;

# Isolating orders with Null item values
select order_id, count(*)
from (
select order_id, item_id
from order_details
where item_id is null) c
group by 1
order by 2 desc;