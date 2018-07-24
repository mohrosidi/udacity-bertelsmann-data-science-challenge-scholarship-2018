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

SELECT MAX(occurred_at) as latest_web_event
FROM web_events;

# 4.Try to perform the result of the previous query without using an aggregation function.

SELECT occurred_at as latest_web_event
FROM web_events
ORDER BY occurred_at DESC
LIMIT 1;

# 5.Find the mean (AVERAGE) amount spent per order on each paper type, as well as the mean
# amount of each paper type purchased per order. Your final answer should have 6 values -
# one for each paper type for the average number of sales, as well as the average amount.

SELECT AVG(standard_qty) as avg_standard,
       AVG(gloss_qty) as avg_gloss,
       AVG(poster_qty) as avg_poster,
       AVG(standard_amt_usd) as avg_standart_usd,
       AVG(gloss_amt_usd) as avg_gloss_usd,
	   AVG(poster_amt_usd) as avg_poster_usd
FROM orders;

# 6.What is the MEDIAN total_usd
# spent on all orders?

/*
PERCENTILE_CONT interpolates the appropriate value, whether or not it exists in the data set,
while PERCENTILE_DISC always returns an actual value from the set.
*/

SELECT PERCENTILE_CONT(0.5)
WITHIN GROUP (ORDER BY total_amt_usd) as median_total_usd
FROM orders;


# Udycity solution:

/*Since there are 6912 orders - we want the average of the 3457 and 3456 order amounts when ordered.
This is the average of 2483.16 and 2482.55. This gives the median of 2482.855. This obviously isn't
an ideal way to compute. If we obtain new orders, we would have to change the limit. SQL didn't even
calculate the median for us. The above used a SUBQUERY, but you could use any method to find the two
necessary values, and then you just need the average of them.
*/

SELECT *
FROM (SELECT total_amt_usd
      FROM orders
      ORDER BY total_amt_usd
      LIMIT 3457) AS Table1
ORDER BY total_amt_usd DESC
LIMIT 2;

