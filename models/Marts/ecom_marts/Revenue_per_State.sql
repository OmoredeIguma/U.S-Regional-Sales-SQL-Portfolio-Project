WITH Revenue_Per_State AS (
 SELECT 
        sl.state,
        ROUND(SUM((Unit_Price * Order_Quantity) * (1 - Discount_Applied)), 0) AS Revenue_Per_State
    FROM 
      {{ ref('fct_sales') }} AS sf
    LEFT JOIN 
      {{ ref('dim_products') }} AS prd ON prd.product_id = sf.product_id
    LEFT JOIN 
        {{ ref('dim_customers') }} AS cust ON cust.customer_id = sf.customer_id
    LEFT JOIN 
        {{ ref('dim_store_location') }} AS sl ON sl.store_id = sf.store_id
    GROUP BY 
        sl.state
    ORDER BY 
        Revenue_Per_State DESC
)
SELECT *
FROM Revenue_Per_State