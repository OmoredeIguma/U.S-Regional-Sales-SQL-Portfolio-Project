WITH dim_customer AS (
    SELECT customer_id,
            customer_names
    FROM {{ ref('stg_customers') }}
)
SELECT * FROM dim_customer