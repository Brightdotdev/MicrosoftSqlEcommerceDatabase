--simple queries: selecting individual tables
select * from users;
select * from userAddress;
select * from category;
select * from orders;
select * from orderItem;
select * from supplier;
select * from product;
select * from productSupplier;
select * from shipment;
select * from payment;
select * from review;
select * from cart;
select * from cartItem;
select * from wishlist;
select * from wishlistItem;

--more queries

--selecting products with the highest price
select MAX(price) as mostExpensive from product;

--selecting products with the lowest price
select Min(price) as leastExpensive from product;

--selecting the average price
select avg(price) as mostExpensive from product;


--this finds the most expensive prodcut and filters it by bringing out the name id and price
SELECT ProductID, productName, Price
FROM Product
WHERE Price = (
    SELECT MAX(Price) FROM Product
);


/*the total sales is calcullated by multiplying the total ordered items by the price of each of the products
and sums it all together 
so this queriy filters the total sales and category id
from the product table
and joins it with the order item where the product id is the same
and significantly groups them by the category id(so it calculates the total sales made from each products by their cartegory id)
*/ 
SELECT 
    categoryId,
    SUM(product.price * orderItem.quantity) AS TotalSales
FROM 
    product
JOIN 
    orderItem ON product.productId = orderItem.productId
	GROUP BY 
    CategoryID;


--using group by to group rows significantly
/* cause orderstatus column has only four inputs thats pending delivered etc the query 
groupded all of them by the sum of all the uniue values in the column orderstatus */
	SELECT
	orderStatus,
    sum(TotalAmount) AS totalAmount
FROM
    orders
GROUP BY
    orderStatus;


	select
	productId
	from
	orderItem 
	join
	orders on orders.orderId =  orderItem.orderId

	group by orderStatus 

/*this query counts the orders from the order item per product id
fromthe order item table
and joins it with the orders table where the oredr id is the same
*/

SELECT 
   orderItem.productId,
    COUNT(orderItem.orderId) AS OrderCount
FROM 
    orderItem
JOIN 
    orders ON orderItem.orderId = orders.orderId
GROUP BY 
    orderItem.productId
ORDER BY 
    OrderCount DESC;

--selecting all the products and displaying their corresponding category
SELECT productId,
product.productName AS productName, 
category.categoryName AS CategoryName
FROM product
JOIN category
ON 
product.categoryId = category.categoryId
;

--gets the orders and their details
SELECT  orders.orderId, users.username as userName, product.productName AS ProductName, orderItem.quantity, orderItem.price
FROM orders
JOIN users ON orders.userId = users.UserId
JOIN orderItem  ON orders.orderId = orders.orderId
JOIN product ON orderItem.productId = product.productId;



--gets the top rated product
/* ths gets the most rated produt by grouping t by the average rating  */
SELECT 
product.productName, product.productId, AVG(review.Rating) AS AverageRating
FROM product 
LEFT JOIN 
review  ON product.productId = review.productId
group by product.productId,product.productName


