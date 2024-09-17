SELECT sales_team.team_name,
		sales_team.Team_ID,
		ROUND(SUM((Unit_Price*order_quantity) * (1-discount_applied)),0) AS Total_Revenue_by_sales_person
FROM 
		{{ ref('fct_sales') }} sales_order
LEFT JOIN 
	{{ ref('dim_products') }} products ON products.product_id = sales_order.product_id
LEFT JOIN 
	{{ ref('dim_sales_team') }} sales_team ON  sales_team.team_id = sales_order.team_id

GROUP BY sales_team.team_name,
		sales_team.Team_ID
ORDER BY 
	Total_Revenue_by_sales_person DESC