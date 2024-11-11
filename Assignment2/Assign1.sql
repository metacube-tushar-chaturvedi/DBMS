CREATE DATABASES StoreFront;
USE StoreFront;
SHOW DATABASES;
SHOW TABLES;


CREATE TABLE users(
user_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(20) NOT NULL,
contact VARCHAR(15),
role VARCHAR(15) NOT NULL CHECK (role IN ('Seller', 'Administrator'))
);


CREATE TABLE catagory(
category_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(20) NOT NULL,
description VARCHAR(100),
parent_id INT,
FOREIGN KEY (parent_id) REFERENCES catagory(category_id) ON DELETE CASCADE
);

SET FOREIGN_KEY_CHECKS = 0;

CREATE TABLE product(Id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
Name VARCHAR(50) NOT NULL,
Description VARCHAR(100),
Price DECIMAL(10,2) NOT NULL,
Stock_quantity INT NOT NULL,
category_id INT NOT NULL,
FOREIGN KEY (category_id) REFERENCES catagory(category_id) ON DELETE CASCADE);

CREATE TABLE image(
product_id INT NOT NULL,
url VARCHAR(100),
FOREIGN KEY(product_id) REFERENCES product(Id)
);

CREATE TABLE address (
    id INT PRIMARY KEY auto_increment,
    user_id INT NOT NULL,
    pin varchar(6) NOT NULL,
    city VARCHAR(15) NOT NULL,
    state VARCHAR(15) NOT NULL,
    FOREIGN KEY(user_id) REFERENCES users(user_id) ON DELETE CASCADE
);

CREATE TABLE user_order (
    id INT PRIMARY KEY auto_increment,
    user_id INT NOT NULL,
    date DATE NOT NULL,
    amount DOUBLE NOT NULL,
    address_id INT NOT NULL,
    FOREIGN KEY(user_id) REFERENCES user(id) ON DELETE CASCADE,
    FOREIGN KEY(address_id) REFERENCES address(id) ON DELETE CASCADE
);

CREATE TABLE order_list(
order_id INT NOT NULL,
product_id INT NOT NULL,
FOREIGN KEY (order_id) REFERENCES user_order(id),
FOREIGN KEY (product_id) REFERENCES product(id)
);

/*
Command to print all tables names 
*/
SHOW TABLES;

/*
Remove Product table from database  
*/

DROP TABLE product;

CREATE TABLE product(Id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
Name VARCHAR(50) NOT NULL,
Description VARCHAR(100),
Price DECIMAL(10,2) NOT NULL,
Stock_quantity INT NOT NULL,
category_id INT NOT NULL,
FOREIGN KEY (category_id) REFERENCES catagory(category_id) ON DELETE CASCADE);





