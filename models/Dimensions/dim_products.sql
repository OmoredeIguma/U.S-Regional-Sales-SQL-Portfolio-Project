WITH dim_products AS (
    SELECT product_id,
            product_name
    FROM {{ ref('stg_Products') }}
)
SELECT * FROM dim_products