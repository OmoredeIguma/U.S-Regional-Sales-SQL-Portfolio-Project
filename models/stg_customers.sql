WITH Customers AS(
    select
    customersid AS customers_id
    customers_names
    from {{ source('ecom', 'Customers') }}
)
select * from {{ source('ecom', 'Customers') }}