USE SkyTrack;

-- ==============Basic Level==============
-- 1. List all flights and their current status, ordered by departure datetime from earliest to latest.
SELECT Flight_number, status,DepartureDateTime
FROM Flight
ORDER BY DepartureDateTime ASC;

-- 2. Show all passengers, ordered alphabetically by full name.
SELECT FullName
FROM Passenger
ORDER BY FullName ASC;

-- 3. List all aircraft and their seating capacity, ordered from largest to smallest.
SELECT Registration_Number, Capacity
FROM Aircraft
ORDER BY Capacity DESC;

-- 4. Show all bookings and their class. Display only distinct class values that exist in the system.
SELECT  DISTINCT class
FROM Booking;

-- 5. List all flights that have a status of 'Delayed' or 'Cancelled'.
SELECT *
FROM Flight
WHERE Status = 'Delayed' OR Status = 'Cancelled';

-- 6. Show all passengers whose nationality is 'Omani'.
SELECT * 
FROM Passenger
WHERE Nationality = 'Omani';

-- 7. List all airports, ordered by country.
SELECT * 
FROM Airport
ORDER BY Country;