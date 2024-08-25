{{
    config(
        materialized='table'
    )
}}
SELECT 
        sf.sales_channel,
        sf.procured_date,
        sf.order_date,
        sf.ship_date,
        sf.delivery_date,
        sf.team_id,
        sf.customer_id,
        sf.store_id,
        sf.product_id,
        sf.order_quantity,
        sf.discount_applied,
        sf.unit_price,
        sf.unit_cost,
        cust.customer_names,
        prod.product_name,
        sl.state,
        st.team_names
FROM {{ ref('stg_sales_fact') }} sf
JOIN {{ ref('dim_customers') }} cust ON sf.customer_id = cust.customer_id
JOIN {{ ref('dim_products') }} prod ON sf.product_id = prod.product_id
JOIN {{ ref('dim_sales_team') }} st ON sf.team_id = st.team_id
JOIN {{ ref('dim_store_location') }} sl ON sf.store_id = sl.store_id