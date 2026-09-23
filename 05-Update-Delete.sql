USE SkyTrack;

-- =================UPDATE=================
-- 1. Update one flight status from 'Scheduled' to 'Completed'.
UPDATE Flight
SET Status = 'Completed'
WHERE Flight_id = 1;

-- 2. Change one flight status from 'Delayed' to 'Cancelled'.
UPDATE Flight
SET Status = 'Cancelled'
WHERE Flight_id = 3;

-- 3. Increase all Economy class booking prices by 10%.
UPDATE Booking
SET price_paid = price_paid *1.1
WHERE class= 'Economy';

-- 4. Update one passenger's phone number.
UPDATE Passenger
SET Phone = '+968 9988 7766'
WHERE Passenger_id = 1;

-- 5. Move one crew member to a different role.
UPDATE Crew_Member
SET role = 'Pilot'
WHERE Crew_id = 2;

-- =================DELETE =================
-- 1. Delete one cancelled flight.
DELETE FROM Flight
WHERE Flight_id=4 AND Status = 'Cancelled';

-- 2. Delete one booking linked to a cancelled flight.
DELETE FROM Booking
WHERE Booking_id=4 AND Flight_id=3;

-- 3. Try to delete a passenger who has existing bookings. 
DELETE FROM Passenger
WHERE Passenger_id=1;

-- Observe what happens and write a short comment in your SQL file explaining the result.
-- ANSWER: the booking associated with the passenger also got deleted.