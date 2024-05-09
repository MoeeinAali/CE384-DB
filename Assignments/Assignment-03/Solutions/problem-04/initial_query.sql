-- Create Tables
CREATE TABLE IF NOT EXISTS Books
(
    BookID INT PRIMARY KEY,
    Title  TEXT,
    Author TEXT,
    Price  DECIMAL,
    Genre  TEXT
);

CREATE TABLE Customers
(
    CustomerID INT PRIMARY KEY,
    Name       TEXT,
    Email      TEXT,
    JoinDate   DATE
);

CREATE TABLE Orders
(
    OrderID    INT PRIMARY KEY,
    CustomerID INT,
    BookID     INT,
    Quantity   INT,
    OrderDate  DATE,
    FOREIGN KEY (CustomerID) REFERENCES Customers (CustomerID),
    FOREIGN KEY (BookID) REFERENCES Books (BookID)
);

CREATE TABLE Reviews
(
    ReviewID   INT PRIMARY KEY,
    BookID     INT,
    CustomerID INT,
    Rating     INT,
    ReviewText TEXT,
    FOREIGN KEY (BookID) REFERENCES Books (BookID),
    FOREIGN KEY (CustomerID) REFERENCES Customers (CustomerID)
);

-- Insert Data into Tables
\copy Books(BookID, Title, Author, Price, Genre) FROM './Data/tables/books.csv' DELIMITER ',' CSV HEADER;
\copy Orders(OrderID, CustomerID, BookID, Quantity, OrderDate) FROM './Data/tables/orders.csv' DELIMITER ',' CSV HEADER;
\copy Customers(CustomerID, Name, Email, JoinDate) FROM './Data/tables/customers.csv' DELIMITER ',' CSV HEADER;
\copy Reviews(ReviewID, BookID, CustomerID, Rating, ReviewText) FROM './Data/tables/reviews.csv' DELIMITER ',' CSV HEADER;
