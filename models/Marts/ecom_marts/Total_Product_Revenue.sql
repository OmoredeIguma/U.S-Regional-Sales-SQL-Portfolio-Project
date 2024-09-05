WITH Total_Product_Revenue AS (
 SELECT 
        products.product_name,
        products.product_id,
        ROUND(SUM((Unit_Price * Order_Quantity) * (1 - Discount_Applied)), 0) AS Total_Product_Revenue
    FROM 
         {{ ref('fct_sales') }} sales_fact
    LEFT JOIN 
         {{ ref('dim_products') }}  AS products ON products.product_id = sales_fact.product_id
    LEFT JOIN 
       {{ ref('dim_sales_team') }} AS sales_team ON sales_team.team_id = sales_fact.team_id
    LEFT JOIN 
         {{ ref('dim_store_location') }} AS store_location ON store_location.store_id = sales_fact.store_id
    GROUP BY 
        products.product_name, products.product_id
    ORDER BY 
        Total_Product_Revenue DESC
)
SELECT *
FROM Total_Product_Revenue