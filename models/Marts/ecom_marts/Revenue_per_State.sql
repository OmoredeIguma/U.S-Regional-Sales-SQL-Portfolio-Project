WITH Revenue_Per_State AS (
 SELECT 
        store_location.state,
        ROUND(SUM((Unit_Price * Order_Quantity) * (1 - Discount_Applied)), 0) AS Revenue_Per_State
    FROM 
      {{ ref('fct_sales') }} AS sales_fact
    LEFT JOIN 
      {{ ref('dim_products') }} AS products ON products.product_id = sales_fact.product_id
    LEFT JOIN 
        {{ ref('dim_customers') }} AS customers ON customers.customer_id = sales_fact.customer_id
    LEFT JOIN 
        {{ ref('dim_store_location') }} AS store_location ON store_location.store_id = sales_fact.store_id
    GROUP BY 
        store_location.state
    ORDER BY 
        Revenue_Per_State DESC
)
SELECT *
FROM Revenue_Per_State