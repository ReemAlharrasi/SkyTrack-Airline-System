USE SkyTrack;

-- ==============Medium Level==============
-- 1. For each flight, show the flight number, the name of the origin airport, and the name of the destination airport.
SELECT f.Flight_number, a.Name AS departing_airport , b.Name AS arriving_airport
FROM Flight f
JOIN Airport a ON f.Departing_Airport_code = a.Airport_id
JOIN Airport b ON f.Departing_Airport_code = b.Airport_id;

-- 2. Show each booking along with the full name of the passenger who made it and the flight number it belongs to.
SELECT FullName AS PassengerName, f.FlightNumber
FROM Booking b
JOIN Passenger p ON b.PassengerID = p.PassengerID
JOIN Flight f ON b.FlightID = f.FlightID;

-- 3. List all crew members assigned to flight 'SK101', showing their full name and role.

-- 4. Show all completed flights along with the aircraft model used on each flight.

-- 5. For each passenger, show their full name and the total number of bookings they have made. Order by booking count from highest to lowest.

-- 6. Show the total revenue collected from each booking class.

-- 7. Count how many flights each aircraft has been assigned to.

-- 8. List all flights that have more than one booking.

-- 9. Show the full details of all bookings — passenger name, flight number, origin airport, destination airport, class, and price paid.
