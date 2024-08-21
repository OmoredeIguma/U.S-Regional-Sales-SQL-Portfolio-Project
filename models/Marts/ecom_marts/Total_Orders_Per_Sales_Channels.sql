WITH Total_Orders_Per_Sales_Channels_cte AS (
    SELECT *
    FROM {{ source('ecom', 'Sales_fact') }}
)
SELECT sf.Sales_Channel,
COUNT(Sales_Channel) AS Total_Orders_Per_Sales_Channels
FROM 
		{{ source('ecom', 'Sales_fact') }} sf
GROUP BY Sales_Channel