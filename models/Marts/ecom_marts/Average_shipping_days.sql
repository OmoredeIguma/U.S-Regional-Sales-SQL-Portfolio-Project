{{
    config(
        materialized='table'
    )
}}
WITH Average_delivery_days_cte AS (
    SELECT *
    FROM {{ source('ecom', 'Sales_fact') }}
)
 SELECT 
        AVG(DATEDIFF(DAY, Order_Date, Ship_Date)) AS average_shipping_days
    FROM 
         {{ source('ecom', 'Sales_fact') }}