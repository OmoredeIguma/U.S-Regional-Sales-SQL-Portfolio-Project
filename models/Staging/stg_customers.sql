with customers_cte as (
    select Customer_ID
        Customers_Names
    from {{ source("ecom", "Customers") }}
    )
select *
from {{ source("ecom", "Customers") }}
