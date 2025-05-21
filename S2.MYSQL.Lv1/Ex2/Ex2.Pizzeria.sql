CREATE DATABASE IF NOT EXISTS pizzeria;
USE pizzeria;

-- Provinces
CREATE TABLE Provinces (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

-- Cities
CREATE TABLE Cities (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    province_id INT NOT NULL,
    FOREIGN KEY (province_id) REFERENCES Provinces(id)
);

-- Customers
CREATE TABLE Customers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(150) NOT NULL,
    address VARCHAR(200),
    postal_code VARCHAR(10),
    city_id INT,
    phone VARCHAR(20),
    FOREIGN KEY (city_id) REFERENCES Cities(id)
);

-- Stores
CREATE TABLE Stores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    address VARCHAR(200),
    postal_code VARCHAR(10),
    city_id INT,
    FOREIGN KEY (city_id) REFERENCES Cities(id)
);

-- Employees
CREATE TABLE Employees (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(150),
    nif VARCHAR(20) UNIQUE,
    phone VARCHAR(20),
    role ENUM('cook', 'delivery'),
    store_id INT,
    FOREIGN KEY (store_id) REFERENCES Stores(id)
);

-- Pizza Categories
CREATE TABLE Categories (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100)
);

-- Products
CREATE TABLE Products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    description TEXT,
    image VARCHAR(255),
    price DECIMAL(6,2),
    type ENUM('pizza', 'burger', 'drink'),
    category_id INT,
    FOREIGN KEY (category_id) REFERENCES Categories(id)
);

-- Orders
CREATE TABLE Orders (
    id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    store_id INT NOT NULL,
    date_time DATETIME NOT NULL,
    pickup_type ENUM('delivery', 'store') NOT NULL,
    total_price DECIMAL(8,2),
    delivery_employee_id INT,
    delivery_date_time DATETIME,
    FOREIGN KEY (customer_id) REFERENCES Customers(id),
    FOREIGN KEY (store_id) REFERENCES Stores(id),
    FOREIGN KEY (delivery_employee_id) REFERENCES Employees(id)
);

-- Order Products (an order can have multiple products)
CREATE TABLE Order_Products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY (order_id) REFERENCES Orders(id),
    FOREIGN KEY (product_id) REFERENCES Products(id)
);
