/* joins: select all the computers from the products table:
using the products table and the categories table, return the 
product name and the category name */
SELECT P.Name as ProductName , C.Name as CategoriesName
FROM products as P 
INNER JOIN categories as C 
ON  C.CategoryID = P.CategoryID 
WHERE C.Name = 'Computers';
 
/* joins: find all product names, product prices, and products 
ratings that have a rating of 5 */
-- product table, reviwe table Rating
SELECT products.Name, products.Price, reviews.Rating
FROM products
INNER JOIN reviews on reviews.ProductID = products.ProductID
WHERE reviews.Rating = 5;

 
/* joins: find the employee with the most total quantity sold. 
 use the sum() function and group by */
 -- employee table, sales table, join on productID
SELECT e.FirstName, e.LastName, Sum(s.Quantity) As Total from Sales AS s
INNER JOIN employees as e on e.EmployeeID = s.EmployeeID
group by e.EmployeeID
order by total desc
limit 2;


/* joins: find the name of the department, and the name of the 
category for Appliances and Games */
SELECT d. Name as 'Department Name', c.Name as 'Category Name' FROM departments as d
INNER JOIN categories as c ON c.DepartmentID = d.DepartmentID
WHERE c.Name = 'Appliances' OR c.Name = 'Games'; 

/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
 SELECT p.Name, sum(s.Quantity) as 'Total Sold', sum(s.Quantity * s.PricePerUnit) as 'Total Price'
 FROM products as p
 INNER JOIN sales as s on s.ProductID = p.ProductID
 WHERE p.ProductID = 97;

/* joins: find Product name, reviewer name, rating, and comment 
on the Visio TV. (only return for the lowest rating!) */
SELECT p.Name, r.Reviewer, r.Rating, r.Comment
FROM products as p
INNER JOIN reviews as r on r.ProductID = p.ProductID
WHERE p.ProductID = 857 AND r.Rating = 1;



-- ------------------------------------------ Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return:
-  the employeeID
-  the employee's first and last name
-  the name of each product
-  and how many of that product they sold */
SELECT e.EmployeeID, e.FirstName, e.LastName, p.Name, SUM(s.Quantity) as TotalSold
FROM Sales as s
INNER JOIN employees as e on e.EmployeeID = s.EmployeeID
INNER JOIN products as p on p.ProductID = s.ProductID
GROUP BY e.EmployeeID, p.ProductID;