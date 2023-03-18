-- create database and use it
CREATE DATABASE railway_management_system;
USE railway_management_system;

-- create table for train details
CREATE TABLE train_details (
  train_no INT PRIMARY KEY,
  station_code VARCHAR(10),
  station_name VARCHAR(100),
  arrival_time TIME,
  departure_time TIME,
  distance INT,
  source_station VARCHAR(10),
  source_station_name VARCHAR(100),
  destination_station VARCHAR(10),
  destination_station_name VARCHAR(100)
);

-- insert data into train_details table
LOAD DATA INFILE 'Train_details.csv'
INTO TABLE train_details
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- create table for bookings
CREATE TABLE bookings (
  booking_id INT PRIMARY KEY AUTO_INCREMENT,
  train_no INT,
  source_station VARCHAR(10),
  destination_station VARCHAR(10),
  passenger_name VARCHAR(100),
  booking_date DATE,
  FOREIGN KEY (train_no) REFERENCES train_details(train_no)
);

-- add sample bookings data
INSERT INTO bookings (train_no, source_station, destination_station, passenger_name, booking_date)
VALUES (12345, 'SRC', 'DST', 'John Doe', '2023-03-20'),
       (67890, 'SRC', 'DST', 'Jane Doe', '2023-03-21');

-- view train details
SELECT * FROM train_details;

-- view bookings
SELECT * FROM bookings;

-- book a ticket
INSERT INTO bookings (train_no, source_station, destination_station, passenger_name, booking_date)
VALUES (12345, 'SRC', 'DST', 'James Smith', '2023-03-22');

-- cancel a booked ticket
DELETE FROM bookings
WHERE booking_id = 2;

-- check fares before booking
SELECT distance * 0.05 AS fare
FROM train_details
WHERE train_no = 12345;

-- check bookings
SELECT *
FROM bookings
WHERE passenger_name = 'John Doe';
