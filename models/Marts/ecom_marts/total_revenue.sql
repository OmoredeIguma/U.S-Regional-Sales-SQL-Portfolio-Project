WITH Total_Revenue_cte AS (
    SELECT * 
    FROM {{ source('ecom', 'Sales_fact') }}
)

SELECT 
    ROUND(SUM((Unit_Price * Order_Quantity) * (1 - Discount_Applied)), 0) AS Total_Revenue
FROM 
    {{ source('ecom', 'Sales_fact') }}
