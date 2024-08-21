WITH Profit_per_Customer_cte AS (
    SELECT *
    FROM {{ source('ecom', 'Sales_fact') }}
)
 SELECT 
        cust.Customer_Names,
        ROUND(SUM((Unit_Price - Unit_Cost) * Order_Quantity * (1 - Discount_Applied)), 0) AS Profit_per_customer
    FROM 
        {{ source('ecom', 'Sales_fact') }} sf
    LEFT JOIN 
      {{ source('ecom', 'Products') }} AS prd ON prd.product_id = sf.product_id
    LEFT JOIN 
        {{ source('ecom', 'Customers') }} AS cust ON cust.customer_id = sf.customer_id
    LEFT JOIN 
        {{ source('ecom', 'Store_Location') }} AS sl ON sl.store_id = sf.store_id
    GROUP BY 
        cust.Customer_Names
    ORDER BY 
        Profit_per_customer DESC