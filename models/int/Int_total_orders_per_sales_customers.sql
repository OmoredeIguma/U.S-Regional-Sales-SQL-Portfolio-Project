WITH Total_Orders_Per_Sales_Channels AS (
    SELECT *
    FROM {{ ref('stg_sales_fact') }}
)
SELECT * FROM Total_Orders_Per_Sales_Channels