{{
    config(
        materialized='table'
    )
}}
SELECT 
        AVG(DATEDIFF(DAY, Order_Date, Ship_Date)) AS Average_shipping_days
    FROM 
         {{ ref('stg_sales_fact') }}