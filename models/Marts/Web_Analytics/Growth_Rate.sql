SELECT 
    Year,
     month_of_the_year, 
     users,
    LAG(users) OVER(ORDER BY Year, month_of_the_year) AS Previous_users,
    (users - LAG(users) OVER(ORDER BY Year, month_of_the_year)) /
    LAG(Users)  OVER(ORDER BY Year, month_of_the_year) * 100 AS Growth_Rate
    From {{ ref('stg_web_analytics') }}