CREATE TABLE users (
    userId INT PRIMARY KEY not null,
    username VARCHAR(50),
    userPassword VARCHAR(50),
	addressId int,
    email VARCHAR(100),
	[role] varchar(200)
);
CREATE TABLE userAddress (
    addressId INT PRIMARY KEY,
    street VARCHAR(100),
    city VARCHAR(50),
    [state] VARCHAR(50),
    zipCode VARCHAR(10),
    country VARCHAR(50),
	userId int
    FOREIGN KEY (userId) REFERENCES users(userId)	
);
CREATE TABLE orders (
    orderId INT PRIMARY KEY,
    userId INT,
    orderDate DATE,
    totalAmount DECIMAL(10, 2),
    orderStatus VARCHAR(20)
);


CREATE TABLE category (
    categoryId INT PRIMARY KEY,
    categoryName VARCHAR(100),
    [description] TEXT
);
CREATE TABLE product (
    productId INT PRIMARY KEY,
    productName VARCHAR(100),
    price DECIMAL(10, 2),
    productDescription TEXT,
	stock int,
	categoryId int,
    foreign key (categoryId) references category(categoryId)
);

CREATE TABLE review (
    reviewId INT PRIMARY KEY,
    productId INT,
    userId INT,
    rating INT,
    comment TEXT,
    reviewDate DATE,
    FOREIGN KEY (userId) REFERENCES users(userId),
    FOREIGN KEY (productId) REFERENCES product(productId)
);

CREATE TABLE cart (
    cartId INT PRIMARY KEY,
    userId INT,
    FOREIGN KEY (userId) REFERENCES users(userId)
);


CREATE TABLE payment (
    paymentId INT PRIMARY KEY,
    orderId INT,
    userId INT,
    amount DECIMAL(10, 2),
    paymentDate DATE,
    paymentMethod VARCHAR(50),
    FOREIGN KEY (orderId) REFERENCES orders(orderId),
    FOREIGN KEY (userId) REFERENCES users(userId)
);

CREATE TABLE wishlist (
    wishlistId INT PRIMARY KEY,
    userId INT,
    FOREIGN KEY (userId) REFERENCES users(userId)
);

CREATE TABLE supplier (
    supplierId INT PRIMARY KEY,
    [name] VARCHAR(100),
    contactInformation VARCHAR(100)
);
CREATE TABLE cartItem (
    cartItemId INT PRIMARY KEY,
    cartId INT,
    productId INT,
    quantity INT,
    FOREIGN KEY (cartId) REFERENCES cart(cartId),
    FOREIGN KEY (productId) REFERENCES product(productId)
);

CREATE TABLE shipment (
    shipmentId INT PRIMARY KEY,
    orderId INT,
    shipmentDate DATE,
    deliveryDate DATE,
    trackingNumber VARCHAR(50),
    carrier VARCHAR(100),
    FOREIGN KEY (orderId) REFERENCES orders(OrderID)
);
CREATE TABLE orderItem (
    orderItemId INT PRIMARY KEY,
    orderId INT,
    productId INT,
    quantity INT,
    price DECIMAL(10, 2),
    FOREIGN KEY (orderId) REFERENCES orders(OrderId),
    FOREIGN KEY (ProductId) REFERENCES product(productId)
);

CREATE TABLE productSupplier (
    productId INT,
    supplierId INT,
    PRIMARY KEY (productId, SupplierId),
    FOREIGN KEY (productId) REFERENCES product(ProductId),
    FOREIGN KEY (supplierId) REFERENCES supplier(supplierId)
);


CREATE TABLE wishlistItem (
    wishlistItemId INT PRIMARY KEY,
    wishlistId INT,
    productId INT,
    FOREIGN KEY (wishlistId) REFERENCES wishlist(wishlistId),
    FOREIGN KEY (productId) REFERENCES product(productId)
);





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