DROP DATABASE IF EXISTS bamazonDB;
CREATE DATABASE bamazonDB;

USE bamazonDB;


CREATE TABLE products(
  item_id INT NOT NULL AUTO_INCREMENT,
  product_name VARCHAR(45) NULL,
  department_name VARCHAR(45) NULL,
  price INT(10) NULL,
  stock_quantity INT(10) NULL,
  PRIMARY KEY (item_id)
);

CREATE TABLE departments(
  department_id INT NOT NULL AUTO_INCREMENT,
  department_name VARCHAR(45) NULL,
  over_head_costs INT(10) NULL,
  product_sales INT(10) NULL,
  total_profit INT(10) NULL,
  PRIMARY KEY (department_id)
);
INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES ('Post-it Notes', 'Office Supplies', 3.20, 100);
INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES ('Planner Pens', 'Office Supplies', 6.99, 100);
INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES ('Wide Ruled Legal Pads', 'Office Supplies', 10.19, 100);
INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES ('Bonded Scissors', 'Office Supplies', 9.11, 50);

INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES ('Coding: 3 Manuscripts in 1 book:', 'Books', 6.99, 100);
INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES ('Cracking the Coding Interview', 'Books', 23.20, 50);
INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES ('Web Design with HTML, CSS', 'Books', 23.50, 50);
INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES ('Coding All-in-One for Dummies', 'Books', 23.69, 50);

INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES ('Apple Magic Mouse', 'Electronics', 73.55, 50);
INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES ('Logitech Wireless Keyboard', 'Electronics', 22.99, 50);
INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES ('Wireless Mouse with Nano Receiver', 'Electronics', 9.20, 50);
INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES ('Apple Magic Keyboard', 'Electronics', 115.99, 50);


