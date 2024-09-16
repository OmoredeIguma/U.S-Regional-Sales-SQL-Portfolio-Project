WITH customers_dim AS (
    SELECT
        Customer_ID,
        Customer_Names
    FROM {{ ref('stg_eCom__customers') }}
)
SELECT * FROM customers_dim