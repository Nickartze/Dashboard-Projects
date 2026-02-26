# AO Restaurant Order Analysis - Project Overview
The goal of this project is to analyse the performance of AO Q1 orders across its four menu categories, to direct business expenses on menu items. 

Project Source Link: [restaurant-orders](https://mavenanalytics.io/data-playground/restaurant-orders) 
## Dataset Structure
The dataset consisted of two tables and a data dictionary, including information on prices, menu categories, items in each category, order_ids and item_ids.

![ERD](https://github.com/Nickartze/Files/blob/main/Restaurant%20Orders%20Analysis/Restaurant%20Orders%20ERD.png)

## Initial Checks
Checklist
Data Type Formatting (Dates, Numbers and Time)
Removing Duplicates
Column Stats Check
Nulls

The data in the Order_Details table contained Null values for a few Item_ids. Further investigation shows that no order has more than one unknown item, and some are just one Null.




Snapshot of Null-Valued Items
![Sample Table](https://github.com/Nickartze/Files/blob/main/Restaurant%20Orders%20Analysis/Restaurant%20Orders%20Table.png)


## Insights Summary
To analyse Order performance across the menu, the analysis focused on these Key metrics:
Total Revenue: The total amount made from orders made contains.
Items Ordered: Items inside each Order made

Total Revenue:
The first quarter had a revenue of 159,218 from 5k ordered made in our four menu category(Italian, Asian, Mexican, American)
Italian dishes bought in the most revenue, while Asian dishes were the most ordered.
Items Ordered:
With over 12k ordered items, Korean Beef Bowl was the most ordered item, generating 10k+ in sales and 588 times ordered.
Chicken Tacos was the least favourite among customers only being ordered 123 times, but generating closer revenue to Potstickers (205) just before it at 1470 and 1845 respectively.


## Recommendations
While some orders contain unknown items, they have been excluded from the analysis breakdown, but are shown in the tables and orders trend analysis. 

American Menu Exploration: Adding a few more dishes to the American menu could help boost sales. As it seems, pricing does not influence order frequency.
Full Meals vs Sides: Adding more full-priced meal options, as most of the items ordered are full meals.



## Dashboard
The Tableau dashboard can be found here.
![Dashboard](https://github.com/Nickartze/Files/blob/main/Restaurant%20Orders%20Analysis/Restaurant%20Orders%20Dashboard.png)


## Written Code
The SQL queries used to inspect and clean the data for this analysis can be found here [link](https://github.com/Nickartze/Dashboard-Projects/blob/main/Restaurant%20Orders%20Analysis/Restaurant%20Businees%20DB.sql).


## Assumptions and Caveats:
Throughout the analysis, multiple assumptions were made to manage challenges with the data. These assumptions and caveats are noted below:

* Missing data is for items not inputted, and orders containing Nulls did not have said item already in.
 
* Meals were thought of as either Full or Side meals as they were not stated in the Menu
 
