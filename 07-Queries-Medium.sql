USE SkyTrack;

-- ==============Medium Level==============
-- 1. For each flight, show the flight number, the name of the origin airport, and the name of the destination airport.
SELECT f.Flight_number, a.Name AS departing_airport , b.Name AS arriving_airport
FROM Flight f
JOIN Airport a ON f.Departing_Airport_code = a.Airport_id
JOIN Airport b ON f.Arriving_Airport_code = b.Airport_id;

-- 2. Show each booking along with the full name of the passenger who made it and the flight number it belongs to.
SELECT FullName AS PassengerName, f.Flight_number
FROM Booking b
JOIN Passenger p ON b.Passenger_id = p.Passenger_id
JOIN Flight f ON b.Flight_id = f.Flight_id;

-- 3. List all crew members assigned to flight 'SK101', showing their full name and role.
SELECT c.FullName AS CrewName,c.Role
FROM Flight_crew fc
JOIN Crew_Member c ON fc.Crew_id = c.Crew_id
JOIN Flight f ON fc.Flight_id = f.Flight_id
WHERE f.Flight_number = 'SK101';

-- 4. Show all completed flights along with the aircraft model used on each flight.
SELECT f.Flight_number,a.Model
FROM Flight f
JOIN Aircraft a ON f.Aircraft_Registeration_Number = a.Aircraft_id
WHERE f.Status = 'Completed';

-- 5. For each passenger, show their full name and the total number of bookings they have made. Order by booking count from highest to lowest.
SELECT p.FullName AS PassengerName,COUNT(b.Booking_id) AS BookingCount
FROM Passenger p
LEFT JOIN Booking b ON p.Passenger_id = b.Passenger_id
GROUP BY p.Passenger_id,p.FullName
ORDER BY BookingCount DESC;

-- 6. Show the total revenue collected from each booking class.
SELECT Class, SUM(price_paid) AS TotalRevenue
FROM Booking
GROUP BY Class;

-- 7. Count how many flights each aircraft has been assigned to.
SELECT a.Aircraft_id, a.Model, COUNT(f.Flight_id) AS FlightCount
FROM Aircraft a
LEFT JOIN Flight f ON a.Aircraft_id = f.Aircraft_Registeration_Number
GROUP BY a.Aircraft_id, a.Model;


-- 8. List all flights that have more than one booking.
SELECT f.Flight_number, COUNT(b.Booking_id) AS BookingCount
FROM Flight f
JOIN Booking b ON f.Flight_id = b.Flight_id
GROUP BY f.Flight_id, f.Flight_number
HAVING COUNT(b.Booking_id) > 1;

-- 9. Show the full details of all bookings — passenger name, flight number, origin airport, destination airport, class, and price paid.
SELECT p.FullName AS PassengerName, f.Flight_number, origin.Name AS OriginAirport, destination.Name AS DestinationAirport, b.Class, b.price_paid
FROM Booking b
JOIN Passenger p ON b.Passenger_id = p.Passenger_id
JOIN Flight f ON b.Flight_id = f.Flight_id
JOIN Airport origin ON f.Departing_Airport_code = origin.Airport_id
JOIN Airport destination ON f.Arriving_Airport_code = destination.Airport_id;
