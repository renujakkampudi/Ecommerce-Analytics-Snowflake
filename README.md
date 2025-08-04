Ecommerce Analytics – Snowflake Project

This project focuses on analyzing e-commerce sales data using **Snowflake** and visualizing key business metrics through dashboards. It includes raw datasets, SQL scripts for schema setup and KPI extraction, and exported dashboard visuals.

---

Project Overview

The goal of this project is to draw meaningful insights from an e-commerce platform's sales data. The analysis includes customer behavior, product performance, and revenue trends.

Used **Snowflake** as the cloud data warehouse to perform scalable analytics and generated dashboards for key business metrics.

---

Components

### 1. **Data**
-  Raw data: `online_retail_II.csv` (original raw dataset)
- `data/` folder contains CSV files:
  - `customers.csv`
  - `orders.csv`
  - `order_items.csv`
  - `products.csv`
  
### 2. **SQL Scripts**
- `schema_setup.sql` – sets up tables in Snowflake.
- `kpi_analysis_queries.sql` – contains queries to extract business KPIs.

### 3. **Python**
- `splitting_retail_data.py` – utility script used to split large CSVs into smaller chunks for upload.

### 4. **Dashboard**
- `Dashboard Analytics/` folder contains exported images of the dashboard visuals:
  - Revenue trends
  - Top products
  - Monthly breakdowns
  - Customer metrics

---

KPIs Tracked

- Total Revenue
- Average Revenue per Customer
- Top 5 Products by Sales
- Monthly Revenue Trend
- Repeat vs New Customers

---

Tools Used

- **Snowflake** – data warehouse
- **SQL** – data transformation and KPI calculation
- **Snowsight** – dashboard and chart creation
- **Python** – data preprocessing
- **GitHub** – version control
