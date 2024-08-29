WITH Product_data AS (
    SELECT product_id,
            product_name
    FROM {{ ref('stg_Products') }}
)
SELECT * FROM Product_data