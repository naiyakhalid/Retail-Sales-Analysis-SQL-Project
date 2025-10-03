-- SQL Retail Sales Analysis - P1
CREATE DATABASE sql_project_p2;

-- Create TABLE
DROP TABLE IF EXISTS retail_sales;
CREATE TABLE retail_sales
            (
                transaction_id INT PRIMARY KEY,	
                sale_date DATE,	 
                sale_time TIME,	
                customer_id	INT,
                gender	VARCHAR(15),
                age	INT,
                category VARCHAR(15),	
                quantity	INT,
                price_per_unit FLOAT,	
                cogs	FLOAT,
                total_sale FLOAT
            );

SELECT TOP 10 * FROM Retail_Sales_Analysis 

-- Total no of rows
SELECT COUNT(*) AS Total_Rows FROM Retail_Sales_Analysis

-- Finding NULL Values
SELECT * FROM Retail_Sales_Analysis WHERE transactions_id IS NULL;  -- NO NULL 
SELECT * FROM Retail_Sales_Analysis WHERE age IS NULL;   -- Have NULL 
SELECT sale_date FROM Retail_Sales_Analysis WHERE sale_date IS NULL;   -- NO NULL 
SELECT * FROM Retail_Sales_Analysis WHERE sale_time IS NULL;   -- NO NULL 
SELECT customer_id FROM Retail_Sales_Analysis WHERE customer_id IS NULL;  -- NO NULL 
SELECT * FROM Retail_Sales_Analysis WHERE gender IS NULL;   -- NO NULL 
SELECT * FROM Retail_Sales_Analysis WHERE category IS NULL;  -- NO NULL 
SELECT * FROM Retail_Sales_Analysis WHERE  quantiy IS NULL; -- Have NULL 
SELECT * FROM Retail_Sales_Analysis WHERE  price_per_unit IS NULL; -- Have NULL 
SELECT * FROM Retail_Sales_Analysis WHERE  cogs IS NULL; -- Have NULL 
SELECT * FROM Retail_Sales_Analysis WHERE  total_sale IS NULL;  -- Have NULL 

SELECT * FROM Retail_Sales_Analysis 
WHERE transactions_id IS NULL
OR age IS NULL
OR sale_date IS NULL
OR sale_time IS NULL
OR customer_id IS NULL
OR gender IS NULL
OR category IS NULL
OR quantiy IS NULL 
OR price_per_unit IS NULL
OR cogs IS NULL 
OR total_sale IS NULL 
   
-- Missing values imputing using mean fill 
WITH mean_vals AS (
    SELECT 
        CAST(AVG(age) AS INT) AS mean_age,
        CAST(AVG(quantiy) AS INT) AS mean_quantiy,
        AVG(price_per_unit) AS mean_price,
        AVG(cogs) AS mean_cogs,
        AVG(total_sale) AS mean_total
    FROM Retail_Sales_Analysis
)
-- Fill NULL ages with mean age
UPDATE Retail_Sales_Analysis
SET age = (SELECT CAST(AVG(age) AS INT) FROM Retail_Sales_Analysis WHERE age IS NOT NULL)
WHERE age IS NULL;

-- Fill NULL quantity with mean quantity
UPDATE Retail_Sales_Analysis
SET quantiy = (SELECT CAST(AVG(quantiy) AS INT) FROM Retail_Sales_Analysis WHERE quantiy IS NOT NULL)
WHERE quantiy IS NULL;

-- Fill NULL price_per_unit with mean price
UPDATE Retail_Sales_Analysis
SET price_per_unit = (SELECT AVG(price_per_unit) FROM Retail_Sales_Analysis WHERE price_per_unit IS NOT NULL)
WHERE price_per_unit IS NULL;

-- Fill NULL cogs with mean cogs
UPDATE Retail_Sales_Analysis
SET cogs = (SELECT AVG(cogs) FROM Retail_Sales_Analysis WHERE cogs IS NOT NULL)
WHERE cogs IS NULL;

-- Fill NULL total_sale with mean total
UPDATE Retail_Sales_Analysis
SET total_sale = (SELECT AVG(total_sale) FROM Retail_Sales_Analysis WHERE total_sale IS NOT NULL)
WHERE total_sale IS NULL;

-- Data Exploration 
SELECT * FROM Retail_Sales_Analysis
-- 1. How many sales we have? 
SELECT COUNT(*) AS total_sales FROM Retail_Sales_Analysis -- total_sales = 2000

--2. How many unique customers do we have? 
SELECT COUNT(DISTINCT customer_id) FROM Retail_Sales_Analysis -- Total_customer = 155

-- How many transaction_ids we have? 
SELECT COUNT(transactions_id) AS Total_no_of_transactions FROM Retail_Sales_Analysis  --- Total_no_of_transactions = 2000

-- How much qunatity/items we have sold in total 
SELECT SUM(quantiy) AS Total_quantity_Sold FROM Retail_Sales_Analysis -- Total_items_sold = 5024

-- How many category's we have 
SELECT COUNT(DISTINCT category) AS No_of_categories FROM Retail_Sales_Analysis -- Total_No_of_categories = 3

-- How much total_sale we have till today?
SELECT SUM(total_sale) AS Total_Sales FROM Retail_Sales_Analysis -- Total_Sales = $ 913088

-- TOtal number of Male and Female customers 
-- Female = 153 & Male = 153
SELECT gender, COUNT(DISTINCT customer_id) AS total_customers FROM Retail_Sales_Analysis WHERE gender IS NOT NULL GROUP BY gender 

-- Data Analysis & Business Key Problems & Answers

-- My Analysis & Findings
-- Q.1 Write a SQL query to retrieve all columns for sales made on '2022-11-05
-- Q.2 Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 10 in the month of Nov-2022
-- Q.3 Write a SQL query to calculate the total sales (total_sale) for each category.
-- Q.4 Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.
-- Q.5 Write a SQL query to find all transactions where the total_sale is greater than 1000.
-- Q.6 Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.
-- Q.7 Write a SQL query to calculate the average sale for each month. Find out best selling month in each year
-- Q.8 Write a SQL query to find the top 5 customers based on the highest total sales 
-- Q.9 Write a SQL query to find the number of unique customers who purchased items from each category.
-- Q.10 Write a SQL query to create each shift and number of orders (Example Morning <=12, Afternoon Between 12 & 17, Evening >17)

-- Q.1 Write a SQL query to retrieve all columns for sales made on '2022-11-05
SELECT * FROM Retail_Sales_Analysis WHERE sale_date = '2022-11-05';

-- Q.2 Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 3 in the month of Nov-2022
SELECT * FROM Retail_Sales_Analysis
WHERE category = 'Clothing' 
  AND YEAR(sale_date) = 2022
  AND MONTH(sale_date) = 11
  AND quantiy >= 3; 

-- Q.3 Write a SQL query to calculate the total sales (total_sale) for each category.
SELECT category, SUM(total_sale) AS Net_Sales, COUNT(*) AS Total_orders FROM Retail_Sales_Analysis GROUP BY category;

-- Q.4 Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.
-- SELECT ROUND(AVG(age), 2) as avg_age FROM retail_sales WHERE category = 'Beauty'
SELECT category, AVG(age) As Avg_Age FROM Retail_Sales_Analysis WHERE category = 'Beauty' GROUP BY category

-- Q.5 Write a SQL query to find all transactions where the total_sale is greater than 1000.
SELECT * FROM Retail_Sales_Analysis WHERE total_sale > 1000;

-- Q.6 Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.
SELECT category,gender, COUNT(*) As_total_no_of_transactions FROM Retail_Sales_Analysis GROUP BY category, gender ORDER BY 1

-- Q.7 Write a SQL query to calculate the average sale for each month. Find out best selling month in each year
SELECT * FROM Retail_Sales_Analysis
SELECT YEAR(sale_date) Each_Year, MONTH(sale_date) AS Each_Month, AVG(total_sale) AS Avg_sale_each_month FROM Retail_Sales_Analysis 
GROUP BY MONTH(sale_date),YEAR(sale_date) ORDER BY 1 , 3 DESC 

-- Q.8 Write a SQL query to find the top 5 customers based on the highest total sales 
SELECT TOP 5 customer_id, SUM(total_sale) AS highest_total_sales FROM Retail_Sales_Analysis 
GROUP BY customer_id ORDER BY highest_total_sales DESC

-- Q.9 Write a SQL query to find the number of unique customers who purchased items from each category.
SELECT category, COUNT(DISTINCT customer_id) AS unique_customers, COUNT(quantiy) AS quantity FROM Retail_Sales_Analysis 
GROUP BY category ORDER BY category ASC

-- Q.10 Write a SQL query to create each shift and number of orders (Example Morning <=12, Afternoon Between 12 & 17, Evening >17)
WITH hourly_sale AS 
(
SELECT *, 
  CASE
      WHEN DATEPART(HOUR, sale_time) < 12 THEN  'Morning'
      WHEN DATEPART(HOUR, sale_time)  BETWEEN 12 AND 17 THEN  'Afternoon'
      ELSE 'Evening'
END AS Shift
FROM Retail_Sales_Analysis 
WHERE sale_time IS NOT NULL
)
SELECT shift, COUNT(*) AS total_orders FROM hourly_sale
GROUP BY shift

 