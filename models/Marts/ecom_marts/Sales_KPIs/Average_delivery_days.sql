WITH Average_delivery_days_cte AS (
    SELECT *
    FROM {{ ref('fct_sales') }}
)
 SELECT 
        AVG(DATEDIFF(DAY, Order_Date, Delivery_Date)) AS Average_delivery_days
    FROM 
         {{ ref('fct_sales') }}