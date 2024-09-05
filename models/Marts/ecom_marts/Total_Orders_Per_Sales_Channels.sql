WITH Total_Orders_Per_Sales_Channels AS (
SELECT 
    sf.Sales_Channel,
COUNT(Sales_Channel) AS Total_Orders_Per_Sales_Channels
FROM 
		{{ ref('fct_sales') }} sf
GROUP BY Sales_Channel
)

SELECT *
FROM Total_Orders_Per_Sales_Channels