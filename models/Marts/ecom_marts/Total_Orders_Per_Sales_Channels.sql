SELECT sales_orders.Sales_Channel,
COUNT(Sales_Channel) AS Total_Orders_Per_Sales_Channels
FROM 
		{{ ref('fct_sales') }} sales_orders
GROUP BY Sales_Channel