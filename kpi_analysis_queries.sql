select current_database(), current_schema(), current_warehouse();

create or replace table customers(
    customer_ID number, 
    country varchar
);

create or replace table orders(
    Invoice varchar,
    InvoiceDate timestamp,
    Customer_ID number,
    Country varchar
);

create or replace table order_items(
    Invoice varchar,
    StockCode varchar,
    Description string,
    Quantity number,
    Price float
);

create or replace table products(
    StockCode varchar,
    Description string,
    Price float
);

show tables;

select * from customers limit 5;
select * from orders limit 5;
select * from order_items limit 5;
select * from products limit 5;

-- Total revenue = Quantity * price 
select round(sum(quantity*price),2) as total_revenue from order_items;

-- Monthly revenue trend
SELECT 
    TO_CHAR(TO_TIMESTAMP(O.InvoiceDate), 'YYYY-MM') AS Revenue_Month,
    ROUND(SUM(I.Quantity * I.Price), 2) AS Monthly_Revenue
FROM ORDERS O
JOIN ORDER_ITEMS I ON O.Invoice = I.Invoice
GROUP BY Revenue_Month
ORDER BY Revenue_Month;

-- Top 10 customers by revenue
SELECT 
    O.Customer_ID,
    ROUND(SUM(I.Quantity * I.Price), 2) AS Total_Spent
FROM ORDERS O
JOIN ORDER_ITEMS I ON O.Invoice = I.Invoice
GROUP BY O.Customer_ID
ORDER BY Total_Spent DESC
LIMIT 10;

-- Product based analysis
-- Top selling products by revenue
SELECT 
    P.Description,
    ROUND(SUM(I.Quantity * I.Price), 2) AS Product_Revenue
FROM ORDER_ITEMS I
JOIN PRODUCTS P ON I.StockCode = P.StockCode
GROUP BY P.Description
ORDER BY Product_Revenue DESC
LIMIT 10;

-- Most frequently sold products 
SELECT 
    P.Description,
    SUM(I.Quantity) AS Total_Quantity_Sold
FROM ORDER_ITEMS I
JOIN PRODUCTS P ON I.StockCode = P.StockCode
GROUP BY P.Description
ORDER BY Total_Quantity_Sold DESC
LIMIT 10;

-- Country based analysis
-- Revenue by country
SELECT 
    O.Country,
    ROUND(SUM(I.Quantity * I.Price), 2) AS Revenue
FROM ORDERS O
JOIN ORDER_ITEMS I ON O.Invoice = I.Invoice
GROUP BY O.Country
ORDER BY Revenue DESC;

-- Average order size by country
SELECT 
    O.Country,
    ROUND(AVG(I.Quantity * I.Price), 2) AS Avg_Order_Value
FROM ORDERS O
JOIN ORDER_ITEMS I ON O.Invoice = I.Invoice
GROUP BY O.Country
ORDER BY Avg_Order_Value DESC;

-- Customer behaviour analysis
-- Repeat vs one-time customers
WITH customer_order_counts AS (
    SELECT Customer_ID, COUNT(DISTINCT Invoice) AS num_orders
    FROM ORDERS
    GROUP BY Customer_ID
)

SELECT 
    CASE 
        WHEN num_orders = 1 THEN 'One-Time'
        ELSE 'Repeat'
    END AS Customer_Type,
    COUNT(*) AS Num_Customers
FROM customer_order_counts
GROUP BY Customer_Type;


-- Average orders per customer
SELECT 
    ROUND(AVG(order_count), 2) AS Avg_Orders_Per_Customer
FROM (
    SELECT Customer_ID, COUNT(DISTINCT Invoice) AS order_count
    FROM ORDERS
    GROUP BY Customer_ID
) AS customer_orders;


