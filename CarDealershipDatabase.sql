DROP DATABASE IF EXISTS CarDealershipDatabase;

CREATE DATABASE CarDealershipDatabase;

USE CarDealershipDatabase;

CREATE TABLE dealerships (
    Dealership_ID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    Address VARCHAR(50) NOT NULL,
    Phone VARCHAR(12)
);

CREATE TABLE vehicles (
    Vin VARCHAR(17) PRIMARY KEY,
    Year INT NOT NULL,
    Make VARCHAR(50) NOT NULL,
    Model VARCHAR(50) NOT NULL,
    VehicleType VARCHAR(50),
    Color VARCHAR(50),
    Price INT NOT NULL,
    Sold BOOLEAN DEFAULT FALSE
);

CREATE TABLE inventory (
    Dealership_ID INT,
    Vin VARCHAR(17),
    PRIMARY KEY (Dealership_ID, Vin),
    FOREIGN KEY (Dealership_ID) REFERENCES dealerships(Dealership_ID),
    FOREIGN KEY (Vin) REFERENCES vehicles(Vin)
);

CREATE TABLE sales_contracts (
    Contract_ID INT AUTO_INCREMENT PRIMARY KEY,
    Date DATE NOT NULL,
    CustomerName VARCHAR(100) NOT NULL,
    CustomerEmail VARCHAR(100),
    VehicleSold VARCHAR(17),
    MonthlyPayment DECIMAL(10, 2),
    FOREIGN KEY (VehicleSold) REFERENCES vehicles(Vin)
);

INSERT INTO dealerships (Name, Address, Phone)
VALUES 
    ('Elite Motors', '123 Main St', '1234567890'),
    ('Auto Galaxy', '456 Elm St', '9876543210'),
    ('Luxury Rides', '321 Luxury Ln', '5678901234'),
    ('Budget Cars', '654 Budget Blvd', '3456789012'),
    ('Speedy Auto', '789 Fast Rd', '2345678901'),
    ('Fast Cars', '789 Oak Ave', '1122334455');

INSERT INTO vehicles (Vin, Year, Make, Model, VehicleType, Color, Price, Sold)
VALUES
    ('1HGCM82633A123456', 2023, 'Toyota', 'Camry', 'Sedan', 'Blue', 30000, FALSE),
    ('1HGCM82633A123457', 2022, 'Honda', 'Civic', 'Sedan', 'Black', 25000, FALSE),
    ('2HGCM82633A123459', 2021, 'Chevrolet', 'Malibu', 'Sedan', 'Silver', 20000, FALSE),
    ('3HGCM82633A123460', 2020, 'Nissan', 'Altima', 'Sedan', 'Red', 18000, FALSE),
    ('4HGCM82633A123461', 2023, 'BMW', 'X5', 'SUV', 'Black', 55000, TRUE),
    ('5HGCM82633A123462', 2022, 'Tesla', 'Model 3', 'Sedan', 'White', 45000, TRUE),
    ('6HGCM82633A123463', 2023, 'Audi', 'A6', 'Sedan', 'Blue', 50000, FALSE),
    ('1HGCM82633A123458', 2023, 'Ford', 'Explorer', 'SUV', 'White', 40000, TRUE);

INSERT INTO inventory (Dealership_ID, Vin)
VALUES
    (1, '1HGCM82633A123456'),
    (1, '1HGCM82633A123457'),
	(3, '2HGCM82633A123459'),
    (3, '3HGCM82633A123460'),
    (4, '4HGCM82633A123461'),
    (4, '5HGCM82633A123462'),
    (2, '1HGCM82633A123458');

INSERT INTO sales_contracts (Date, CustomerName, CustomerEmail, VehicleSold, MonthlyPayment)
VALUES
    ('2024-11-15', 'John Doe', 'johndoe@example.com', '1HGCM82633A123458', 38000.00),
    ('2024-11-22', 'Alice Johnson', 'alice.johnson@example.com', '4HGCM82633A123461', 54000.00),
    ('2024-11-23', 'Bob Anderson', 'bob.anderson@example.com', '5HGCM82633A123462', 43000.00),
    ('2024-11-24', 'Charlie Smith', 'charlie.smith@example.com', '1HGCM82633A123458', 40000.00),
    ('2024-11-20', 'Jane Smith', 'janesmith@example.com', '1HGCM82633A123457', 24000.00);

