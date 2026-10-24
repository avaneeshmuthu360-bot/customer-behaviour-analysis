--Q1.What is the total revenue genarated by male vs female customers?
SELECT gender,SUM(purchase_amount) AS revenue
FROM customer_behaviour
GROUP BY gender

--Q2.Which customers used a discount but still spent more than the average purchase amount?
SELECT customer_id,purchase_amount
FROM customer_behaviour
WHERE discount_applied="Yes" AND purchase_amount> (SELECT AVG(purchase_amount) FROM customer_behaviour)

--Q3.which are the top 5 products with highest average review rating?
SELECT item_purchased,ROUND(AVG(review_rating),2) AS "Average rating" 
FROM customer_behaviour
GROUP BY item_purchased
ORDER BY AVG(review_rating) DESC
LIMIT 5;

--Q4.compare the average purchase amounts between standard and express shipping.
SELECT shipping_type,ROUND(AVG(purchase_amount),2)
FROM customer_behaviour
WHERE shipping_type IN ('Standard','Express')
GROUP BY shipping_type

--Q5.Do subscribed customers spend more?compare average spend and total revenue between subscribers and non-subsribers.
SELECT subscription_status,COUNT(customer_id) AS "Total Customers",SUM(purchase_amount) AS "Total Revenue",ROUND(AVG(purchase_amount),2) AS "Average Spending"
FROM customer_behaviour
GROUP BY subscription_status;

--Q6.which 5 products have the highest percentage of purchases with discounts appllied?
SELECT item_purchased,ROUND(100*SUM(CASE WHEN discount_applied="Yes" THEN 1 ELSE 0 END)/COUNT(*),2) AS Discount_rate
FROM customer_behaviour
GROUP BY item_purchased
ORDER BY Discount_rate DESC
LIMIT 5;

--Q7.segment customers into new,returning,and loyal based on their total number of previous purchases,and sjow the count of each segment.
WITH customer_type AS (
SELECT customer_id,previous_purchases,
CASE
    WHEN previous_purchases=1 THEN "New"
	WHEN previous_purchases BETWEEN 2 AND 10 THEN "Returning"
	ELSE "Loyal"
END AS customer_segment
FROM customer_behaviour
)
SELECT customer_segment,COUNT(*) AS "Number of Customers"
FROM customer_type
GROUP BY customer_segment;

--Q8.what are the top 3 most purchased products within each category?
WITH item_counts AS (
SELECT category,item_purchased,COUNT(customer_id) AS total_orders,
ROW_NUMBER() OVER (
PARTITION BY category ORDER BY COUNT(customer_id) DESC) AS item_rank
FROM customer_behaviour
GROUP BY category,item_purchased
)
SELECT item_rank,category,item_purchased,total_orders
FROM item_counts
WHERE item_rank<=3;

--Q9 Are customers who are repeat buyers(more than 5 previous purchases) alos likely to subscribe?
SELECT subscription_status,COUNT(customer_id) AS Repeat_buyers
FROM customer_behaviour
WHERE  previous_purchases>5
GROUP BY subscription_status;

--Q10.what is the revenue contribution of each age group?
SELECT age_category,SUM(purchase_amount) AS Total_revenue
FROM customer_behaviour
GROUP BY age_category
ORDER BY total_revenue DESC;