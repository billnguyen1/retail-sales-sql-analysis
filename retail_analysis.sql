 -- ===============================
 -- Retail Sales Analysis Project
 -- Author: Bill Nguyen
 -- ===============================
 
 -- View Data
 SELECT * from superstore
 LIMIT 20;
 
 -- Convert Data Type From Text to Date
 ALTER TABLE superstore
 ADD COLUMN order_date_clean DATE;
 
 UPDATE superstore
 SET order_date_clean = str_to_date(order_date, '%m/%d/%Y');
 
 ALTER TABLE superstore
 DROP COLUMN order_date;
 
 ALTER TABLE superstore
 CHANGE COLUMN order_date_clean order_date DATE;

-- Move a column after another column
ALTER TABLE superstore
MODIFY COLUMN order_date DATE AFTER order_id;

 -- ======================
 -- Analysis Questions
 -- ======================
 
 -- How much did each category make in revenue?
 SELECT category, SUM(sales) as Total_Sales
 FROM superstore
 GROUP BY category; 
 
 -- What is the profit per region?
 SELECT region, SUM(profit) as Profit
 FROM superstore
 GROUP BY region;

-- How many orders were placed per year?
SELECT YEAR(order_date), COUNT(order_id) as Orders
FROM superstore
GROUP BY YEAR(order_date);

-- 