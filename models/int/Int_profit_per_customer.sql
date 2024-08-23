WITH Profit_per_Customer AS (
    SELECT *
    FROM {{ ref('stg_sales_fact') }} sf
    LEFT JOIN 
      {{ ref('stg_Products') }} AS prod ON prod.product_id = sf.product_id
    LEFT JOIN 
        {{ ref('stg_customers') }} AS cust ON cust.customer_id = sf.customer_id
    LEFT JOIN 
        {{ ref('stg_Store_location') }} AS sl ON sl.store_id = sf.store_id
)
SELECT * FROM Profit_per_Customer