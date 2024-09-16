SELECT
        Year, Month_of_the_Year,
        SUM(Users) as total_users,
        SUM(New_Users) as total_new_users,
        SUM(Sessions) as total_sessions
FROM
        {{ ref('stg_WEB__Web_Analytics') }}
        GROUP BY Year, Month_of_the_Year
        ORDER BY Year