For your Lesson 4 Hands-On, you will be working with your new knowledge on SQL queries. This Hands-On **will** be graded, so be sure you complete all requirements. Please read through the below setup instructions before starting your project.

# Table of contents
```toc
style: bullet
```
___

## Setup

This Hands-On is structured into two parts, and each part may ask you to run multiple queries. After each query, please take a screenshot of the MySQL output and add it to a Word document (or an equivalent) and name this file `SQL-HandsOn4`. This way, you will be able to submit your answers to each part all at once.

Now you are ready to get started! Good luck!

<mark style="background: #FFB86CA6;"> Submitting: </mark>
Be sure to zip and submit your `SQL-HandsOn4` Word document when finished! You will not be able to re-submit, so be sure the screenshots to each part are located within this document.

___

# Part 1

Run the following queries:

## 1a.  Create a view named "initialCustomers"
Create a view named "initialCustomers" that shows the first name, last name, and email address of customers that have an id of less than 100. 

```mysql
create view initialCustomers as
SELECT first_name, last_name, email
FROM sakila.customer
WHERE customer_id < 100
```

![](DS108-04-11%20-%20Lesson%204%20Hands-On%20-%20query%201a.png)

## 1b.  Select and view "initialCustomers"
Once that is complete, select and view your newly created view.

```mysql
SELECT * FROM initialCustomers
```

![](DS108-04-11%20-%20Lesson%204%20Hands-On%20-%20query%201b.png)
___

# Part 2

Complete the following:

## 2a.  Create a table named "ProductList".
Include the following columns:

-   ProductId
-   ProductName
-   Price
-   DateAdded
-   EmployeeSupportId

Include the following requirements:

1.  Every product should have an automatically generated id number that should be unique for each product.
2.  Give each column a data type that would apply
3.  Give the DateAdded column a default value for the current local time.
4.  All columns CANNOT be null.

```mysql
/*
ProductID INTEGER PRIMARY KEY AUTO_INCREMENT
ProductName VARCHAR (50) NOT NULL
Price NUMERIC(10,2) NOT NULL
DateAdded DATETIME DEFAULT CURRENT_TIMESTAMP
EmployeeSupportId INTEGER UNIQUE
*/

CREATE TABLE ProductList (
	ProductID INTEGER PRIMARY KEY AUTO_INCREMENT,
	ProductName VARCHAR (50) NOT NULL,
	Price NUMERIC(10,2) NOT NULL,
	DateAdded DATETIME DEFAULT CURRENT_TIMESTAMP,
	EmployeeSupportId INTEGER UNIQUE
)
```

![](DS108-04-11%20-%20Lesson%204%20Hands-On%20-%20query%202a.png)
___

## 2b.  Insert one product into the table following the given guidelines when the table was created.
When inserting the data, don't include the `ProductId` or the `DateAdded`. 

```mysql
INSERT INTO ProductList (ProductName, Price, EmployeeSupportId)
VALUES ("The Amazing Wiz-bang", 10000.00, 122285)

```
![](DS108-04-11%20-%20Lesson%204%20Hands-On%20-%20query%202b.png)
___

## 2c.  Run a query to see the single product in your table

```mysql
SELECT * FROM sakila.ProductList;
```

![](DS108-04-11%20-%20Lesson%204%20Hands-On%20-%20query%202c.png)
