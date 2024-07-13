-- Create Customer Table
CREATE TABLE Customer (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    password VARCHAR(255)
);

-- Create MenuItem Table
CREATE TABLE MenuItem (
    menu_item_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    price DECIMAL(10, 2),
    description VARCHAR(255)
);

-- Create MenuItemPhoto Table
CREATE TABLE MenuItemPhoto (
    photo_id INT PRIMARY KEY AUTO_INCREMENT,
    menu_item_id INT,
    photo_url VARCHAR(255),
    FOREIGN KEY (menu_item_id) REFERENCES MenuItem(menu_item_id)
);

-- Create Order Table
CREATE TABLE `Order` (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status ENUM('new', 'in-progress', 'completed'),
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id)
);

-- Create OrderItem Table
CREATE TABLE OrderItem (
    order_item_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    menu_item_id INT,
    quantity INT,
    FOREIGN KEY (order_id) REFERENCES `Order`(order_id),
    FOREIGN KEY (menu_item_id) REFERENCES MenuItem(menu_item_id)
);
