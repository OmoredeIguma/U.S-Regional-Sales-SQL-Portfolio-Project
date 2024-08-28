{{
    config(
        materialized='table'
    )
}}
SELECT
        cust.Customer_Names,
        ROUND(SUM((Unit_Price - Unit_Cost) * Order_Quantity * (1 - Discount_Applied)), 0) AS Profit_per_customer
    FROM 
        {{ ref('fct_sales') }} sf
    LEFT JOIN 
      {{ ref('dim_products') }} AS prd ON prd.product_id = sf.product_id
    LEFT JOIN 
        {{ ref('dim_customers') }} AS cust ON cust.customer_id = sf.customer_id
    LEFT JOIN 
        {{ ref('dim_store_location') }} AS sl ON sl.store_id = sf.store_id
    GROUP BY 
        cust.Customer_Names
    ORDER BY 
        Profit_per_customer DESC