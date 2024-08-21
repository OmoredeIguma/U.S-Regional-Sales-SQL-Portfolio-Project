WITH sales_team_cte AS (
    Team_ID
    TEAM_NAMES
    REGION
FROM {{ source('ecom', 'Team') }}

)
select * from {{ source('ecom', 'Team') }}