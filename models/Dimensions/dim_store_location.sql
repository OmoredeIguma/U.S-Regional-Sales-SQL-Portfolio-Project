{{
    config(
        materialized='table'
    )
}}
WITH store_location_data AS (
    SELECT store_id,
            city_name,
            county,
            state_code,
            state,
            type,
            latitude,
            longitude,
            area_code,
            population,
            household_income,
            median_income,
            land_area,
            water_area,
            time_zone
    FROM {{ ref('stg_Store_location') }}
)
SELECT * FROM store_location_data