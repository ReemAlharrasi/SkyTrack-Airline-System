CREATE DATABASE SkyTrack;

USE SkyTrack;

CREATE TABLE Airport (
    Airport_id   INT IDENTITY(1,1) PRIMARY KEY,
    IATA_code CHAR(3) NOT NULL UNIQUE,
    Name VARCHAR(50) NOT NULL,
    City VARCHAR(50) NOT NULL,
    Country VARCHAR(50) NOT NULL
);

CREATE TABLE Aircraft (
    Aircraft_id INT IDENTITY(1,1) PRIMARY KEY,
    Registration_Number VARCHAR(20) NOT NULL UNIQUE,
    Model VARCHAR(50) NOT NULL,
    Manufacturer VARCHAR(50) NOT NULL,
    Capacity INT NOT NULL CHECK (Capacity>0),
    ManufactureYear INT
);

CREATE TABLE Flight(
    Flight_id INT IDENTITY(1,1) PRIMARY KEY,
    Flight_number VARCHAR(20)  NOT NULL UNIQUE,
    DepartureDateTime DATETIME NOT NULL,
    ArrivalDateTime DATETIME NOT NULL,
    Status VARCHAR(50) NOT NULL DEFAULT 'Scheduled' CHECK (Status IN ('Scheduled','Delayed','Cancelled','Completed')),
    Aircraft_Registeration_Number INT,
    Departing_Airport_code INT NOT NULL,
    Arriving_Airport_code INT NOT NULL,


    CONSTRAINT CHK_Flight_Dates CHECK (ArrivalDateTime > DepartureDateTime),

    CONSTRAINT FK_Aircraft_Registeration_Number
    FOREIGN KEY (Aircraft_Registeration_Number) REFERENCES Aircraft(Aircraft_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,

    CONSTRAINT FK_Departing_Airport_code
    FOREIGN KEY (Departing_Airport_code) REFERENCES Airport(Airport_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,

    CONSTRAINT FK_Arriving_Airport_code
    FOREIGN KEY (Arriving_Airport_code) REFERENCES Airport(Airport_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);


CREATE TABLE Passenger(
    Passenger_id   INT IDENTITY(1,1) PRIMARY KEY,
    NationalID      VARCHAR(30) NOT NULL UNIQUE,
    FullName VARCHAR(50) NOT NULL,
    Email VARCHAR(200) UNIQUE  NOT NULL,
    Phone VARCHAR(30) NOT NULL,
    Nationality VARCHAR(50) NOT NULL,
    DOB DATE NOT NULL
);

CREATE TABLE Booking(
    Booking_id INT IDENTITY(1,1) PRIMARY KEY,
    Passenger_id INT NOT NULL,
    Flight_id INT NOT NULL,
    seat_number VARCHAR(50) NOT NULL,
    class VARCHAR(50) NOT NULL CHECK (Class IN ('Economy','Business','First')),
    price_paid DECIMAL(10, 2) NOT NULL CHECK (Price_paid > 0),
    booking_date  DATE NOT NULL DEFAULT GETDATE(),
    

    CONSTRAINT  FK_Passenger_id
    FOREIGN KEY (Passenger_id) REFERENCES Passenger(Passenger_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,

    CONSTRAINT  FK_Flight_id
    FOREIGN KEY (Flight_id) REFERENCES Flight(Flight_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

CREATE TABLE Crew_Member(
    Crew_id           INT IDENTITY(1,1) PRIMARY KEY,
    License_number      VARCHAR(30) NOT NULL UNIQUE,
    FullName VARCHAR(50) NOT NULL,
    role VARCHAR(200) NOT NULL CHECK (Role IN ('Pilot','Co-Pilot','Flight Attendant','Engineer'))
);

CREATE TABLE Flight_crew(
    Flight_Crew_id INT IDENTITY(1,1) PRIMARY KEY,
    Crew_id INT NOT NULL,
    Flight_id INT NOT NULL,

    CONSTRAINT FK_FlightCrew_Crew
        FOREIGN KEY (Crew_id) REFERENCES Crew_Member(Crew_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,

    CONSTRAINT FK_FlightCrew_Flight
        FOREIGN KEY (Flight_id) REFERENCES Flight(Flight_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,

    CONSTRAINT UQ_FlightCrew UNIQUE (Crew_id, Flight_id)
);