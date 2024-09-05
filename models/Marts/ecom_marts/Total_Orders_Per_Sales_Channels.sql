WITH Total_Orders_Per_Sales_Channels AS (
SELECT 
    sales_fact.Sales_Channel,
COUNT(Sales_Channel) AS Total_Orders_Per_Sales_Channels
FROM 
		{{ ref('fct_sales') }} sales_fact
GROUP BY Sales_Channel
)

SELECT *
FROM Total_Orders_Per_Sales_Channels