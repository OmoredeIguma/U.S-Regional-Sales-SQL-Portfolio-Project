WITH STG AS(
SELECT 
    "Source / Medium",
    Year,
    CASE
	WHEN "Month of the year" = 1 THEN 'January'
	WHEN "Month of the year" = 2 THEN 'Feburary'
	WHEN "Month of the year" = 3 THEN 'March'
	WHEN "Month of the year" = 4 THEN 'April'
	WHEN "Month of the year" = 5 THEN 'May'
	WHEN "Month of the year" = 6 THEN 'June'
	WHEN "Month of the year" = 7 THEN 'July'
	WHEN "Month of the year" = 8 THEN 'August'
	WHEN "Month of the year" = 9 THEN 'September'
	WHEN "Month of the year" = 10 THEN 'October'
	WHEN "Month of the year" = 11 THEN 'November'
	WHEN "Month of the year" = 12 THEN 'December'
END AS month_of_the_year,
    REPLACE("Users",',','') AS Users,
    REPLACE("New Users",',','') AS New_Users,
    REPLACE(Sessions,',','') AS Sessions,
    REPLACE("Bounce Rate",'%','') AS Bounce_Rate,
    REPLACE(Pageviews, ',','') AS Pageviews,
    "Avg.Session Duration" AS Avg_Session_Duration,
    "Conversion Rate (%)" AS Conversion_Rate,
    REPLACE("Transactions", ',','') AS Transactions,
    REPLACE(Revenue, ',','') AS Revenue,
    REPLACE("Quantity Sold", ',','') AS Quantity_Sold
FROM 
    {{ source('WEB', 'Web_Analytics') }}
)
SELECT * FROM STG