WITH Total_Revenue AS (
SELECT 
    ROUND(SUM((Unit_Price * Order_Quantity) * (1 - Discount_Applied)), 0) AS Total_Revenue
FROM 
    {{ ref('fct_sales') }}
)
SELECT *
FROM Total_Revenue
