-- Genre Table
CREATE TABLE Genre (
    genreId BIGINT PRIMARY KEY,
    name VARCHAR(45)
);

-- Author Table
CREATE TABLE Author (
    authorId BIGINT PRIMARY KEY,
    name VARCHAR(45),
    biography TEXT
);

-- Inventory Table
CREATE TABLE Inventory (
    inventoryId BIGINT PRIMARY KEY,
    quantity INT
);

-- Supplier Table
CREATE TABLE Supplier (
    supplierId BIGINT PRIMARY KEY,
    name VARCHAR(45),
    contactInfo VARCHAR(45),
    inventoryId BIGINT,
    FOREIGN KEY (inventoryId) REFERENCES Inventory(inventoryId)
);

-- BookGroup Table
CREATE TABLE BookGroup (
    bookGroupId BIGINT PRIMARY KEY,
    inventoryId BIGINT,
    title VARCHAR(45),
    authorId BIGINT,
    genreId BIGINT,
    price DECIMAL(10,2),
    FOREIGN KEY (inventoryId) REFERENCES Inventory(inventoryId),
    FOREIGN KEY (authorId) REFERENCES Author(authorId),
    FOREIGN KEY (genreId) REFERENCES Genre(genreId)
);

-- Book Table
CREATE TABLE Book (
    bookId BIGINT PRIMARY KEY,
    bookGroupId BIGINT,
    FOREIGN KEY (bookGroupId) REFERENCES BookGroup(bookGroupId)
);

-- Customer Table
CREATE TABLE Customer (
    customerId BIGINT PRIMARY KEY,
    name VARCHAR(45),
    email VARCHAR(45),
    phone VARCHAR(45),
    address VARCHAR(45)
);

-- Order Table
CREATE TABLE [Order] (
    orderId BIGINT PRIMARY KEY,
    customerId BIGINT,
    orderDate DATE,
    status VARCHAR(45),
    FOREIGN KEY (customerId) REFERENCES Customer(customerId)
);

-- OrderItem Table
CREATE TABLE OrderItem (
    orderItemId BIGINT PRIMARY KEY,
    orderId BIGINT,
    bookId BIGINT,
    quantity INT,
    totalPrice DECIMAL(10,2),
    FOREIGN KEY (orderId) REFERENCES [Order](orderId),
    FOREIGN KEY (bookId) REFERENCES Book(bookId)
);

-- Review Table
CREATE TABLE Review (
    reviewId BIGINT PRIMARY KEY,
    bookGroupId BIGINT,
    customerId BIGINT,
    rating INT,
    comment TEXT,
    reviewDate DATE,
    FOREIGN KEY (bookGroupId) REFERENCES BookGroup(bookGroupId),
    FOREIGN KEY (customerId) REFERENCES Customer(customerId)
);

-- Employee Table
CREATE TABLE Employee (
    employeeId BIGINT PRIMARY KEY,
    name VARCHAR(45),
    email VARCHAR(45),
    phone VARCHAR(45),
    address VARCHAR(255),
    role VARCHAR(45)
);

-- Account Table
CREATE TABLE Account (
    accountId BIGINT PRIMARY KEY,
    employeeId BIGINT,
    customerId BIGINT,
    accountName VARCHAR(45),
    password VARCHAR(255),
    FOREIGN KEY (employeeId) REFERENCES Employee(employeeId),
    FOREIGN KEY (customerId) REFERENCES Customer(customerId)
);