SELECT 
        products.product_name,
        products.product_id,
        ROUND(SUM((Unit_Price * Order_Quantity) * (1 - Discount_Applied)), 0) AS Total_Product_Revenue
    FROM 
         {{ ref('fct_sales') }} sales_orders
    LEFT JOIN 
         {{ ref('dim_products') }}  AS products ON products.product_id = sales_orders.product_id
    LEFT JOIN 
       {{ ref('dim_sales_team') }} sales_team ON sales_team.team_id = sales_orders.team_id
    LEFT JOIN 
         {{ ref('dim_store_locations') }} AS store_locations ON store_locations.store_id = sales_orders.store_id
    GROUP BY 
        products.product_name, products.product_id
    ORDER BY 
        Total_Product_Revenue DESC