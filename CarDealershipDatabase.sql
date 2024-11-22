create database CarDealershipDatabase;

CREATE TABLE dealerships (
dealership_id INT AUTO_INCREMENT PRIMARY KEY,
name varchar(50) NOT NULL,
address varchar(50),
phone varchar(12)
);

CREATE TABLE vehicles (
vin VARCHAR(17) PRIMARY KEY,
year INT NOT NULL,
make VARCHAR(50) NOT NULL,
model VARCHAR(50) NOT NULL,
vehicleType VARCHAR(50),
color VARCHAR(50),
price INT NOT NULL
);

CREATE TABLE inventory (
dealership_id INT,
vin VARCHAR(17),
PRIMARY KEY (dealership_id, vin),
FOREIGN KEY (dealership_id) REFERENCES dealerships(dealership_id),
FOREIGN KEY (vin) REFERENCES vehicles(vin)
);

CREATE TABLE sales_contract (
contract_id INT AUTO_INCREMENT PRIMARY KEY,
date DATE NOT NULL,
customerName VARCHAR(50) NOT NULL,
customerEmail VARCHAR(50),
vehicleSold VARCHAR(5),
monthlyPayment DECIMAL(10, 2),
FOREIGN KEY (vehicleSold) REFERENCES vehicles(vin)
);
