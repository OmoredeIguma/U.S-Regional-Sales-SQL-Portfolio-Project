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
        AVG(DATEDIFF(DAY, Order_Date, Delivery_Date)) AS Average_delivery_days
    FROM 
         {{ source('ecom', 'Sales_fact') }}