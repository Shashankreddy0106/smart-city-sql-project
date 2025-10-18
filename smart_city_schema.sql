-- smart_city_schema.sql
DROP DATABASE IF EXISTS smart_city;
CREATE DATABASE smart_city;
USE smart_city;

CREATE TABLE riders (
  rider_id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(100),
  age INT,
  city VARCHAR(50),
  signup_date DATE
);

CREATE TABLE drivers (
  driver_id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(100),
  vehicle_type ENUM('Bike','Auto','Cab','Bus','Metro'),
  city VARCHAR(50),
  experience_years INT,
  rating DECIMAL(2,1)
);

CREATE TABLE rides (
  ride_id INT PRIMARY KEY AUTO_INCREMENT,
  rider_id INT,
  driver_id INT,
  mode ENUM('Private','Public'),
  city VARCHAR(50),
  distance_km DECIMAL(5,2),
  fare_rs DECIMAL(7,2),
  start_time DATETIME,
  end_time DATETIME,
  FOREIGN KEY (rider_id) REFERENCES riders(rider_id),
  FOREIGN KEY (driver_id) REFERENCES drivers(driver_id)
);

CREATE TABLE feedback (
  feedback_id INT PRIMARY KEY AUTO_INCREMENT,
  ride_id INT,
  rating INT,
  comment VARCHAR(255),
  feedback_time DATETIME,
  FOREIGN KEY (ride_id) REFERENCES rides(ride_id)
);
