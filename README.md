# Portfolio-Project
# Overview

This project explores the rich dataset provided by the Kaggle website. This dataset provides comprehensive insights into US regional sales data across different sales channels, including In-Store, Online, Distributor, and Wholesale. With a total of 17,992 rows and 15 columns, this dataset encompasses a wide range of information, from order and product details to sales performance metrics. It offers a comprehensive overview of sales transactions and customer interactions, enabling deep analysis of sales patterns, trends, and potential opportunities. Through this analysis, I aim to uncover valuable insights into customer behaviour, product performance, and overall business trends within the e-commerce domain.
Objective 1 - Database Design and Importing Data
The first objective is to import the data to a relational database in Snowflake. There are 5 tables in this dataset which have a relation with each other. The following tasks was performed:
•	Creating all tables in certain order so that the relationship between the tables can be established
•	Choosing the adequate datatypes for the data set values
•	Creating important primary keys and foreign keys for relationship among tables
•	Importing data into tables with particular order to maintain relation.
•	Create Entity Relationship Diagram (ERD) to show the table relations.

Objective 2 - Exploratory Data Analysis
After importing the dataset to the tables, an Exploratory Data Analysis with SQL queries was performed to answer questions and generate insights about the data. This will include the following analysis:
•	Customer and Seller Analysis
•	Delivery Analysis
•	Sales and Revenue Analysis

# Tools I Used
SQL: This was used for importing the datasets and for doing exploratory data analysis.
Snowflake: The database cloud storage platform for storing the datasets.
DBT Cloud: For data transformations and creation of models
Tableau Public: For data visualizations.

# Exploratory Data Analysis
Exploratory Data Analysis was carried out to finds answers to questions which will help gain insights. There are three different analyses based on the data to better understand overall e-commerce business.
•	Customer and Seller Analysis
•	Delivery and Review Analysis
•	Sales and Revenue Analysis 
Customer and Seller Analysis
Questions to be answer for this analysis are as follows:
1.	What customers generates the most profit?
Delivery and shipping Analysis
1.	What are the average delivery days?
2.	What are the average shipping days?
Sales and Revenue Analysis 
1.	What is the total revenue generated?
2.	What is the total profit generated?
3.	What is the profit per customers?
4.	What is the revenue per sales channel?
5.	What products generates the most revenue?
6.	What are the total numbers of orders per sales channels?
7.	What states generates the most revenue?
8.	What sales person generates the most revenue?

Insights
What customers generates the most profit?
•	The customer “Medline” was the most profitable with a total profit of $765,837 generated.
Delivery and shipping Analysis
What is the average delivery day?
•	The average delivery day was 21 days 
What is the average shipping day?
•	The average shipping day was 15 days


Sales and Revenue Analysis 
1.	What is the total revenue generated?
Insight: The total revenue generated was $ 73,143,380
2.	What is the total profit generated?
Inisght: The total profit generated was $27,291,388
3.	What is the profit per customers?
Inisght: 
Medline 	765837
Apotheca Ltd	701138
Pure Group	652958
ETUDE Ltd	644998
OUR Ltd	638858
Ei 	627733
Apollo Ltd	627509
Ohio 	624744
Trigen 	620265
Victory Ltd	605521

4.	What is the revenue per sales channel?
Inisght: 
In-Store	30102905.0
Online	21698559.0
Distributor	13169148.0
Wholesale	8172769.0


5.	What products generates the most revenue?
Inisght: 
Blankets	1650902
Ornaments	1648318
Floral	1633697
Dining Furniture	1624594
Table Lamps	1612535
TV and video	1608853
Sculptures	1595510
Bar Tools	1594396
Wall Frames	1590447
Vanities	1586897

6.	What are the total numbers of orders per sales channels?
Inisght: 
In-Store	3298
Online	2425
Distributor	1375
Wholesale	893
Enter dbt command

7.	What states generates the most revenue?
Inisght: California was the most profitable state with a revenue of $15,186,331 generated.
8.	What sales person generates the most revenue?
Inisght: Donald Reynolds was the best performing sales person with a revenue generation of $2,980,413


select customer_city, count(customer_unique_id) as number_customers
from olist_customers
group by customer_city
order by number_customers DESC
limit 10;


