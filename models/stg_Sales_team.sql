WITH Sales_team AS(
    select
    sales_teamid AS salesteam_id
    sales_team
    region
    from {{ source('ecom', 'SALES_TEAM') }}
)
select * from {{ source('ecom', 'SALES_TEAM') }}


SELECT * FROM port_project.analytics.SALES_TEAM