WITH Total_Profit AS (
    SELECT * 
    FROM {{ ref('stg_sales_fact') }}
)
SELECT * FROM Total_Profit