SELECT current_database(), current_schema(), current_warehouse();

-- Create customers table
CREATE OR REPLACE TABLE customers (
    Customer_ID NUMBER,
    Country VARCHAR
);

-- Create orders table
CREATE OR REPLACE TABLE orders (
    Invoice VARCHAR,
    InvoiceDate TIMESTAMP,
    Customer_ID NUMBER,
    Country VARCHAR
);

-- Create order_items table
CREATE OR REPLACE TABLE order_items (
    Invoice VARCHAR,
    StockCode VARCHAR,
    Description STRING,
    Quantity NUMBER,
    Price FLOAT
);

-- Create products table
CREATE OR REPLACE TABLE products (
    StockCode VARCHAR,
    Description STRING,
    Price FLOAT
);


SHOW TABLES;
