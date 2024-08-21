{{config(
    materialized ="table"
)}}

WITH customers AS (
    select * from {{ source('ecom', 'Customers') }}
),
products AS (
    select * from {{ source('ecom', 'Products') }}
),
sales_team AS (
    select * from {{ source('ecom', 'Sales_Team') }}
),
store_location AS (
    select * from {{ source('ecom', 'Store_Location') }}
),
sales_fact AS (
    select * from {{ source('ecom', 'Sales_fact') }}
),

Total_Revenue AS (
    SELECT 
        ROUND(SUM((Unit_Price * Order_Quantity) * (1 - Discount_Applied)), 0) AS Total_Revenue
    FROM {{ source('ecom', 'Sales_fact') }}
),
TOTAL Profit AS (
SELECT 
	ROUND(SUM((Unit_Price-Unit_Cost) * Order_Quantity * (1-Discount_Applied)),0) AS Total_Profit
FROM 
		{{ source('ecom', 'Sales_fact') }}
),
Total_Revenue_per_sales_person AS (
    SELECT 
        st.Team_Names,
        st.Team_ID,
        ROUND(SUM((Unit_Price * Order_Quantity) * (1 - Discount_Applied)), 0) AS Total_Revenue_by_sales_person
    FROM 
    {{ source('ecom', 'Sales_fact') }} sf
    LEFT JOIN 
        {{ source('ecom', 'Sales_Team') }} st ON st.team_id = sf.team_id
    GROUP BY 
        st.Team_Names, st.Team_ID
    ORDER BY 
        Total_Revenue_by_sales_person DESC
),
Revenue_Per_State AS (
    SELECT 
        sl.state,
        ROUND(SUM((Unit_Price * Order_Quantity) * (1 - Discount_Applied)), 0) AS Revenue_Per_State
    FROM 
       {{ source('ecom', 'Sales_fact') }} AS sf
    LEFT JOIN 
      {{ source('ecom', 'Products') }} AS prd ON prd.product_id = sf.product_id
    LEFT JOIN 
        {{ source('ecom', 'Customers') }} AS cust ON cust.customer_id = sf.customer_id
    LEFT JOIN 
        {{ source('ecom', 'Store_Location') }} AS sl ON sl.store_id = sf.store_id
    GROUP BY 
        sl.state
    ORDER BY 
        Revenue_Per_State DESC
),
Profit_per_customer AS (
    SELECT 
        cust.Customer_Names,
        ROUND(SUM((Unit_Price - Unit_Cost) * Order_Quantity * (1 - Discount_Applied)), 0) AS Profit_per_customer
    FROM 
        {{ source('ecom', 'Sales_fact') }} sf
    LEFT JOIN 
      {{ source('ecom', 'Products') }} AS prd ON prd.product_id = sf.product_id
    LEFT JOIN 
        {{ source('ecom', 'Customers') }} AS cust ON cust.customer_id = sf.customer_id
    LEFT JOIN 
        {{ source('ecom', 'Store_Location') }} AS sl ON sl.store_id = sf.store_id
    GROUP BY 
        cust.Customer_Names
    ORDER BY 
        Profit_per_customer DESC
),
Total_Product_Revenue AS (
    SELECT 
        prod.product_name,
        prod.product_id,
        ROUND(SUM((Unit_Price * Order_Quantity) * (1 - Discount_Applied)), 0) AS Total_Product_Revenue
    FROM 
        {{ source('ecom', 'Sales_fact') }} sf
    LEFT JOIN 
        {{ source('ecom', 'Products') }} AS prod ON prod.product_id = sf.product_id
    LEFT JOIN 
       {{ source('ecom', 'Sales_Team') }} st ON st.team_id = sf.team_id
    LEFT JOIN 
         {{ source('ecom', 'Store_Location') }} AS sl ON sl.store_id = sf.store_id
    GROUP BY 
        prod.product_name, prod.product_id
    ORDER BY 
        Total_Product_Revenue DESC
),
Total_Sales_Channel_Revenue AS (
    SELECT sf.Sales_Channel, 
    ROUND(SUM((Unit_Price*order_Quantity) * (1-discount_applied)),0) AS Total_Sales_Channel_Revenue
    FROM 
            {{ source('ecom', 'Sales_fact') }} sf
    LEFT JOIN 
        {{ source('ecom', 'Products') }} AS prod ON prod.product_id = sf.product_id
    LEFT JOIN 
        {{ source('ecom', 'Customers') }} AS cust ON cust.customer_id = sf.customer_id
    LEFT JOIN 
        {{ source('ecom', 'Store_Location') }} AS sl ON sl.store_id = sf.store_id
    GROUP BY Sales_Channel
),
Total_Orders_Per_Sales_Channels AS (
SELECT sf.Sales_Channel,
COUNT(Sales_Channel) AS Total_Orders_Per_Sales_Channels
FROM 
		{{ source('ecom', 'Sales_fact') }} sf
GROUP BY Sales_Channel
),
Average_delivery_days AS (
    SELECT 
        AVG(DATEDIFF(DAY, Order_Date, Delivery_Date)) AS average_delivery_days
    FROM 
         {{ source('ecom', 'Sales_fact') }}
),
Average_shipping_days AS (
    SELECT 
        AVG(DATEDIFF(DAY, Order_Date, Ship_Date)) AS average_shipping_days
    FROM 
         {{ source('ecom', 'Sales_fact') }}


