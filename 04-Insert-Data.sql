USE SkyTrack;

INSERT INTO airport (IATA_code, Name, City, Country) VALUES
('MCT','Muscat International Airport','Muscat','Oman'),
('SLL','Salalah Airport','Salalah','Oman'),
('DXB','Dubai International Airport','Dubai','United Arab Emirates'),
('DOH','Hamad International Airport','Doha','Qatar'),
('BOM','Chhatrapati Shivaji Maharaj Intl Airport','Mumbai','India'),
('LHR','Heathrow Airport','London','United Kingdom');

INSERT INTO Aircraft (Registration_Number,Model,Manufacturer,Capacity,ManufactureYear) VALUES
('A4O-DA','737-800','Boeing',189,2015),
('A4O-DB','A330-300','Airbus',189,2017),
('A4O-DC','787-9 Dreamliner','Boeing',189,2019),
('A4O-DD','E175','Embraer',189,2016),
('A4O-DE','A320neo','Airbus',189,2021);

INSERT INTO Flight (Flight_number,DepartureDateTime,ArrivalDateTime,Status,Aircraft_Registeration_Number,Departing_Airport_code,Arriving_Airport_code) VALUES
('SK101','20120618 08:00:00 AM','20261001 09:15:00 AM','Scheduled', 1 , 1, 3),
('SK102','20261001 03:00:00 PM','20261001 04:20:00 PM','Scheduled', 2 , 3, 1),
('SK103','20261002 07:30:00 AM','20261002 08:45:00 AM','Delayed', 3 , 1, 4),
('SK104','20260918 08:00:00 PM','20260918 09:10:00 PM','Cancelled', 4 , 4, 1),
('SK105','20260920 10:00:00 AM','20260920 01:30:00 PM','Completed', 5 , 1, 5),
('SK106','20260921 02:00:00 PM','20260921 04:15:00 PM','Completed', 1 , 5, 1),
('SK107','20261005 02:00:00 AM','20261005 08:30:00 AM','Scheduled', 2 , 1, 6),
('SK108','20260915 09:00:00 AM','20260915 10:10:00 AM','Completed', 4 , 1, 2);

INSERT INTO Passenger (NationalID,FullName,Email,Phone,Nationality,DOB) VALUES
('10123456','Ahmed Al Balushi','ahmed.balushi@example.com','+968 9123 4567','Omani','1990-05-14'),
('10234567','Fatma Al Habsi','fatma.habsi@example.com','+968 9234 5678','Omani','1985-11-02'),
('10345678','Rashid Al Kindi','rashid.kindi@example.com','+968 9345 6789','Omani','1978-03-22'),
('AE998877','Sara Mohammed','sara.mohammed@example.com','++971 50 123 4567','Emirati','1992-07-19'),
('QA554433','Khalid Al Thani','khalid.thani@example.com','+974 3312 3456','Qatari','1988-01-30'),
('IN776655','Priya Sharma','priya.sharma@example.com','+91 98765 43210','Indian','1995-09-10'),
('GB334455','James Whitfield','james.whitfield@example.com','+44 7700 900123','British','1980-12-05'),
('EG112233','Layla Nasser','layla.nasser@example.com','+20 100 123 4567','Egyptian','1993-04-27');

INSERT INTO Booking (Passenger_id,Flight_id,seat_number,class,price_paid,booking_date) VALUES
(1, 1, '12A', 'Economy', 45.000, '2026-09-01'),
(2, 1, '2C', 'Business', 120.000, '2026-09-02'),
(4, 2, '14B', 'Economy', 48.500, '2026-09-03'),
(5, 3, '1A', 'First', 250.000, '2026-09-05'),
(6, 5, '20D', 'Economy', 95.000, '2026-08-30'),
(7, 7, '5A', 'Business', 480.000, '2026-09-10'),
(8, 6, '18C', 'Economy', 90.000, '2026-09-01'),
(3, 8, '9F', 'Economy', 35.000, '2026-08-25'),
(1, 7, '1B', 'First', 520.000, '2026-09-12'),
(2, 5, '3D', 'Business', 210.000, '2026-08-29'),
(4, 8, '4A', 'Business', 60.000, '2026-09-04'),
(5, 4, '10A', 'Economy', 55.000, '2026-08-20');

INSERT INTO Crew_Member (License_number,FullName,role) VALUES
('PL1001','Salim Al Riyami','Pilot'),
('PL1002','Noor Al Mahrouqi','Co-Pilot'),
('PL1003','Yousef Al Amri','Pilot'),
('FA2001','Hind Al Zadjali','Flight Attendant'),
('FA2002','Omar Al Harthy','Flight Attendant'),
('FA2003','Mariam Al Saadi','Flight Attendant'),
('EN3001','Aisha Al Busaidi','Engineer');

INSERT INTO Flight_crew (Flight_id,Crew_id) VALUES
(1,1),(1,2),(1,4),
(2,3),(2,5),
(3,1),(3,6),(3,7),
(4,3),(4,4),
(5,1),(5,2),(5,5),
(6,3),(6,6),
(7,1),(7,4),(7,7),
(8,3),(8,5);