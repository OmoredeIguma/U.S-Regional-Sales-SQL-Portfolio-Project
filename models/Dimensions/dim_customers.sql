WITH customers_dim AS (
    SELECT
        Customer_ID,
        Customer_Names
    FROM {{ ref('stg_customers') }}
)
SELECT * FROM customers_dim