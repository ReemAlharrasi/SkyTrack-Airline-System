USE SkyTrack;

-- ============== Advanced Level ==============
-- 1. Show each flight with its flight number, origin airport, destination airport, aircraft model, 
-- and the total number of passengers booked on it.  Include flights that have no bookings. -> left join
SELECT f.Flight_number, o.Name, d.Name, a.Model, COUNT(b.Booking_id) AS total_passengers
FROM Flight f
JOIN Airport o on f.Departing_Airport_code = o.Airport_id
JOIN Airport d on f.Arriving_Airport_code = d.Airport_id
JOIN Aircraft a on f.Aircraft_Registeration_Number = a.Aircraft_id
LEFT JOIN Booking b ON f.Flight_id = b.Flight_id
GROUP BY  f.Flight_number, o.Name, d.Name, a.Model;

-- 2. List all passengers who have never made a booking.
SELECT *
FROM Passenger p
WHERE p.Passenger_id NOT IN (SELECT Passenger_id FROM Booking);

-- 3. For each flight, show the flight number and the total revenue generated from its bookings. 
-- Show only flights where the total revenue exceeds 500. Order from highest to lowest.
SELECT f.Flight_number, SUM(b.price_paid) AS Total_revenue
FROM Flight f
JOIN Booking b ON f.Flight_id = b.Flight_id
GROUP BY f.Flight_number
HAVING SUM(b.price_paid)>50
ORDER BY Total_revenue DESC;

-- 4. Show each crew member's full name and the total number of flights they have been assigned to. 
-- Show only crew members assigned to more than one flight.
SELECT c.FullName, SUM(cf.flight_id) as total_flights
FROM Crew_Member c
JOIN Flight_crew cf ON c.Crew_id = cf.Crew_id
GROUP BY c.FullName
HAVING SUM(cf.flight_id) > 1;

-- 5. Find the average booking price per flight. Show only flights where the average price is above the overall average price across all bookings.
SELECT f.Flight_number,AVG(b.price_paid) AS average_price --this gives avg for price paid for each flight alone
FROM Flight f
JOIN Booking b ON f.Flight_id = b.Flight_id
GROUP BY f.Flight_number
HAVING AVG(b.price_paid) > (SELECT AVG(price_paid) FROM Booking)  ; -- this gives the average across all flights

-- 6. Show the flight with the highest number of bookings. Display its flight number, origin, destination, and total bookings.
SELECT TOP 1 
f.Flight_number, o.Name, d.Name, COUNT(b.Booking_id) AS Total_Bookings
FROM Flight f
JOIN Airport o on f.Departing_Airport_code = o.Airport_id
JOIN Airport d on f.Arriving_Airport_code = d.Airport_id
JOIN Booking b ON b.Flight_id = f.Flight_id
GROUP BY f.Flight_number, o.Name, d.Name
ORDER BY Total_Bookings DESC;

-- 7. For each booking class, show the total revenue, the number of bookings, the average price, the highest price, and the lowest price.
SELECT b.Booking_id, SUM(b.price_paid) AS total_revenue, COUNT(b.Booking_id) AS Total_Boookings, AVG(b.price_paid) AS Average_price, MAX(b.price_paid) AS highest_price, MIN(b.price_paid) AS lowest_price
FROM Booking b
GROUP BY b.Booking_id;

-- 8. List all passengers who booked a flight that is currently 'Cancelled'. Show the passenger name, flight number, and booking date.
SELECT p.FullName, f.Flight_number, b.booking_date
FROM Booking b
JOIN Passenger p ON b.Passenger_id = p.Passenger_id
JOIN Flight f ON b.Flight_id = f.Flight_id
WHERE f.Status = 'Cancelled';

-- 9. Show all flights that have at least one pilot and at least one flight attendant assigned. Display the flight number, total crew count, and departure datetime.
SELECT f.Flight_number, COUNT(fc.Crew_id) AS Total_Crew, f.DepartureDateTime
FROM Flight f
JOIN Flight_crew fc ON f.Flight_id = fc.Flight_id
JOIN Crew_Member cm ON fc.Crew_id = cm.Crew_id
GROUP BY f.Flight_number, f.DepartureDateTime
HAVING SUM(CASE WHEN cm.role = 'Pilot' THEN 1 ELSE 0 END) >= 1
   AND SUM(CASE WHEN cm.role = 'Flight Attendant' THEN 1 ELSE 0 END) >= 1;

-- 10. FINAL CHALLENGE: Show the complete flight summary — flight number, origin airport city, destination airport city, aircraft model, aircraft manufacturer, total passengers booked, total crew assigned, and total revenue. Order by total revenue from highest to lowest.
SELECT f.Flight_number, ao.City AS Origin_City, ad.City AS Destination_City, ac.Model AS Aircraft_Model, ac.Manufacturer, COUNT(DISTINCT b.Booking_id) AS Total_Passengers, COUNT(DISTINCT fc.Crew_id) AS Total_Crew, ISNULL(SUM(b.price_paid), 0) AS Total_Revenue
FROM Flight f
JOIN Airport ao ON f.Departing_Airport_code = ao.Airport_id
JOIN Airport ad ON f.Arriving_Airport_code = ad.Airport_id
JOIN Aircraft ac ON f.Aircraft_Registeration_Number = ac.Aircraft_id
LEFT JOIN Booking b ON f.Flight_id = b.Flight_id
LEFT JOIN Flight_crew fc ON f.Flight_id = fc.Flight_id
GROUP BY f.Flight_number, ao.City, ad.City, ac.Model, ac.Manufacturer
ORDER BY Total_Revenue DESC;
