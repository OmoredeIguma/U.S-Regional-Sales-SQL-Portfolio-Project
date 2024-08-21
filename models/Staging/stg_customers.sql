with
    customers_cte as (
        select customer_id customers_names from {{ source("ecom", "Customers") }}
    )
select *
from {{ source("ecom", "Customers") }}
