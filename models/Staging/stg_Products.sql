WITH Products AS(
    select
    productid AS product_id
    product_names
FROM {{ source('ecom', 'Products') }}
)
select * from {{ source('ecom', 'Products') }}