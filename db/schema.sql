DROP DATABASE IF EXISTS dummy_db;
CREATE DATABASE dummy_db;

USE dummy_db;

DROP TABLE IF EXISTS Customers;
CREATE TABLE Customers(id INT PRIMARY KEY AUTO_INCREMENT,
                       first_name varchar(25) NOT NULL,
                       last_name varchar(25) NOT NULL 
);



DROP TABLE IF EXISTS Employees;
CREATE TABLE Employees (id INT PRIMARY KEY AUTO_INCREMENT,
                        first_name varchar(50) NOT NULL,
                        last_name varchar(50)  NOT NULL,
                        hourly_wage DECIMAL NOT NULL,
                        date_hired DATE NOT NULL);
                        
DROP TABLE IF EXISTS Transactions;
CREATE TABLE Transactions(id INT PRIMARY KEY AUTO_INCREMENT,
                          amount DECIMAL NOT NULL,
                          customer_id INT,
                          employee_id INT,
                          FOREIGN KEY (customer_id) REFERENCES Customers(id),
                          FOREIGN KEY (employee_id) REFERENCES Employees(id)
                         );
