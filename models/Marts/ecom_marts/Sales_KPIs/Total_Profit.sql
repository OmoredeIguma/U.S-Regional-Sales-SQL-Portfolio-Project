WITH Total_Profit_cte AS (
    SELECT *
    FROM {{ ref('fct_sales') }}
)
SELECT 
	ROUND(SUM((Unit_Price-Unit_Cost) * Order_Quantity * (1-Discount_Applied)),0) AS Total_Profit
FROM 
		{{ ref('fct_sales') }}