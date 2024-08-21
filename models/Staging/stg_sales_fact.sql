WITH Sales_fact_cte AS(
    SELECT
    Sales_channel
    Procured_date,
    Order_date,
    Ship_date,
    Delivery_date,
    team_id,
    Customer_id,
    Store_id,
    Product_id,
    Order_quantity,
    Discount_applied,
    Unit_price,
    Unit_cost
FROM {{ source('ecom', 'Sales_fact') }}
)
select * from {{ source('ecom', 'Sales_fact') }}