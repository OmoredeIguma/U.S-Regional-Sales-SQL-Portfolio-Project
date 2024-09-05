WITH Products_cte AS(
    SELECT
        product_id,
        product_name
FROM {{ source('ecom', 'Products') }}
)
select * 
from Products_cte