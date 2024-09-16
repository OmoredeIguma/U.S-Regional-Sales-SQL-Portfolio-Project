WITH products AS(
    SELECT
        _ProductID AS Product_ID,
        "Product Name" AS Product_Name
FROM {{ source('eCom', 'Products') }}
)
select * 
from Products