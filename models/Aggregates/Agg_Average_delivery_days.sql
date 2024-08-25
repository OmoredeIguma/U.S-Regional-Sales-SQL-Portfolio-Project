{{
    config(
        materialized='table'
    )
}}
 SELECT 
        AVG(DATEDIFF(DAY, Order_Date, Delivery_Date)) AS Average_delivery_days
    FROM 
         {{ ref('stg_sales_fact') }}