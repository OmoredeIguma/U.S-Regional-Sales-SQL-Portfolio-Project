# Portfolio-Project
# Overview

This project explores the rich dataset provided on [Kaggle by Abu Talha](https://www.kaggle.com/datasets/talhabu/us-regional-sales-data). This dataset provides comprehensive insights into US regional sales data across different sales channels, including In-Store, Online, Distributor, and Wholesale. With 17,992 rows and 15 columns, this dataset encompasses a wide range of information, from order and product details to sales performance metrics. It offers a comprehensive overview of sales transactions and customer interactions, enabling deep analysis of sales patterns, trends, and potential opportunities. Through this analysis, I aim to uncover valuable insights into customer behaviour, product performance, and overall business trends within the e-commerce domain. <br />
<br />
# Objectives
Objective 1 - Database Design and Importing Data
The first objective is to import the data to a relational database in Snowflake. There are 5 tables in this dataset that relate to each other. The following tasks were performed: <br />
•	Creating all tables in a certain order so that the relationship between the tables can be established. <br />
•	Choosing the adequate datatypes for the data set values. <br />
•	Creating important primary keys and foreign keys for relationships among tables. <br />
•	Importing data into tables in particular order to maintain relations. <br />

Objective 2 - Exploratory Data Analysis
After importing the dataset to the tables, an Exploratory Data Analysis using SQL queries was performed to answer questions and generate insights about the data. This will include the following analysis: <br />
•	Customer and Seller Analysis <br />
•	Delivery Analysis <br />
•	Sales and Revenue Analysis <br />

# Tools I Used
SQL: This was used for importing the datasets and for doing exploratory data analysis. <br />

Snowflake: The database cloud storage platform for storing the datasets. <br />

DBT Cloud: For data transformations and creation of models. <br />

Tableau Public: For data [visualizations](https://public.tableau.com/app/profile/omorede.iguma/viz/USREGIONALSALESDASHBOARD_2024/Dashboard). <br />

# Transformations
Data transformation was carried out using DBT Cloud IDE. Staging models were created for transformation purposes such as renaming columns, date casting, etc which references the source table. Facts and Dimensions tables were created to organize and structure the data that referenced the staging models. The fact and dimension models were joined to create aggregations and answer the questions about the data.
# Exploratory Data Analysis
Exploratory Data Analysis was conducted to find answers to questions that will help gain insights. There were three different analyses based on the data to better understand the overall e-commerce business.
•	Customer and Seller Analysis
•	Delivery and Review Analysis
•	Sales and Revenue Analysis 
# Customer and Seller Analysis
1.	What customer generated the most profit?
# Delivery and shipping Analysis
1.	What are the average delivery days?
2.	What are the average shipping days?
# Sales and Revenue Analysis 
1.	What is the total revenue generated?
2.	What is the total profit generated?
3.	What is the profit per customer?
4.	What is the revenue per sales channel?
5.	What product generated the most revenue?
6.	What are the total numbers of orders per sales channel?
7.	What states generated the most revenue?
8.	What salesperson generates the most revenue?

# Insights
* _What customers generated the most profit?_ <br />
Insights: The customer “Medline” was the most profitable, generating a total profit of $765,837.

* _What is the average delivery day?_ <br />
Insights:	The average delivery day was 21 days.

* _What is the average shipping day?_ <br />
Insights:	The average shipping day was 15 days.

* _What is the total revenue generated?_ <br />
Insight: The total revenue generated was $ 73,143,380

* _What is the total profit generated?_ <br />
Insight: The total profit generated was $27,291,388

* _What are the revenues per sales channel?_ <br />
Insight: 
In-Store	30,102,905

* _What products generated the most revenue?_ <br />
Insight: Blankets were the most profitable product sold generating a total of	$1,650,902


* _What are the total numbers of orders per sales channel?_ <br />
Insight: The In-Store channel was where most of the orders were placed with a total of 3,298 orders

* _What states generated the most revenue?_ <br />
Insight: California was the most profitable state generating a revenue of $15,186,331.

* _What salesperson generated the most revenue?_ <br />
Insight: Donald Reynolds was the best-performing salesperson with a revenue generation of $2,980,413


