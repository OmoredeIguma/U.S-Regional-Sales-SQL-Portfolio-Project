WITH store_location_cte AS (
    Store_id
    City_Name
    County
    State_Code
    State
    Type
    Latitude
    Longitude
    Area_Code
    Population
    Household_Income
    Median_Income
    Land_Area
    Water_Area
    Time_Zone
FROM {{ source('ecom', 'Store_Location') }}
)

select * FROM {{ source('ecom', 'Store_Location') }}