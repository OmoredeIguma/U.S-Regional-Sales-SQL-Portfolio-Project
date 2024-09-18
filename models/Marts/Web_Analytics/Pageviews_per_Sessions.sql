 SELECT 
        Year, 
        month_of_the_year,
    SUM(Pageviews)/SUM(Sessions) AS pageviews_per_sessions
FROM 
    {{ ref('stg_WEB__Web_Analytics') }}
GROUP BY 
   Year,month_of_the_year
ORDER BY month_of_the_year