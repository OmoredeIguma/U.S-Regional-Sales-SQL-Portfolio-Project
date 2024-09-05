WITH customers_cte AS (
    SELECT 
        Customer_ID,
        Customer_Names
    FROM {{ source("ecom", "Customers") }}
    )
select *
from customers_cte
