WITH Profit_per_Customer AS (
 SELECT 
        customers.Customer_Names,
        ROUND(SUM((Unit_Price - Unit_Cost) * Order_Quantity * (1 - Discount_Applied)), 0) AS Profit_per_customer
    FROM 
        {{ ref('fct_sales') }} sales_fact
    LEFT JOIN 
       {{ ref('dim_products') }} AS products ON products.product_id = sales_fact.product_id
    LEFT JOIN 
        {{ ref('dim_customers') }} AS customers ON customers.customer_id = sales_fact.customer_id
    LEFT JOIN 
        {{ ref('dim_store_location') }} AS store_location ON store_location.store_id = sales_fact.store_id
    GROUP BY 
        customers.Customer_Names
    ORDER BY 
        Profit_per_customer DESC
)
SELECT *
FROM Profit_per_Customer