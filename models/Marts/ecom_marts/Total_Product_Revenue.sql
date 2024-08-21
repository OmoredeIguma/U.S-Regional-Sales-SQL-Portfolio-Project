WITH Total_Product_Revenue_cte AS (
    SELECT *
    FROM {{ source('ecom', 'Sales_fact') }}
)
 SELECT 
        prod.product_name,
        prod.product_id,
        ROUND(SUM((Unit_Price * Order_Quantity) * (1 - Discount_Applied)), 0) AS Total_Product_Revenue
    FROM 
        {{ source('ecom', 'Sales_fact') }} sf
    LEFT JOIN 
        {{ source('ecom', 'Products') }} AS prod ON prod.product_id = sf.product_id
    LEFT JOIN 
       {{ source('ecom', 'Sales_Team') }} st ON st.team_id = sf.team_id
    LEFT JOIN 
         {{ source('ecom', 'Store_Location') }} AS sl ON sl.store_id = sf.store_id
    GROUP BY 
        prod.product_name, prod.product_id
    ORDER BY 
        Total_Product_Revenue DESC