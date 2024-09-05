WITH Total_Sales_Channel_Revenue AS (
SELECT sf.Sales_Channel, 
    ROUND(SUM((Unit_Price*order_Quantity) * (1-discount_applied)),0) AS Total_Sales_Channel_Revenue
    FROM 
             {{ ref('fct_sales') }} sf
    LEFT JOIN 
         {{ ref('dim_products') }} AS prod ON prod.product_id = sf.product_id
    LEFT JOIN 
        {{ ref('dim_customers') }} AS cust ON cust.customer_id = sf.customer_id
    LEFT JOIN 
        {{ ref('dim_store_location') }} AS sl ON sl.store_id = sf.store_id
    GROUP BY Sales_Channel
)
SELECT *
FROM Total_Sales_Channel_Revenue