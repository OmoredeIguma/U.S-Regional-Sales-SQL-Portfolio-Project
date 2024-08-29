WITH Average_delivery_days_cte AS (
    SELECT *
    FROM {{ ref('fct_sales') }}
)
 SELECT 
        AVG(DATEDIFF(DAY, Order_Date, Ship_Date)) AS Average_shipping_days
    FROM 
         {{ ref('fct_sales') }}