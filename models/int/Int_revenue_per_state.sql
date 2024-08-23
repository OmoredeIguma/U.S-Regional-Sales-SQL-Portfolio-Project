WITH Revenue_Per_State AS (
    SELECT *
    FROM {{ ref('stg_sales_fact') }} sf
    LEFT JOIN 
      {{ ref('stg_Products') }} AS prd ON prd.product_id = sf.product_id
    LEFT JOIN 
        {{ ref('stg_customers') }} AS cust ON cust.customer_id = sf.customer_id
    LEFT JOIN 
        {{ ref('stg_Store_location') }} AS sl ON sl.store_id = sf.store_id
)
SELECT * FROM Revenue_Per_State