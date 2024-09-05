WITH Total_Profit AS (
SELECT 
	ROUND(SUM((Unit_Price-Unit_Cost) * Order_Quantity * (1-Discount_Applied)),0) AS Total_Profit
FROM 
		{{ ref('fct_sales') }}
)
SELECT *
FROM Total_Profit