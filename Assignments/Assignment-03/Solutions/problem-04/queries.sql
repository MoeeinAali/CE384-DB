-- Query 1
SELECT books.title, SUM(Orders.Quantity) AS Sum
FROM orders
         JOIN books ON orders.bookid = books.bookid
GROUP BY books.title
ORDER BY Sum DESC
LIMIT 3;
-- Query 2
SELECT customers.name, SUM(books.price * orders.quantity) AS TotalPrice
FROM customers
         JOIN orders ON customers.customerid = orders.orderid
         JOIN books ON orders.bookid = books.bookid
GROUP BY customers.customerid
ORDER BY TotalPrice DESC
LIMIT 1;
-- Query 3
SELECT books.genre, SUM(quantity) AS Sum, avg(price) AS Average
FROM books
         JOIN orders ON books.bookid = orders.orderid
WHERE orders.orderdate >= '2023-01-01'
GROUP BY books.genre;
-- Query 4
SELECT Books.Title,
       Books.Genre,
       AVG(Reviews.Rating) AS Average,
       RANK() OVER (
           PARTITION BY Books.Genre ORDER BY AVG(Reviews.Rating) DESC
           )               AS Rank
FROM books
         FULL JOIN reviews ON books.bookid = reviews.reviewid
GROUP BY Books.Title, Books.Genre
ORDER BY Books.Genre, Average DESC;