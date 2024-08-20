WITH sales_team AS (
    SALES_TEAMID AS Salesteam_id
    SALES_TEAM
    REGION
FROM {{ source('ecom', 'Sales_Team') }}

)
select * from {{ source('ecom', 'Sales_Team') }}