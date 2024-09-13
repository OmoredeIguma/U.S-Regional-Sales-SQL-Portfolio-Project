WITH store_location_dim AS (
 SELECT 
            Store_ID,
            City_Name,
            County,
            State_Code,
            State,
            Type,
            Latitude,
            Longitude,
            Area_Code,
            Population,
            Household_Income,
            Median_Income,
            Land_Area,
            Water_Area,
            Time_Zone
    FROM {{ ref('stg_Store_locations') }}
)
select * from store_location_dim