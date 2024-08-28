{{
    config(
        materialized='table'
    )
}}
WITH customer_data AS (
    SELECT customer_id,
            customer_names
    FROM {{ ref('stg_customers') }}
)
SELECT * FROM customer_data