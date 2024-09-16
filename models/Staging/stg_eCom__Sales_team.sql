WITH sales_team AS (
    SELECT
    _SalesTeamID AS Team_ID,
    "Sales Team" AS Team_Name,
    REGION
FROM {{ source('eCom', 'Sales_Team') }}
)
select * 
from sales_team