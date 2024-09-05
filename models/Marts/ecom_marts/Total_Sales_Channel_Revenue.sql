WITH Total_Sales_Channel_Revenue AS (
SELECT 
    sales_fact.Sales_Channel, 
    ROUND(SUM((Unit_Price*order_Quantity) * (1-discount_applied)),0) AS Total_Sales_Channel_Revenue
FROM 
    {{ ref('fct_sales') }} sales_fact
    LEFT JOIN 
         {{ ref('dim_products') }} AS products ON products.product_id = sales_fact.product_id
    LEFT JOIN 
        {{ ref('dim_customers') }} AS customers ON customers.customer_id = sales_fact.customer_id
    LEFT JOIN 
        {{ ref('dim_store_location') }} AS store_location ON store_location.store_id = sales_fact.store_id
    GROUP BY Sales_Channel
)
SELECT *
FROM Total_Sales_Channel_Revenue