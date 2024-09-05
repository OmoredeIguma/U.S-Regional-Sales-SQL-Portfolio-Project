WITH Average_delivery_days AS (
 SELECT 
        AVG(DATEDIFF(DAY, Order_Date, Delivery_Date)) AS Average_delivery_days
    FROM 
         {{ ref('fct_sales') }}
)
SELECT *
FROM Average_delivery_days