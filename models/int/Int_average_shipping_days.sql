WITH Average_shipping_days AS (
    SELECT *
    FROM {{ ref('stg_sales_fact') }}
)
SELECT * FROM Average_delivery_days