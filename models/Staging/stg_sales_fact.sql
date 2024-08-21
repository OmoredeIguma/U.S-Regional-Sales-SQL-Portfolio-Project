WITH Sales_fact_cte AS(
    SELECT
    Saleschannel AS Sales_channel,
    Procureddate AS Procured_date,
    Orderdate AS Order_date,
    Shipdate AS Ship_date,
    Deliverydate AS Delivery_date,
    Salesteamid AS Salesteam_id,
    Customerid AS Customer_id,
    Storeid AS Store_id,
    Productid AS Product_id,
    Orderquantity AS Order_quantity,
    Discountedapplied AS Discount_applied,
    Unitprice AS Unit_price,
    Unitcost AS Unit_cost
FROM {{ source('ecom', 'Sales_fact') }}
)
select * from {{ source('ecom', 'Sales_fact') }}