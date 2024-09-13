WITH products_dim AS (
    SELECT
        Product_ID,
        Product_Name
    FROM {{ ref('stg_Products') }}
)
SELECT * FROM products_dim