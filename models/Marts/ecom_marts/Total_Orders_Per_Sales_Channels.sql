{{
    config(
        materialized='table'
    )
}}
WITH Total_Orders_Per_Sales_Channels_cte AS (
    SELECT *
    FROM  {{ ref('fct_sales') }} sf
)
SELECT sf.Sales_Channel,
COUNT(Sales_Channel) AS Total_Orders_Per_Sales_Channels
FROM 
		{{ ref('fct_sales') }} sf
GROUP BY Sales_Channel