# Aggregation Questions
#
#
# 1.Find the total amount of poster_qty paper ordered in the orders table.

SELECT SUM(poster_qty) as total_poster_sales
FROM orders;

# 2.Find the total amount of standard_qty paper ordered in the orders table.

SELECT COUNT(standard_qty) as total_standard_sales
FROM orders;

# 3.Find the total dollar amount of sales using the total_amt_usd in the orders table.

SELECT COUNT(total_amt_usd) as total_dollar_sales
FROM orders;

# 4.Find the total amount spent on standard_amt_usd and gloss_amt_usd paper for each
# order in the orders table. This should give a dollar amount for each order in the table.

SELECT standard_amt_usd + gloss_amt_usd as total
FROM orders;

# 5. Find the standard_amt_usd per unit of standard_qty paper. Your solution should use
# both an aggregation and a mathematical operator.

SELECT SUM(standard_amt_usd)/SUM(standard_qty) as unit_price_standard_qty
FROM orders;


# MAX, MIN, AVG
#
#
# 1.When was the earliest order ever placed? You only need to return the date.

SELECT MIN(occurred_at) as earliest_order
FROM orders;

# 2.Try performing the same query as in question 1 without using an aggregation function. 

SELECT occurred_at as earliest_order
FROM orders
ORDER BY occurred_at ASC
LIMIT 1;

# 3.When did the most recent (latest) web_event occur?
