WITH Sales_fact AS(
    select
    SALESCHANNEL
    PROCUREDDATE
    ORDERDATE
    SHIPDATE
    DELIVERYDATE
    SALESTEAMID
    CUSTOMERID
    STOREID
    PRODUCTID
    ORDERQUANTITY
    DISCOUNTEDAPPLIED
    UNITPRICE
    UNITCOST
    FROM {{ source('ecom', 'Sales_fact') }}
)
select * from {{ source('ecom', 'Sales_fact') }}