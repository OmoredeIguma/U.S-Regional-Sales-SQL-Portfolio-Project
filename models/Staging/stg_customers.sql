WITH Customers AS(
    select
    customersid AS customers_id
    customers_names
FROM {{ source('ecom', 'Customers') }}
)
select * from {{ source('ecom', 'Customers') }}