 SELECT 
    Year,
    month_of_the_year,
    AVG(Bounce_Rate) AS Avg_bounce_rate,
    FROM 
        {{ ref('stg_web_analytics') }}
   GROUP BY Year, 
      month_of_the_year
  ORDER BY 
       Avg_bounce_rate DESC