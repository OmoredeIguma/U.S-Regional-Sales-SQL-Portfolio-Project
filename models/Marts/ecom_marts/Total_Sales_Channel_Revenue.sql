{{
    config(
        materialized='table'
    )
}}
WITH Total_Sales_Channel_Revenue_cte AS (
    SELECT *
    FROM {{ source('ecom', 'Sales_fact') }}
)
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