{{
    config(
        materialized='table'
    )
}}
WITH sales_team_data AS (
    SELECT team_id,
            team_names,
            region
    FROM {{ ref('stg_Sales_Team') }}
)
SELECT * FROM sales_team_data