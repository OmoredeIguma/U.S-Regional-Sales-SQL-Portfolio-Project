SELECT 
        sales_orders.sales_channel,
        sales_orders.procured_date,
        sales_orders.order_date,
        sales_orders.ship_date,
        sales_orders.delivery_date,
        sales_orders.team_id,
        sales_orders.customer_id,
        sales_orders.store_id,
        sales_orders.product_id,
        sales_orders.order_quantity,
        sales_orders.discount_applied,
        sales_orders.unit_price,
        sales_orders.unit_cost,
        customers.customer_names,
        products.product_name,
        store_locations.state,
        sales_team.team_name
FROM {{ ref('stg_eCom__sales_orders') }} sales_orders
JOIN {{ ref('dim_customers') }} customers ON sales_orders.customer_id = customers.customer_id
JOIN {{ ref('dim_products') }} products ON sales_orders.product_id = products.product_id
JOIN {{ ref('dim_sales_team') }} sales_team ON sales_orders.team_id = sales_team.team_id
JOIN {{ ref('dim_store_locations') }} store_locations ON sales_orders.store_id = store_locations.store_id