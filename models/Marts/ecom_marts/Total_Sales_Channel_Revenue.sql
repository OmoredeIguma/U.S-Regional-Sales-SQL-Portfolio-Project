SELECT 
    sales_orders.Sales_Channel, 
    ROUND(SUM((Unit_Price*order_Quantity) * (1-discount_applied)),0) AS Total_Sales_Channel_Revenue
    FROM 
             {{ ref('fct_sales') }} sales_orders
    LEFT JOIN 
         {{ ref('dim_products') }} AS products ON products.product_id = sales_orders.product_id
    LEFT JOIN 
        {{ ref('dim_customers') }} AS customers ON customers.customer_id = sales_orders.customer_id
    LEFT JOIN 
        {{ ref('dim_store_locations') }} AS store_locations ON store_locations.store_id = sales_orders.store_id
    GROUP BY Sales_Channel