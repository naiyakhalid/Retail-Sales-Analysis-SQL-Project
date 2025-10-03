# 🛒 SQL Retail Sales Analysis

This project is a **SQL-based retail sales analysis** case study.  
The main goal is to explore, clean, and analyze a retail sales dataset using SQL queries.  
It covers **data creation, cleaning, exploration, and answering key business questions**.

## 🧑‍💻 Author
**Naiya Khalid**  
📩 [naiyakhalid@gmail.com](mailto:naiyakhalid@gmail.com)  
🌐 [LinkedIn](https://www.linkedin.com/in/naiya-khalid-510981130/)  
🌐 [GitHub](https://github.com/naiyakhalid)  
🌐 [Kaggle](https://www.kaggle.com/naiyakhalid)

## 📂 Project Overview
- **Database:** `sql_project_p2`
- **Table:** `retail_sales`
- **Records:** 2,000 transactions  
- **Customers:** 155 unique customers  
- **Categories:** 3 (Clothing, Electronics, Beauty)  
- **Total Sales:** \$913,088  
- **Total Items Sold:** 5,024  

## 🛠️ Features Implemented

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

### 3. Data Exploration
- Total transactions, customers, categories, and sales.
- Gender distribution.
- Quantity of items sold.
- Summary statistics of sales.

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

## 📌 Key Insights
- Total Sales: $913,088 across 2,000 transactions.
- Customers: 155 unique customers, equally split between Male & Female.
- Categories: 3 main categories with Clothing showing higher transaction counts.
- Top Customers: A few high-value customers contributed significantly to sales.
- Shifts: Sales activity can be segmented into Morning, Afternoon, and Evening.

## 🚀 How to Use
1. Clone this repository:
   ```bash
   git clone https://github.com/naiyakhalid/sql-retail-sales-analysis.git
```
2. Import the SQL scripts into your database (SQL Server recommended).
3. Run the queries in order to create, clean, and analyze the dataset.
4. Explore insights using the provided analysis queries.

