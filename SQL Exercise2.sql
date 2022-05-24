/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */
 SELECT p.name as ProductName, c.name as Category
 FROM products as p
 INNER JOIN categories as c ON p.CategoryID = c.CategoryID
 WHERE c.name = 'computers';
 
/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
SELECT p.name as "Product Name", p.price, r.rating
FROM products as p
LEFT JOIN reviews as r on p.productid = r.productid
WHERE r.rating = 5;
 
/* joins: find employee with most total quantity sold.  use the sum() function and group by */
SELECT e.employeeid, e.firstname, e.lastname, sum(s.quantity) AS TotalQuantitySold  
FROM employees as e
INNER JOIN sales as s on e.EmployeeID = s.employeeid
GROUP BY e.EmployeeID
ORDER BY TotalQuantitySold DESC
LIMIT 2;

/* joins: find name of department, and name of category for Appliances and Games */
SELECT distinct d.name as Department, c.name as Category
FROM categories c 
INNER JOIN departments d on d.departmentid = c.DepartmentID
WHERE c.name in ('appliances','games');

/* joins: find product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
SELECT p.name, SUM(s.Quantity) as 'Total # Sold', Sum(s.Quantity*s.PricePerUnit) as 'Total Price Sold'
FROM products p
INNER JOIN sales s on p.productid = s.productid
WHERE p.name like '%Eagles%Hotel%';

/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */
SELECT p.name as "Product Name", r.Reviewer, r.Rating, r.Comment
FROM products p
INNER JOIN reviews r ON p.productid = r.productid
WHERE p.name like '%visio%'
LIMIT 1;

--  Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return employeeID, employee's first and last name, name of each product, how many of that product they sold */
SELECT e.EmployeeID, e.FirstName, e.LastName, p.name as Product, SUM(s.quantity) as TotalSold
FROM employees e
INNER JOIN sales s on e.employeeid = s.employeeid
LEFT JOIN products p on s.productid = p.productid
GROUP BY e.employeeid, p.productid;



