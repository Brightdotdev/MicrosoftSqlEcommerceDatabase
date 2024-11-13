-- Query to fetch detailed order information including user and product details
SELECT 
    Orders.OrderID, 
    Users.UserName, 
    product.ProductName, 
    OrderItem.Quantity, 
    OrderItem.Price
FROM 
    Orders
JOIN 
    Users ON Orders.UserID = Users.UserID
JOIN 
    orderItem ON Orders.OrderID = orderItem.OrderID
JOIN 
    product ON orderItem.ProductID = Product.ProductID;


--works like a total sum of all the sales made fromm orders
/*its like a total year sales yeah incase we're  asked how much sales was made per year
now we only have one year in our database...but different months...
the months are grouped by the number of months we have in our database(3 months)
thats why dates are stored in date format and not string so queries like this can be possible
*/ 
	SELECT 
    YEAR(OrderDate) AS Year, 
    MONTH(OrderDate) AS Month, 
    SUM(TotalAmount) AS TotalSales
FROM 
    Orders
GROUP BY 
    YEAR(OrderDate), 
    MONTH(OrderDate)
ORDER BY 
    Year, 
    Month;

	--you can chek the  months we have in our database and years with this query
	select orders.orderDate from orders


	--countss
	--this query counts the number of rows that are inthe orders tables(so we have 80 orders iif the query is run properly)
	SELECT COUNT(*) AS NumberOfOrders FROM Orders;

	--max
	--this uery gets thhe maximun(largest number(price)) of sale made from the total amount made from the orders
	SELECT MAX(TotalAmount) AS MaxSale FROM Orders;

--update
/*
now this adds 500 more to the already stored price where the category id is less than 5(the price will be with an extra 500)
*/
UPDATE Product
SET Price = Price + 500
WHERE CategoryID < 5;
/*
how this works this gets all the products where their category id is equals to 2 yeah?...and multiplies the price by ten percent
like a price increase
*/
UPDATE Product
SET Price = Price * 1.10
WHERE CategoryID = 2;
/*
now this different...its like updating mutliple entities at once...like actual programming

instead of typing update queries multiple times yeah..we just do this...
something like a switch case from logic buliding

*/


UPDATE Product
SET Price = Price * 
    CASE 
        WHEN CategoryID = 1 THEN 1.20  -- Increase by 20% for CategoryID 1
        WHEN CategoryID = 2 THEN 1.30  -- Increase by 30% for CategoryID 2
        WHEN CategoryID = 3 THEN 1.40  -- Increase by 40% for CategoryID 3
        WHEN CategoryID = 4 THEN 1.70  -- Increase by 70% for CategoryID 4
        ELSE 1.00  -- No change for other categories (optional)
    END
;


/*text search*/
/*
it goes through the users table and brings out all the people whose name are withing the %% sign
like if it was %david% it brings out all the david from the selected column
*/
SELECT * FROM Users
WHERE username LIKE '%alice%'; -- Finds any values that start with 'Alice'


SELECT * FROM Product
WHERE ProductName LIKE '%phone%'; -- Finds any values that contain 'phone'



--more queries
--selects the top 10 percent from thre product table(kinda like the same with selecting the top 10)
SELECT TOP 10 * FROM Product;



SELECT * FROM Product
ORDER BY Price ASC; -- Sort by price in ascending order

SELECT * FROM Product
ORDER BY Price DESC; -- Sort by price in descending order


---counts all the products per category from the product table
SELECT CategoryID, COUNT(*) AS ProductCount
FROM Product
GROUP BY CategoryID;





-- Adding a column
ALTER TABLE Products
ADD Stock INT;

-- Deleting a column
ALTER TABLE Products
DROP COLUMN Stock;

-- Modifying a column
ALTER TABLE Products
ALTER COLUMN ProductName NVARCHAR(255);

/*HAVING
The HAVING keyword is used to filter groups created by the GROUP BY clause. It is similar to the WHERE clause but operates on groups.
*/

--This query finds categories with more than 2 products.

SELECT CategoryID, COUNT(*) AS ProductCount
FROM Product
GROUP BY CategoryID
HAVING COUNT(*) > 2;

--distinct is straigt foreward
/*it removes doubles from a table quey*/
sELECT DISTINCT orderStatus from orders

/*simple transanction*/

--this adds a column 'discount to the table users'
ALTER TABLE users
ADD discount decimal(10, 2)
select *from users
--if the code works the column should be fill with nuull values
--this then updates the new column discount with 10 prercent where their role is == "staff"

update users 
set discount = 1.10
where role = 'staff'
--we could do this
--or speed up the process with
UPDATE users
SET discount = 
    CASE 
        WHEN role = 'customer' THEN 1.20  -- Increase by 20% for customer
        WHEN role= 'staff' THEN 1.30  -- Increase by 30% for staff
        WHEN role = 'admin' THEN 1.40  -- Increase by 40% for admin
        ELSE 1.00  -- No change for other roles (optional)
    END
	select * from users
