--Dataset contains information about various product related to the bike industry.
--Dataset available in Kaggle: https://www.kaggle.com/datasets/kyanyoga/sample-sales-data/metadata?select=sales_data_sample.csv

--The quantity of orders that each country bought
SELECT country,  SUM (Order_Quantity) AS total_number
FROM `project2-338809.My_project.Bike_Sales` 
GROUP BY country
ORDER BY  total_number DESC 

--List of countries from highest to lowest revenue.
SELECT Country , SUM (Revenue) AS total_revenue
FROM `project2-338809.My_project.Bike_Sales` 
GROUP BY Country
ORDER BY  total_revenue DESC 

--The country with the highest revenue month.
Select country,  month, year, SUM (Revenue) AS total_revenue 
FROM `project2-338809.My_project.Bike_Sales` 
GROUP BY  country, month, year 
ORDER BY total_revenue DESC   

--Top 5 highest revenue dates and their countries.
SELECT date, Country, SUM (Revenue) AS total_revenue 
FROM `project2-338809.My_project.Bike_Sales` 
GROUP BY  date, country  
ORDER BY  total_revenue DESC  
LIMIT 5

--How many producst are in the dataset?
Select Count (DISTINCT Product) AS products
FROM `project2-338809.My_project.Bike_Sales`   

--List all the indvidual products that exist in the dataset.
SELECT DISTINCT (Product) AS products
FROM `project2-338809.My_project.Bike_Sales`  

--List the products from highest number of quantity sold to lowest. 
SELECT Product, SUM (Order_Quantity) AS quantity_sold
FROM `project2-338809.My_project.Bike_Sales` 
GROUP BY  Product
ORDER BY  quantity_sold DESC  

--List the products that have more sold more than 500 units. 
SELECT Product, SUM (Order_Quantity) AS  sold_quantity 
FROM `project2-338809.My_project.Bike_Sales`  
GROUP BY  Product
HAVING sold_quantity >500
ORDER BY  sold_quantity 

--TOp 5 products sold among females.
Select DISTINCT (Product) as products, Customer_Gender, SUM (Order_Quantity) as sold_quantity 
FROM `project2-338809.My_project.Bike_Sales`  
WHERE Customer_Gender = 'F'
GROUP BY  Customer_Gender, products 
ORDER BY  sold_quantity DESC  LIMIT 5

--Top 5 Products sold among males. 
Select DISTINCT (Product) as products, Customer_Gender, SUM (Order_Quantity) as sold_quantity 
FROM `project2-338809.My_project.Bike_Sales`  
WHERE Customer_Gender = 'M'
GROUP BY  Customer_Gender, products 
ORDER BY  sold_quantity desc  LIMIT 5 

--Top 5 products the group age between  25 and 35 order the most. 
Select Age_group, Product, SUM (Order_Quantity) as quantity_sold 
FROM `project2-338809.My_project.Bike_Sales`  
WHERE Age_group ='Young Adults (25-34)'
GROUP BY  Age_group, product 
ORDER BY  quantity_sold DESC LIMIT  5

--Comapring the profit of the month of January  throught the years. 
SELECT Month, Year, SUM (Profit) AS total_profit
FROM `project2-338809.My_project.Bike_Sales` 
WHERE Month = 'January'
GROUP BY  Month, Year
ORDER BY  total_profit DESC 

------------
----How much revenue did Germany generate in each year? 
SELECT country, year, SUM (Revenue) AS total_revenue
FROM `project2-338809.My_project.Bike_Sales` 
WHERE country = 'Germany'
GROUP BY country, year 
ORDER BY 1,2 

--The product that sold the least in Germany 
Select Product, country, SUM (Order_Quantity) AS quantity_sold
FROM `project2-338809.My_project.Bike_Sales` 
WHERE country = 'Germany' 
GROUP BY  Product, country 
ORDER BY  quantity_sold ASC  
LIMIT 1 





