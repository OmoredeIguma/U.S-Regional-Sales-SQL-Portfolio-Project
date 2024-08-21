{{config(
    materialized ="table"
)}}

WITH customers AS (
    select * from {{ source('ecom', 'Customers') }}
),
products AS (
    select * from {{ source('ecom', 'Products') }}
),
sales_team AS (
    select * from {{ source('ecom', 'Team') }}
),
store_location AS (
    select * from {{ source('ecom', 'Store_Location') }}
),
sales_fact AS (
    select * from {{ source('ecom', 'Sales_fact') }}
),

Total_Revenue AS (
    SELECT 
        ROUND(SUM((Unit_Price * Order_Quantity) * (1 - Discount_Applied)), 0) AS Total_Revenue
    FROM {{ source('ecom', 'Sales_fact') }}
),
TOTAL Profit AS (
SELECT 
	ROUND(SUM((Unit_Price-Unit_Cost) * Order_Quantity * (1-Discount_Applied)),0) AS Total_Profit
FROM 
		{{ source('ecom', 'Sales_fact') }}
),
Total_Revenue_by_sales_person AS (
    SELECT 
        st.Team_Names,
        st.Team_ID,
        ROUND(SUM((Unit_Price * Order_Quantity) * (1 - Discount_Applied)), 0) AS Total_Revenue_by_sales_person
    FROM 
    {{ source('ecom', 'Sales_fact') }} as sf
    LEFT JOIN 
        Team AS st ON st.Team_ID = sf.Team_ID
    GROUP BY 
        st.Team_Names, st.Team_ID
    ORDER BY 
        Total_Revenue_by_sales_person DESC