import pandas as pd
import os

# Load Excel file
file_path = r"/Users/renujakkampudi/Desktop/Snowflake/online_retail_II.csv" 
df = pd.read_csv(file_path)

# Remove rows with missing CustomerID
df = df.dropna(subset=["Customer ID"])

# Standardize column names
df.columns = df.columns.str.strip().str.replace(" ", "_")

# Create output folder
os.makedirs(r"/Users/renujakkampudi/Desktop/Snowflake/data", exist_ok=True)

# 1. Customers Table
customers_df = df[["Customer_ID", "Country"]].drop_duplicates()
customers_df.to_csv("data/customers.csv", index=False)

# 2. Orders Table
orders_df = df[["Invoice", "InvoiceDate", "Customer_ID", "Country"]].drop_duplicates()
orders_df.to_csv("data/orders.csv", index=False)

# 3. Order Items Table (Fact Table)
order_items_df = df[["Invoice", "StockCode", "Description", "Quantity", "Price"]]
order_items_df.to_csv("data/order_items.csv", index=False)

# 4. Products Table
products_df = df[["StockCode", "Description", "Price"]].drop_duplicates()
products_df.to_csv("data/products.csv", index=False)
