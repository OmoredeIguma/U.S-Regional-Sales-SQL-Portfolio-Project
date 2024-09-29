# Portfolio-Project
# Overview

This project explores the rich dataset provided by Kaggle [website](https://www.kaggle.com/datasets/talhabu/us-regional-sales-data). This dataset provides comprehensive insights into US regional sales data across different sales channels, including In-Store, Online, Distributor, and Wholesale. With a total of 17,992 rows and 15 columns, this dataset encompasses a wide range of information, from order and product details to sales performance metrics. It offers a comprehensive overview of sales transactions and customer interactions, enabling deep analysis of sales patterns, trends, and potential opportunities. Through this analysis, I aim to uncover valuable insights into customer behaviour, product performance, and overall business trends within the e-commerce domain. <br />
<br />
Objective 1 - Database Design and Importing Data
The first objective is to import the data to a relational database in Snowflake. There are 5 tables in this dataset which have a relation with each other. The following tasks was performed: <br />
•	Creating all tables in certain order so that the relationship between the tables can be established. <br />
•	Choosing the adequate datatypes for the data set values. <br />
•	Creating important primary keys and foreign keys for relationship among tables. <br />
•	Importing data into tables with particular order to maintain relation. <br />
•	Create Entity Relationship Diagram (ERD) to show the table relations. <br />

Objective 2 - Exploratory Data Analysis
After importing the dataset to the tables, an Exploratory Data Analysis with SQL queries was performed to answer questions and generate insights about the data. This will include the following analysis: <br />
•	Customer and Seller Analysis <br />
•	Delivery Analysis <br />
•	Sales and Revenue Analysis <br />

# Tools I Used
SQL: This was used for importing the datasets and for doing exploratory data analysis. <br />

Snowflake: The database cloud storage platform for storing the datasets. <br />

DBT Cloud: For data transformations and creation of models. <br />

Tableau Public: For data [visualizations](https://public.tableau.com/app/profile/omorede.iguma/viz/USREGIONALSALESDASHBOARD_2024/Dashboard). <br />

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

# Insights
* _What customers generates the most profit?_ <br />
Insights: The customer “Medline” was the most profitable with a total profit of $765,837 generated.

* _What is the average delivery day?_ <br />
Insights:	The average delivery day was 21 days.

* _What is the average shipping day?_ <br />
Insights:	The average shipping day was 15 days.

* _What is the total revenue generated?_ <br />
Insight: The total revenue generated was $ 73,143,380

* _What is the total profit generated?_ <br />
Inisght: The total profit generated was $27,291,388

* _What is the revenue per sales channel?_ <br />
Inisght: 
In-Store	30,102,905

* _What products generates the most revenue?_ <br />
Inisght: Blankets were the most profitable product sold generating a total of	$1,650,902


* _What are the total numbers of orders per sales channels?_ <br />
Inisght: The In-Store channel was where most of the orders were placed with a total of 3,298 orders

* _What states generates the most revenue?_ <br />
Inisght: California was the most profitable state with a revenue of $15,186,331 generated.

* _What sales person generates the most revenue?_ <br />
Inisght: Donald Reynolds was the best performing sales person with a revenue generation of $2,980,413


