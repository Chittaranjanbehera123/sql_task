-- Create Database
create database sunakardb;
use sunakardb;
-- Create Authors table
CREATE TABLE Authors (
    author_id INT PRIMARY KEY,
    author_name VARCHAR(255) NOT NULL
);
desc Authors;
select * from Authors;
-- Create Books table
CREATE TABLE Books (
    book_id INT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    author_id INT,
    genre VARCHAR(100),
    price DECIMAL(10, 2),
    publication_date DATE,
    FOREIGN KEY (author_id) REFERENCES Authors(author_id)
);
desc Books;
select * from Books;
-- Create Customers table
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE,
    address VARCHAR(255)
);
desc Customers;
select * from Customers;
-- Create Orders table
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_price DECIMAL(10, 2),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

-- Create Order_Items table
CREATE TABLE Order_Items (
    order_item_id INT PRIMARY KEY,
    order_id INT,
    book_id INT,
    quantity INT,
    subtotal DECIMAL(10, 2),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (book_id) REFERENCES Books(book_id)
);

-- Insert sample data into Authors table
INSERT INTO Authors (author_id, author_name) VALUES
    (1, 'Author1'),
    (2, 'Author2'),
    (3, 'Author3');

-- Insert sample data into Books table
INSERT INTO Books (book_id, title, author_id, genre, price, publication_date) VALUES
    (1, 'Book1', 1, 'Fiction', 29.99, '2022-01-01'),
    (2, 'Book2', 2, 'Non-Fiction', 19.99, '2022-02-15'),
    (3, 'Book3', 3, 'Mystery', 24.99, '2021-12-05');

-- Insert sample data into Customers table
INSERT INTO Customers (customer_id, customer_name, email, address) VALUES
    (1, 'Customer1', 'customer1@example.com', '123 Main St'),
    (2, 'Customer2', 'customer2@example.com', '456 Oak St'),
    (3, 'Customer3', 'customer3@example.com', '789 Pine St');

-- Insert sample data into Orders table
INSERT INTO Orders (order_id, customer_id, order_date, total_price) VALUES
    (1, 1, '2022-01-15', 29.99),
    (2, 2, '2022-02-20', 19.99),
    (3, 3, '2021-12-10', 24.99);

-- Insert sample data into Order_Items table
INSERT INTO Order_Items (order_item_id, order_id, book_id, quantity, subtotal) VALUES
    (1, 1, 1, 1, 29.99),
    (2, 2, 2, 2, 39.98),
    (3, 3, 3, 1, 24.99);
    
-- Example Queries:
-- Retrieve a list of all books with their authors
SELECT b.title, a.author_name
FROM Books b
JOIN Authors a ON b.author_id = a.author_id;

-- Get the total number of books in a specific genre
SELECT genre, COUNT(*) AS book_count
FROM Books
WHERE genre = 'Fiction'
GROUP BY genre;

-- Find the customer who made the most recent order
SELECT c.customer_name, o.order_date
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
ORDER BY o.order_date DESC
LIMIT 1;

-- Calculate the total revenue generated by the bookstore
SELECT SUM(oi.subtotal) AS total_revenue
FROM Order_Items oi;

-- Identify the top-selling book
SELECT b.title, SUM(oi.quantity) AS total_sold
FROM Books b
JOIN Order_Items oi ON b.book_id = oi.book_id
GROUP BY b.title
ORDER BY total_sold DESC
LIMIT 1;

-- List customers who have not placed any orders
SELECT c.customer_name
FROM Customers c
LEFT JOIN Orders o ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;