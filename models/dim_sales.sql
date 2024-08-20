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
    select * from {{ source('ecom', 'Sales_Team') }}
),
store_location AS (
    select * from {{ source('ecom', 'Store_Location') }}
),
sales_fact AS (
    select * from {{ source('ecom', 'Sales_fact') }}
),

Total_Revenue AS (
    SELECT 
        ROUND(SUM((Unitprice * Orderquantity) * (1 - Discountedapplied)), 0) AS Total_Revenue
    FROM {{ source('ecom', 'Sales_fact') }}
),
TOTAL Profit AS (
SELECT 
	ROUND(SUM((Unitprice-Unitcost) * Orderquantity * (1-Discountedapplied)),0) AS Total_Profit
FROM 
		{{ source('ecom', 'Sales_fact') }}
),
Total_Revenue_by_sales_person AS (
    SELECT 
        st.Sales_Team,
        st.SALES_TEAMID,
        ROUND(SUM((Unitprice * Orderquantity) * (1 - Discountedapplied)), 0) AS Total_Revenue_by_sales_person
    FROM 
    {{ source('ecom', 'Sales_fact') }}
    LEFT JOIN 
        sales_team st ON st.sales_teamid = sf.salesteamid
    GROUP BY 
        st.Sales_Team, st.SALES_TEAMID
    ORDER BY 
        Total_Revenue_by_sales_person DESC
