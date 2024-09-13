WITH store_location AS (
    SELECT
    _StoreID AS Store_ID,
    "City Name" AS City_Name,
    County,
    StateCode AS State_Code,
    State,
    Type,
    Latitude,
    Longitude,
    AreaCode AS Area_Code,
    Population,
    "Household Income" AS Household_Income,
    "Median Income" AS Median_Income,
    "Land Area" AS Land_Area,
    "Water Area" AS Water_Area,
    "Time Zone" AS Time_Zone
FROM {{ source('ecom', 'Store_Locations') }}
)
select * FROM store_location
