WITH Sales_orders AS(
    SELECT
    OrderNumber AS Order_Number,
    "Sales Channel" AS Sales_Channel,
    TO_DATE(ProcuredDate, 'DD/MM/YYYY') AS Procured_Date,
    TO_DATE(Orderdate, 'DD/MM/YYYY') AS Order_Date,
    TO_DATE(Shipdate,'DD/MM/YYYY') AS Ship_Date,
    TO_DATE(Deliverydate,'DD/MM/YYYY') AS Delivery_Date,
    CurrencyCode AS Currency_Code,
    _SalesTeamID AS Team_ID,
    _CustomerID AS Customer_ID,
    _StoreID AS Store_ID,
    _ProductID AS Product_ID,
    "Order Quantity" AS Order_Quantity,
    "Discount Applied" AS Discount_Applied,
    REPLACE("Unit Price", ',','') AS Unit_Price,
    REPLACE("Unit Cost", ',','') AS Unit_Cost,
FROM {{ source('ecom', 'Sales_Orders') }}
)
select *
from Sales_orders
