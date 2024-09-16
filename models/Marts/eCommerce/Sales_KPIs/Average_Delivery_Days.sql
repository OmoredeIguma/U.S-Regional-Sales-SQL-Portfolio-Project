SELECT
    AVG(DATEDIFF(DAY,Order_Date, Delivery_Date)) AS Average_Delivery_Day
FROM {{ ref('fct_sales') }}