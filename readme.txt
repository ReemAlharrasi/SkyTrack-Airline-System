ERD ===================================
ERD is straight forward and easy to draw.

MAPPING ===============================
mapping was easy as FK are simple and forward and easy to understand. But I need to go back and add the primary keys that i decided on later.

DDL ===================================
I had to rewrite it multiple times because I decided to not use the unique values as primary keys

DML ===================================
Msg 547, Level 16, State 0, Line 61
The INSERT statement conflicted with the FOREIGN KEY constraint "FK_FlightCrew_Crew". The conflict occurred in database "SkyTrack", table "dbo.Crew_Member", column 'Crew_id'.
The statement has been terminated.

Completion time: 2026-09-23T15:48:27.8743846+04:00

SOLution: wrong order of columns and values



DQL ===================================
SELECT c.FullName, c.role
FROM Crew_Member c
JOIN Flight_crew fc ON fc.Crew_id=c.Crew_id
JOIN Flight f ON f.Flight_id = fc.Flight_id
HAVING f.Flight_number = 'SK101';

Error:
Msg 8121, Level 16, State 1, Line 21
Column 'Flight.Flight_number' is invalid in the HAVING clause because it is not contained in either an aggregate function or the GROUP BY clause.

Fix:
Use WHERE instead
-----------------

SELECT b.Booking_id, SUM(b.price_paid) AS total_revenue, COUNT(b.Booking_id), AVG(b.price_paid), MAX(b.price_paid), MIN(b.price_paid)
FROM Booking b;

error:
Msg 8120, Level 16, State 1, Line 55
Column 'Booking.Booking_id' is invalid in the select list because it is not contained in either an aggregate function or the GROUP BY clause.


fix? add GROUP by

--------------
SELECT b.Booking_id, SUM(b.price_paid) AS total_revenue, COUNT(b.Booking_id), AVG(b.price_paid), MAX(b.price_paid), MIN(b.price_paid)
FROM Booking b
GROUP BY b.Booking_id;

issue: column headers are empty for some

Fix? use AS <alias>
-------------------

Msg 8120, Level 16, State 1, Line 37
Column 'Booking.price_paid' is invalid in the select list because it is not contained in either an aggregate function or the GROUP BY clause.

Completion time: 2026-09-23T17:44:29.4369239+04:00


Solution: forgot to write the aggregate function name

------------
Msg 8120, Level 16, State 1, Line 6
Column 'Flight.Flight_number' is invalid in the select list because it is not contained in either an aggregate function or the GROUP BY clause.


Solution: use group by because we are using aggregate functions
--------------

SELECT f.Flight_number, SUM(b.price_paid) AS Total_revenue
FROM Flight f
JOIN Booking b ON f.Flight_id = b.Flight_id
GROUP BY f.Flight_number
HAVING SUM(b.price_paid)>500
ORDER BY Total_revenue DESC;


this showed me an empty table, so i changed HAVING SUM(b.price_paid)>500 to this HAVING SUM(b.price_paid)>50

----------------
SELECT c.FullName, SUM(cf.flight_id) as total_flights
FROM Crew_Member c
JOIN Flight_crew cf ON c.Crew_id = cf.Crew_id
GROUP BY c.FullName
HAVING total_flights > 1;


Msg 207, Level 16, State 1, Line 34
Invalid column name 'total_flights'.

Completion time: 2026-09-24T09:07:47.4971571+04:00


fix? replace total_flights in last line with SUM(cf.flight_id)

-----------------

SELECT f.Flight_number,AVG(b.price_paid) AS average_price
FROM Flight f
JOIN Booking b ON f.Flight_id = b.Flight_id
GROUP BY f.Flight_number
HAVING price_paid> AVG(b.price_paid);

Msg 8121, Level 16, State 1, Line 41
Column 'Booking.price_paid' is invalid in the HAVING clause because it is not contained in either an aggregate function or the GROUP BY clause.

Completion time: 2026-09-24T09:12:31.7375403+04:00


fix? Having condition is wrongly worded
replace with HAVING AVG(b.price_paid) > (SELECT AVG(price_paid) FROM Booking) 