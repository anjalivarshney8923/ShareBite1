-- Database setup for Sharebite Food Rescue App
-- Run this script to create the necessary database and tables

-- Create database if it doesn't exist
CREATE DATABASE IF NOT EXISTS sharebite_db;
USE sharebite_db;

-- Create users table
CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    role ENUM('donor', 'ngo', 'admin') NOT NULL,
    organizationName VARCHAR(255),
    phone VARCHAR(20),
    city VARCHAR(100),
    isActive BOOLEAN DEFAULT TRUE,
    organizationType VARCHAR(100),
    donationFrequency VARCHAR(100),
    verificationStatus VARCHAR(50) DEFAULT 'pending',
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Create food_listings table
CREATE TABLE IF NOT EXISTS food_listings (
    id INT AUTO_INCREMENT PRIMARY KEY,
    donorId INT NOT NULL,
    foodName VARCHAR(255) NOT NULL,
    description TEXT,
    quantity INT NOT NULL,
    quantityUnit VARCHAR(50) NOT NULL,
    foodType VARCHAR(50) NOT NULL,
    expiryDate DATE NOT NULL,
    pickupAddress VARCHAR(500) NOT NULL,
    pickupCity VARCHAR(100) NOT NULL,
    pickupState VARCHAR(100) NOT NULL,
    pickupZipCode VARCHAR(20) NOT NULL,
    pickupInstructions TEXT,
    status ENUM('available', 'reserved', 'picked_up', 'expired') DEFAULT 'available',
    imageUrl VARCHAR(500),
    latitude DECIMAL(10, 8),
    longitude DECIMAL(11, 8),
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    isActive BOOLEAN DEFAULT TRUE,
    FOREIGN KEY (donorId) REFERENCES users(id) ON DELETE CASCADE
);

-- Create food_requests table
CREATE TABLE IF NOT EXISTS food_requests (
    id INT AUTO_INCREMENT PRIMARY KEY,
    ngoId INT NOT NULL,
    foodListingId INT NOT NULL,
    requestMessage TEXT,
    pickupDate DATE,
    pickupTime TIME,
    status ENUM('pending', 'approved', 'rejected', 'completed') DEFAULT 'pending',
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    isActive BOOLEAN DEFAULT TRUE,
    FOREIGN KEY (ngoId) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (foodListingId) REFERENCES food_listings(id) ON DELETE CASCADE
);

-- Insert sample data for testing
INSERT IGNORE INTO users (id, name, email, password, role, organizationName, phone, city, organizationType) VALUES
(1, 'John Doe', 'john@example.com', 'password123', 'donor', 'John\'s Restaurant', '555-0123', 'New York', 'restaurant'),
(2, 'Jane Smith', 'jane@example.com', 'password123', 'ngo', 'Food Bank NYC', '555-0456', 'New York', 'food_bank'),
(3, 'Admin User', 'admin@1', '123', 'admin', 'Sharebite Admin', '555-0789', 'New York', 'admin');

-- Insert sample food listings
INSERT IGNORE INTO food_listings (id, donorId, foodName, description, quantity, quantityUnit, foodType, expiryDate, pickupAddress, pickupCity, pickupState, pickupZipCode, pickupInstructions, status) VALUES
(1, 1, 'Fresh Vegetables', 'Mixed vegetables including carrots, broccoli, and bell peppers', 5, 'kg', 'fresh', '2024-12-31', '123 Main St', 'New York', 'NY', '10001', 'Call before arrival', 'available'),
(2, 1, 'Bread and Pastries', 'Assorted bread and pastries from bakery', 20, 'pieces', 'baked', '2024-12-25', '123 Main St', 'New York', 'NY', '10001', 'Available after 6 PM', 'available');

-- Create indexes for better performance
CREATE INDEX idx_food_listings_donor ON food_listings(donorId);
CREATE INDEX idx_food_listings_status ON food_listings(status);
CREATE INDEX idx_food_listings_city ON food_listings(pickupCity);
CREATE INDEX idx_food_listings_expiry ON food_listings(expiryDate);
CREATE INDEX idx_food_requests_ngo ON food_requests(ngoId);
CREATE INDEX idx_food_requests_listing ON food_requests(foodListingId);
