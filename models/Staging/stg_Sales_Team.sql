WITH sales_team_cte AS (
    SELECT
    Team_ID,
    TEAM_NAMES,
    REGION,
FROM {{ source('ecom', 'Sales_Team') }}
)
select * from {{ source('ecom', 'Sales_Team') }}