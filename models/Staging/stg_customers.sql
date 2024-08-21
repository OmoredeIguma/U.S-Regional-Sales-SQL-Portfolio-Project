WITH Customers_cte AS(
    select
    customer_id
    customers_names
FROM {{ source('ecom', 'Customers') }}
)
select * from {{ source('ecom', 'Customers') }}