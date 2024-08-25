SELECT sf.Sales_Channel,
COUNT(Sales_Channel) AS Total_Orders_Per_Sales_Channels
FROM 
		{{ ref('stg_sales_fact') }} sf
GROUP BY Sales_Channel