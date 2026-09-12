# 🛒 SQL Retail Sales Analysis

## Project Objective
This project is a SQL-based retail sales analysis case study. The main goal is to explore, clean, and analyze a retail sales dataset using SQL queries.  It covers data creation, cleaning, exploration, and answering key business questions.

## 🧑‍💻 Author
**Naiya Khalid**  
📩 [naiyakhalid@gmail.com](mailto:naiyakhalid@gmail.com)  
🌐 [LinkedIn](https://www.linkedin.com/in/naiya-khalid-510981130/)  
🌐 [GitHub](https://github.com/naiyakhalid)  
🌐 [Kaggle](https://www.kaggle.com/naiyakhalid)

## 📂 Project Overview
## SQL • Data Cleaning • Exploratory Analysis • Business Analytics
An end-to-end SQL analysis of 2,000 retail transactions, covering data cleaning, exploratory analysis and business-focused questions around sales, customers, categories and purchasing patterns.

| Project Scope         |       Project Details              |
| --------------        | ---------------------------------- |
| **Database:**         | 'SQL_Project_1'.                   |
| **Table:**            | `Retail_Sales_Analysis`            |
| **Records:**          | 2,000 retail transactions          |
| **Customers**         | 155 unique customers               |
| **Categories:**       | 3 (Clothing, Electronics, Beauty)  |
| **Total Sales:**      | \$913,088                          |
| **Total Items Sold:** | 5,024                              |
| **Database**          | SQL Server                         |
| **Tools**             | SQL, Azure Data Studio             | 

## 🛠️ Features Implemented: 

### 1. Database & Table Creation
- Created a retail sales table with fields such as `transaction_id`, `sale_date`, `sale_time`, `customer_id`, `gender`, `age`, `category`, `quantity`, `price_per_unit`, `cogs`, and `total_sale`.

### 2. Data Cleaning
- Checked for missing values (`NULL`).
- Imputed missing data using **mean substitution** for:
  - `age`
  - `quantity`
  - `price_per_unit`
  - `cogs`
  - `total_sale`
  - Validated the resulting dataset

### 3. Exploratory analysis
- Total transactions, customers, categories, and sales.
- Gender distribution.
- Quantity of items sold.
- Summary statistics of sales.
- Customer counts
- Category performance

### 4. Business Problem Queries
- Retrieve sales on a specific date.
- Transactions filtered by category & quantity.
- Category-level total sales.
- Customer demographics by category.
- High-value transactions.
- Gender-based transactions by category.
- Monthly average sales and best-selling months.
- Top 5 customers by total sales.
- Unique customers per category.
- Sales shift analysis (Morning, Afternoon, Evening).

## 📊 Example Queries
### 1. Total Sales per Category
```sql
SELECT category, SUM(total_sale) AS Net_Sales, COUNT(*) AS Total_orders
FROM Retail_Sales_Analysis
GROUP BY category;
```
### 2. Top customers
```sql
SELECT TOP 5 customer_id, SUM(total_sale) AS total_sales
FROM Retail_Sales_Analysis
GROUP BY customer_id ORDER BY total_sales DESC;
```

### 3. Sales shifts
```sql
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
```

## 📌 Key Insights
- **Total Sales:** $913,088 across 2,000 transactions.
- **Customers:** 155 unique customers, equally split between Male & Female.
- **Categories:** 3 main categories with Clothing showing higher transaction counts.
- **Top Customers:** A few high-value customers contributed significantly to sales.
- **Shifts:** Sales activity can be segmented into Morning, Afternoon, and Evening.

## 🚀 How to Use/Reproduce
1. Download/Clone this repository:
   ```bash
   git clone https://github.com/naiyakhalid/sql-retail-sales-analysis.git
```
2. Open SQL Server/Azure Data Studio.
3. Create the database.
4. Import Retail_Sales_Data.csv into the table.
5. Run the queries in order to create, clean, and analyze the dataset.
4. Explore insights using the provided analysis queries.

