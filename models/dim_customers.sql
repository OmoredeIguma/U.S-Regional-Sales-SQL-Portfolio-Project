WITH Customer_data AS (
    Select customer_id
        customer_name
    FROM {{ ref('stg_customers') }}
)

Select * FROM Customer_data