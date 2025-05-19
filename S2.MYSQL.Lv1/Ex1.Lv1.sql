create database OpticaBottom;
use OpticaBottom;

CREATE TABLE supplier (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  street VARCHAR(100),
  street_number VARCHAR(10),
  floor VARCHAR(10),
  door VARCHAR(10),
  city VARCHAR(50),
  postal_code VARCHAR(10),
  country VARCHAR(50),
  phone VARCHAR(20),
  fax VARCHAR(20),
  tax_id VARCHAR(20)
);

CREATE TABLE glasses (
  id INT AUTO_INCREMENT PRIMARY KEY,
  brand VARCHAR(100) NOT NULL,
  right_lens_grade DECIMAL(4,2),
  left_lens_grade DECIMAL(4,2),
  frame_type ENUM('rimless', 'plastic', 'metal'),
  frame_color VARCHAR(50),
  right_lens_color VARCHAR(50),
  left_lens_color VARCHAR(50),
  price DECIMAL(10,2),
  supplier_id INT,
  FOREIGN KEY (supplier_id) REFERENCES supplier(id)
);

CREATE TABLE client (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  address VARCHAR(150),
  phone VARCHAR(20),
  email VARCHAR(100),
  registration_date DATE,
  referred_by_id INT,
  FOREIGN KEY (referred_by_id) REFERENCES client(id)
);

CREATE TABLE employee (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL
);

CREATE TABLE sale (
  id INT AUTO_INCREMENT PRIMARY KEY,
  sale_date DATE NOT NULL,
  client_id INT,
  glasses_id INT,
  employee_id INT,
  FOREIGN KEY (client_id) REFERENCES client(id),
  FOREIGN KEY (glasses_id) REFERENCES glasses(id),
  FOREIGN KEY (employee_id) REFERENCES employee(id)
);

INSERT INTO supplier (name, street, number, floor, door, city, postal_code, country, phone, fax, tax_id)
VALUES 
('VisionWorld', 'Main Street', '123', '2', 'B', 'Barcelona', '08001', 'Spain', '+34 931234567', '+34 931234568', 'B12345678'),
('OpticaGlobal', 'Avinguda Diagonal', '456', '1', 'A', 'Barcelona', '08021', 'Spain', '+34 932223344', NULL, 'B87654321'),
('EyeStyle', 'Carrer del Sol', '12', NULL, NULL, 'Girona', '17001', 'Spain', '+34 972112233', '+34 972112244', 'B11223344');

INSERT INTO glasses (brand, right_lens_grade, left_lens_grade, frame_type, frame_color, right_lens_color, left_lens_color, price, supplier_id)
VALUES 
('Ray-Ban', -1.25, -1.00, 'plastic', 'black', 'gray', 'gray', 129.99, 1),
('Oakley', -0.50, -0.75, 'metal', 'silver', 'blue', 'blue', 149.50, 2),
('Gucci', 0.00, 0.00, 'rimless', 'gold', 'transparent', 'transparent', 199.90, 1);

INSERT INTO client (name, address, phone, email, registration_date, referred_by_id)
VALUES 
('Anna Smith', 'Carrer Major, 12', '+34 600123456', 'anna@example.com', '2024-05-01', NULL),
('John Doe', 'Avinguda Mar, 45', '+34 600654321', 'john@example.com', '2024-05-10', 1),
('Laura Perez', 'Passeig Gracia, 78', '+34 601112233', 'laura@example.com', '2024-06-01', 1);

INSERT INTO employee (name)
VALUES 
('Marta Garcia'),
('David Ruiz'),
('Elena Torres');

INSERT INTO sale (sale_date, client_id, glasses_id, employee_id)
VALUES 
('2024-06-10', 1, 1, 2),
('2024-06-12', 2, 2, 1),
('2024-06-15', 3, 3, 3);

