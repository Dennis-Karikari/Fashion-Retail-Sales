CREATE DATABASE fashion_retail;

USE fashion_retail;


CREATE TABLE sales (
    customer_reference_id INT UNSIGNED,
    item_purchased VARCHAR(150),
    purchase_amount DECIMAL(10,2),
    purchase_date DATE,
    review_rating DECIMAL(2,1),
    payment_method VARCHAR(100)
);

DESCRIBE sales;

LOAD DATA INFILE 'fashion_retail_salesexcel.csv' INTO TABLE sales
FIELDS TERMINATED BY ','
IGNORE 1 LINES;

/* 1. SALES PERFROMACE ANALYSIS 
This is to know our best perfoming item. */

-- Total sales by item_purchased
SELECT 
    item_purchased,
    SUM(purchase_amount) as total_sales,
    COUNT(DISTINCT customer_reference_id) as order_count,
    ROUND(SUM(purchase_amount) / COUNT(DISTINCT customer_reference_id), 2) as avg_order_value
FROM sales
GROUP BY item_purchased
ORDER BY total_sales DESC;

/* CUSTOMER SPENDING ANALYSIS  
This is to understand who our most valuable customers are and their purchasing patterns. */

-- Top spending customers
SELECT 
    DISTINCT customer_reference_id,
    COUNT(*) AS purchase_count,
    SUM(purchase_amount) AS total_spent,
    AVG(purchase_amount) AS avg_purchase_amount
FROM sales
GROUP BY customer_reference_id
ORDER BY total_spent DESC
LIMIT 3;

-- Customer purchase frequency
SELECT 
    customer_reference_id,
    COUNT(*) AS purchase_count,
    MIN(purchase_date) AS first_purchase,
    MAX(purchase_date) AS last_purchase,
    DATEDIFF(MAX(purchase_date), MIN(purchase_date)) / NULLIF(COUNT(*)-1, 0) AS avg_days_between_purchases
FROM sales
GROUP BY customer_reference_id
HAVING COUNT(*) > 1
ORDER BY avg_days_between_purchases;


/* 2. PRODUCT PERFORMANCE  
This is to determine which products are driving revenue and customer satisfaction. */ 

-- Best seeling items
SELECT 
    item_purchased,
    COUNT(*) AS units_sold,
    SUM(purchase_amount) AS total_revenue,
    AVG(purchase_amount) AS avg_price,
    AVG(review_rating) AS avg_rating
FROM sales
GROUP BY item_purchased
ORDER BY total_revenue DESC
LIMIT 3;

-- price distribution by item
SELECT 
    item_purchased,
    MIN(purchase_amount) AS min_price,
    MAX(purchase_amount) AS max_price,
    AVG(purchase_amount) AS avg_price,
    STDDEV(purchase_amount) AS price_stddev
FROM sales
GROUP BY item_purchased
ORDER BY price_stddev DESC;


/* 3. PAYMENT AND REVIEW ANALYSIS 
Understanding customer preferences and satisfactions across payment methods */ 

-- Payment method preferences
SELECT 
    payment_method,
    COUNT(*) AS transaction_count,
    SUM(purchase_amount) AS total_value,
    AVG(purchase_amount) AS avg_transaction_value,
    AVG(review_rating) AS avg_rating
FROM sales
GROUP BY payment_method
ORDER BY transaction_count DESC;

-- review rating distribution
SELECT 
    review_rating,
    COUNT(*) AS rating_count,
    SUM(purchase_amount) AS total_value,
    AVG(purchase_amount) AS avg_purchase_amount
FROM sales
WHERE review_rating IS NOT NULL
GROUP BY review_rating
ORDER BY review_rating;

/* 4. Temporal Analysis
This is to dentify patterns in when customers make purchases */ 

-- daily sales trends
SELECT 
    DATE(purchase_date) AS purchase_day,
    COUNT(*) AS transaction_count,
    SUM(purchase_amount) AS daily_sales,
    AVG(purchase_amount) AS avg_transaction_value
FROM sales
GROUP BY DATE(purchase_date)
ORDER BY purchase_day;

/* 5. CUSTOMER SEGMENTATION 
Classify customers by value and engagement */

-- RFM analysis (Recency, Frequency, Monetary)
WITH RFM_data AS (
    SELECT 
        customer_reference_id,
        DATEDIFF(CURRENT_DATE, MAX(purchase_date)) AS recency,
        COUNT(*) AS frequency,
        SUM(purchase_amount) AS monetary
    FROM sales
    GROUP BY customer_reference_id
)
SELECT 
    customer_reference_id,
    recency,
    frequency,
    monetary,
    NTILE(5) OVER (ORDER BY recency DESC) AS recency_score,
    NTILE(5) OVER (ORDER BY frequency) AS frequency_score,
    NTILE(5) OVER (ORDER BY monetary) AS monetary_score,
    CONCAT(
        NTILE(5) OVER (ORDER BY recency DESC),
        NTILE(5) OVER (ORDER BY frequency),
        NTILE(5) OVER (ORDER BY monetary)
    ) AS RFM_score
FROM RFM_data
ORDER BY monetary DESC;

/* 6. PRODUCT-PAYMENT METHOD CORRELATION 
This is to understand relationships between products and payment preferences */ 

-- Preferred Payment Methods by Product
SELECT 
    item_purchased,
    payment_method,
    COUNT(*) AS transaction_count,
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (PARTITION BY item_purchased), 2) AS percentage
FROM sales
GROUP BY item_purchased, payment_method
ORDER BY item_purchased, transaction_count DESC;

-- High-value purchase analysis
SELECT 
    item_purchased,
    COUNT(*) AS total_purchases,
    SUM(CASE WHEN purchase_amount > (SELECT AVG(purchase_amount) + STDDEV(purchase_amount) FROM sales) THEN 1 ELSE 0 END) AS high_value_purchases,
    ROUND(SUM(CASE WHEN purchase_amount > (SELECT AVG(purchase_amount) + STDDEV(purchase_amount) FROM sales) THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS high_value_percentage
FROM sales
GROUP BY item_purchased
HAVING COUNT(*) > 10
ORDER BY high_value_percentage DESC;


