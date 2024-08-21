WITH Total_Profit_cte AS (
    SELECT *
    FROM {{ source('ecom', 'Sales_fact') }}
)
SELECT 
	ROUND(SUM((Unit_Price-Unit_Cost) * Order_Quantity * (1-Discount_Applied)),0) AS Total_Profit
FROM 
		{{ source('ecom', 'Sales_fact') }}