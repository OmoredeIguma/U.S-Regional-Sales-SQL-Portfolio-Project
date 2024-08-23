{{
    config(
        materialized='table'
    )
}}
WITH Revenue_Per_State AS (
    SELECT *
    FROM {{ source('ecom', 'Sales_fact') }}
)
 SELECT 
        sl.state,
        ROUND(SUM((Unit_Price * Order_Quantity) * (1 - Discount_Applied)), 0) AS Revenue_Per_State
    FROM 
       {{ source('ecom', 'Sales_fact') }} AS sf
    LEFT JOIN 
      {{ source('ecom', 'Products') }} AS prd ON prd.product_id = sf.product_id
    LEFT JOIN 
        {{ source('ecom', 'Customers') }} AS cust ON cust.customer_id = sf.customer_id
    LEFT JOIN 
        {{ source('ecom', 'Store_Location') }} AS sl ON sl.store_id = sf.store_id
    GROUP BY 
        sl.state
    ORDER BY 
        Revenue_Per_State DESC