WITH products_dim AS (
    SELECT
        Product_ID,
        Product_Name
    FROM {{ ref('stg_eCom__Products') }}
)
SELECT * FROM products_dim