WITH Total_product_revenue AS (
    SELECT 
        prod.product_name,
        prod.product_id,
    FROM 
        {{ ref('stg_sales_fact') }} AS sf
    LEFT JOIN 
        {{ ref('stg_Products') }} AS prod ON prod.product_id = sf.product_id
    LEFT JOIN 
       {{ ref('stg_Sales_Team') }} AS st ON st.team_id = sf.team_id
    LEFT JOIN 
         {{ ref('stg_Store_location') }} AS sl ON sf.store_id = sl.store_id
)     
SELECT * FROM Total_product_revenue