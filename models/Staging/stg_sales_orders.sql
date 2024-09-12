WITH Sales_orders AS(
    SELECT
    OrderNumber AS Order_Number,
    "Sales Channel" AS Sales_Channel,
    ProcuredDate AS Procured_Date,
    Orderdate AS Order_Date,
    Shipdate AS Ship_Date,
    Deliverydate AS Delivery_Date,
    CurrencyCode AS Currency_Code,
    _SalesTeamID AS Team_ID,
    _CustomerID AS Customer_ID,
    _StoreID AS Store_ID,
    _ProductID AS Product_ID,
    "Order Quantity" AS Order_Quantity,
    "Discount Applied" AS Discount_Applied,
    "Unit Price" AS Unit_Price,
    "Unit Cost" AS Unit_Cost,
FROM {{ source('ecom', 'Sales_Orders') }}
)
select * 
from Sales_orders