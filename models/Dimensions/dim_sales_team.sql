WITH dim_sales_team AS (
    SELECT team_id,
            team_names,
            region
    FROM {{ ref('stg_Sales_Team') }}
)
SELECT * FROM dim_sales_team