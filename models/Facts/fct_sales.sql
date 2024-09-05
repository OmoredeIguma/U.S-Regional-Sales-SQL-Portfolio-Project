SELECT 
        sales_fact.Sales_channel,
        sales_fact.procured_date,
        sales_fact.order_date,
        sales_fact.ship_date,
        sales_fact.delivery_date,
        sales_fact.team_id,
        sales_fact.customer_id,
        sales_fact.store_id,
        sales_fact.product_id,
        sales_fact.order_quantity,
        sales_fact.discount_applied,
        sales_fact.unit_price,
        sales_fact.unit_cost,
        customers.customer_names,
        products.product_name,
        store_location.state,
        sales_team.team_names
FROM {{ ref('stg_sales_fact') }} sales_fact
JOIN {{ ref('dim_customers') }} AS customers ON sales_fact.customer_id = customers.customer_id
JOIN {{ ref('dim_products') }} AS products ON sales_fact.product_id = products.product_id
JOIN {{ ref('dim_sales_team') }} AS sales_team ON sales_fact.team_id = sales_team.team_id
JOIN {{ ref('dim_store_location') }} AS store_location ON sales_fact.store_id = store_location.store_id