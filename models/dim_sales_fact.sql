WITH sales_fact_data AS (
    SELECT sales_channel,
            procured_date,
            order_date,
            ship_date,
            delivery_date,
            team_id,
            customer_id,
            store_id,
            product_id,
            order_quantity,
            discount_applied,
            unit_price,
            Unit_Cost
    FROM {{ ref('stg_sales_fact') }}
)
SELECT * FROM sales_fact_data