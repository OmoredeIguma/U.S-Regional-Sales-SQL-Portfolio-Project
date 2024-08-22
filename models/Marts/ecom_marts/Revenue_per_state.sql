{{
    config(
        materialized='table'
    )
}}
WITH Total_Revenue_per_sales_person_cte AS (
    SELECT *
    FROM {{ source('ecom', 'Sales_fact') }}
)
SELECT 
        st.Team_Names,
        st.Team_ID,
        ROUND(SUM((Unit_Price * Order_Quantity) * (1 - Discount_Applied)), 0) AS Total_Revenue_by_sales_person
    FROM 
    {{ source('ecom', 'Sales_fact') }} sf
    LEFT JOIN 
        {{ source('ecom', 'Sales_Team') }} st ON st.team_id = sf.team_id
    GROUP BY 
        st.Team_Names, st.Team_ID
    ORDER BY 
        Total_Revenue_by_sales_person DESC