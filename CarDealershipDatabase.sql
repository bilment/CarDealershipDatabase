DROP DATABASE IF EXISTS CarDealershipDatabase;

CREATE DATABASE CarDealershipDatabase;

USE CarDealershipDatabase;


CREATE TABLE dealerships (
Dealership_ID INT AUTO_INCREMENT PRIMARY KEY,
Name varchar(50) NOT NULL,
Address varchar(50) NOT NULL,
Phone varchar(12),
Sold BOOLEAN DEFAULT FALSE
);

CREATE TABLE vehicles (
Vin VARCHAR(17) PRIMARY KEY,
Year INT NOT NULL,
Make VARCHAR(50) NOT NULL,
Model VARCHAR(50) NOT NULL,
VehicleType VARCHAR(50),
Color VARCHAR(50),
Price INT NOT NULL
);

CREATE TABLE inventory (
Dealership_id INT,
Vin VARCHAR(17),
PRIMARY KEY (dealership_id, vin),
FOREIGN KEY (dealership_id) REFERENCES dealerships(dealership_id),
FOREIGN KEY (vin) REFERENCES vehicles(vin)
);

CREATE TABLE sales_contract (
Contract_ID INT AUTO_INCREMENT PRIMARY KEY,
Date DATE NOT NULL,
CustomerName VARCHAR(100) NOT NULL,
CustomerEmail VARCHAR(100),
VehicleSold VARCHAR(17),
MonthlyPayment DECIMAL(10, 2),
FOREIGN KEY (vehicleSold) REFERENCES vehicles(vin)
);
