-- Create database
CREATE DATABASE oceanview;
USE oceanview;

-- Users table for login
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(100) NOT NULL
);

-- Insert a sample admin user
INSERT INTO users (username, password) VALUES ('admin', '123');

CREATE TABLE rooms (
    room_id INT AUTO_INCREMENT PRIMARY KEY,
    room_type VARCHAR(50) NOT NULL,
    price INT NOT NULL
);

INSERT INTO rooms (room_type, price) VALUES 
('Standard', 5000),
('Deluxe', 8000),
('Suite', 12000);

-- Reservations table
CREATE TABLE reservations (
    reservation_no VARCHAR(20) PRIMARY KEY,
    guest_name VARCHAR(100) NOT NULL,
    address VARCHAR(255) NOT NULL,
    contact VARCHAR(20) NOT NULL,
    room_type ENUM('Standard', 'Deluxe', 'Suite') NOT NULL,
    check_in DATE NOT NULL,
    check_out DATE NOT NULL
);
