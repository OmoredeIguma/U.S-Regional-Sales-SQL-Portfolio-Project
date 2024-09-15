SELECT 
    Year, 
    month_of_the_year,
  AVG(conversion_rate) AS Avg_conversion_rate
FROM 
    {{ ref('stg_web_analytics') }}
GROUP BY Year, 
        month_of_the_year
ORDER BY Year,
    month_of_the_year;
   