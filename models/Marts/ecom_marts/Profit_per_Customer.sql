SELECT 
        customers.Customer_Names,
        ROUND(SUM((Unit_Price - Unit_Cost) * Order_Quantity * (1 - Discount_Applied)), 0) AS Profit_per_customer
    FROM 
        {{ ref('fct_sales') }} sales_orders
    LEFT JOIN 
       {{ ref('dim_products') }} AS products ON products.product_id = sales_orders.product_id
    LEFT JOIN 
        {{ ref('dim_customers') }} AS customers ON customers.customer_id = sales_orders.customer_id
    LEFT JOIN 
        {{ ref('dim_store_locations') }} AS store_locations ON store_locations.store_id = sales_orders.store_id
    GROUP BY 
        customers.Customer_Names
    ORDER BY 
        Profit_per_customer DESC