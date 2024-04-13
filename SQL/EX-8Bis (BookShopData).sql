CREATE TABLE booktable (
book_id INT,
title VARCHAR(255),
author VARCHAR(255),
genre VARCHAR(100),
price NUMERIC(8,2),
publication_year INT,
PRIMARY KEY (book_id)
);


CREATE TABLE ordertable (
order_id INT PRIMARY KEY,
book_id INT,
FOREIGN KEY (book_id) REFERENCES booktable(book_id),
order_date DATE,
total_amount NUMERIC(10,2)
);


--2
ALTER TABLE booktable
ADD COLUMN customer_id INTEGER;

--3.1

INSERT INTO booktable (book_id, title, author, genre, price, publication_year)
VALUES 
(1, 'The Great Gatsby', 'F. Scott Fitzgerald', 'Classic', 10.99, 1925),
(2, 'To Kill a Mockingbird', 'Harper Lee', 'Fiction', 12.50, 1960),
(3, '1984', 'George Orwell', 'Dystopian', 9.95, 1949);

--3.2
ALTER TABLE ordertable
ADD COLUMN customer_id INTEGER;

INSERT INTO ordertable (order_id, customer_id, order_date, total_amount)
VALUES
(101,1,'2022-01-15',23.45),
(102,2,'2022-02-01', 45.67),
(103,3,'2022-03-10', 12.99);


--4.1

UPDATE booktable
SET price = 11.99
WHERE book_id = 1;

--4.2
UPDATE ordertable
SET order_date = '2022-03-15'
WHERE order_id=103;

--5.1
DELETE FROM booktable
WHERE book_id=3;

--5.2
DELETE FROM ordertable
WHERE order_id=101;


--6.1
SELECT title,author
FROM booktable;

--6.2
SELECT title,author
FROM booktable WHERE price>10.00 AND genre='Fiction';


--7.1
SELECT AVG(price)
FROM booktable;

--7.2    
SELECT COUNT(*) AS total_orders
FROM ordertable;

--7.3
SELECT DISTINCT genre
FROM booktable;

--7.4
SELECT SUM(total_amount)
FROM ordertable;

--7.5
SELECT MIN(price)
FROM booktable;

SELECT MAX(price)
FROM booktable;

--8.1
SELECT UPPER(title)
FROM booktable;

--8.2
SELECT LOWER(author)
FROM booktable;

--9.1
SELECT genre, SUM(total_amount) AS total_sales
FROM ordertable o
JOIN booktable b ON o.book_id = b.book_id
GROUP BY genre;

--10.1
SELECT title,price
FROM booktable
ORDER BY price DESC;