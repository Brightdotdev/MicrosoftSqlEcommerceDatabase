--this creates a stored procedure...gets the user id and brings out the information 
CREATE PROCEDURE GetUserOrders
    @UserID INT
AS
BEGIN
    SELECT top 1 * FROM Orders
    WHERE UserID = @UserID;
END;
--how to use it
exec GetUserOrders @UserId = 4


---complex joins


-- Select detailed order information including user and product details
SELECT 
    orders.OrderID, 
    users.Username, 
    users.Email, 
    product.ProductName, 
    orderItem.Quantity, 
    orderItem.Price, 
    (orderItem.quantity * orderItem.Price) AS TotalPrice,
    orders.OrderDate, 
    orders.orderStatus
FROM 
    Orders 
-- Joining OrderDetails to get product details for each order
JOIN 
    orderItem  ON orderItem.orderId = orders.OrderID
-- Joining Users to get the user details who placed the order
JOIN 
    Users  ON orders.UserID = users.UserID
-- Joining Products to get the product details in each order
JOIN 
    Product  ON orderItem.ProductID = product.ProductID
WHERE 
    orders.orderDate BETWEEN '2024-01-01' AND '2024-12-31'
ORDER BY 
    orders.OrderDate DESC;



	-- Select order details with customer and product information
SELECT 
    orders.OrderID,                      -- Order ID
    users.Username AS Customer,         -- Customer Username
    product.productName,                  -- Product Name
    orderItem.quantity,                    -- Quantity of the product ordered
    orderItem.Price,                   -- Price per unit
    (orderItem.Quantity * orderItem.Price) AS TotalPrice -- Total price for the item
FROM 
    Orders 
JOIN 
    Users  ON orders.UserID = users.UserID      -- Join Orders with Users based on UserID
JOIN 
    orderItem ON orders.OrderID = orderItem.OrderID -- Join Orders with OrderDetails based on OrderID
JOIN 
    Product ON orderItem.ProductID = product.ProductID  -- Join OrderDetails with Products based on ProductID
WHERE 
    orders.orderStatus = 'delivered';           -- Filter for delivered orders




-- Creating a stored procedure to get detailed order information for a specific user
CREATE PROCEDURE  getUserOrderDetails
    @UserID INT  -- Input parameter for the user ID
AS
BEGIN
    -- Selecting order details along with product and order information for the given user
    SELECT 
        orders.orderId,
        product.productName,
        orderItem.Quantity,
        orderItem.Price,
        (orderItem.Quantity * orderItem.Price) AS TotalPrice,
        orders.orderDate,
        orders.orderStatus
    FROM 
        orderItem
        -- Joining Orders table to get order information
        JOIN Orders  ON orderItem.OrderID = orders.OrderID
        -- Joining Products table to get product information
        JOIN Product ON orderItem.ProductID = product.ProductID
    WHERE 
        orders.UserID = @UserID;  -- Filtering for the specified user ID
END;

exec getUserOrderDetails @userId = 34