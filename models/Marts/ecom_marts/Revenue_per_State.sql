SELECT 
        store_locations.state,
        ROUND(SUM((Unit_Price * Order_Quantity) * (1 - Discount_Applied)), 0) AS Revenue_Per_State
    FROM 
      {{ ref('fct_sales') }} AS sales_orders
    LEFT JOIN 
      {{ ref('dim_products') }} AS products ON products.product_id = sales_orders.product_id
    LEFT JOIN 
        {{ ref('dim_customers') }} AS customers ON customers.customer_id = sales_orders.customer_id
    LEFT JOIN 
        {{ ref('dim_store_locations') }} AS store_locations ON store_locations.store_id = sales_orders.store_id
    GROUP BY 
        store_locations.state
    ORDER BY 
        Revenue_Per_State DESC