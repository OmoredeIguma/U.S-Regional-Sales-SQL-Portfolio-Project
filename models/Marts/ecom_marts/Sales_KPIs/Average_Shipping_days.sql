SELECT 
        AVG(DATEDIFF(DAY, Order_Date, Ship_Date)) AS Average_shipping_days
    FROM 
         {{ ref('fct_sales') }}
         