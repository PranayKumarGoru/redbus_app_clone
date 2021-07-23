--creating user table
CREATE TABLE Users (
    UserId varchar(255) PRIMARY KEY,
    Password varchar(255),
    Name varchar(255),
    Email varchar(255),
    Phone varchar(255),
    City varchar(255)
);
--adding mock values to the user table
INSERT INTO Users (UserId, Password, Name, Email, Phone, City)  
   VALUES ('admin', 'admin', 'TestUser', 'testuser@relevel.com', '7777000055', 'Hyderabad');

   
--creating TravelAgencies table
CREATE TABLE TravelAgencies (
    TravelAgencyId INTEGER PRIMARY KEY,
    TravelAgencyName varchar(255),
    TravelAgencyAddress varchar(255)
);

--adding mock values to the TravelAgencies table
INSERT INTO TravelAgencies (TravelAgencyId, TravelAgencyName, TravelAgencyAddress)  
   VALUES (4414, 'Raghavendra Agency', 'Y junction Kukatpally-Hyderabad');
INSERT INTO TravelAgencies (TravelAgencyId, TravelAgencyName, TravelAgencyAddress)  
   VALUES (7745, 'Orange Buses', 'Main road Beeramguda-Hyderabad');
INSERT INTO TravelAgencies (TravelAgencyId, TravelAgencyName, TravelAgencyAddress)   
   VALUES (7785, 'Venketeshwara Agency', 'RTC Crossroads, Ashoknagar-Banglore');
INSERT INTO TravelAgencies (TravelAgencyId, TravelAgencyName, TravelAgencyAddress)    
   VALUES (2247, 'Rajdoot Buses', '105 Mistry Mansion Ground Floor Mahatma Gandhi Road Kala Ghoda-Mumbai');
   
   
--creating DriverDetails table
CREATE TABLE DriverDetails (
    DriverId INTEGER PRIMARY KEY,
    TravelAgencyId INTEGER references TravelAgencies(TravelAgencyId),
    DriverName varchar(255),
    DriverMobile varchar(255)
);

--adding mock values to the DriverDetails table
INSERT INTO DriverDetails (DriverId, TravelAgencyId, DriverName, DriverMobile)  
   VALUES (6685, 4414, 'Ramesh', '7784455677');
INSERT INTO DriverDetails (DriverId, TravelAgencyId, DriverName, DriverMobile)  
   VALUES (1147, 4414, 'Suresh', '7784447477');
INSERT INTO DriverDetails (DriverId, TravelAgencyId, DriverName, DriverMobile)  
    VALUES (8856, 4414, 'Kiran', '8869741297');
INSERT INTO DriverDetails (DriverId, TravelAgencyId, DriverName, DriverMobile)  
     VALUES (4457, 4414, 'Mahesh', '7725479638');
   
--creating Buses table
CREATE TABLE Buses (
    BusId INTEGER PRIMARY KEY,
    TravelAgencyId INTEGER references TravelAgencies(TravelAgencyId),
    DriverId INTEGER references DriverDetails(DriverId),
    BusPlateNumber varchar(255),
    DateOfJourney DATE,
    TimeOfJourney varchar(255),
    Source varchar(255),
    Destination varchar(255),
    Fair DECIMAL,
    InitialCapacity INTEGER,
    AvailableCapacity INTEGER
);

--adding mock values to the Buses table 
INSERT INTO Buses (BusId, TravelAgencyId, DriverId, BusPlateNumber, DateOfJourney, TimeOfJourney, Source, Destination,
Fair, InitialCapacity, AvailableCapacity)  
   VALUES (2200, 4414, 6685, 'TS HH 4457', '2021-07-28', '08:30', 'Hyderabad', 'Goa', 2500.0, 40, 40);
INSERT INTO Buses (BusId, TravelAgencyId, DriverId, BusPlateNumber, DateOfJourney, TimeOfJourney, Source, Destination,
Fair, InitialCapacity, AvailableCapacity)  
   VALUES (1175, 4414, 1147, 'AP PR 6697', '2021-07-28', '09:30', 'Hyderabad', 'Goa', 2350.0, 45, 45);
INSERT INTO Buses (BusId, TravelAgencyId, DriverId, BusPlateNumber, DateOfJourney, TimeOfJourney, Source, Destination,
Fair, InitialCapacity, AvailableCapacity)  
   VALUES (9974, 4414, 8856, 'MP QT 4474', '2021-07-28', '10:30', 'Hyderabad', 'Goa', 2400.0, 60, 60);
INSERT INTO Buses (BusId, TravelAgencyId, DriverId, BusPlateNumber, DateOfJourney, TimeOfJourney, Source, Destination,
Fair, InitialCapacity, AvailableCapacity)  
   VALUES (5574, 4414, 4457, 'TS TR 4411', '2021-07-28', '12:30', 'Hyderabad', 'Goa', 2250.0, 60, 60);


--creating OrderDetails table
CREATE TABLE BookingDetails (
    BookingId INTEGER PRIMARY KEY,
    UserId varchar(255) references Users(UserId),
    BusId INTEGER references Buses(BusId),
    NumberOfSeats INTEGER,
    SeatNumbers varchar(255),
    BookingStatus varchar(255)
);


--adding mock values to the BookingDetails table
INSERT INTO BookingDetails (BookingId, UserId, BusId, NumberOfSeats, SeatNumbers, BookingStatus)  
   VALUES (557744, 'admin', 2200, 3, '1,2,3', 'Confirmed');
UPDATE Buses set AvailableCapacity = (select AvailableCapacity from Buses where BusId = 2200) - 3 where BusId = 2200;
INSERT INTO BookingDetails (BookingId, UserId, BusId, NumberOfSeats, SeatNumbers, BookingStatus)  
   VALUES (556685, 'admin', 2200, 4, '4,5,6,7', 'Confirmed');
UPDATE Buses set AvailableCapacity = (select AvailableCapacity from Buses where BusId = 2200) - 4 where BusId = 2200;
INSERT INTO BookingDetails (BookingId, UserId, BusId, NumberOfSeats, SeatNumbers, BookingStatus)  
   VALUES (774411, 'admin', 1175, 5, '1,2,3,4,5', 'Confirmed');
UPDATE Buses set AvailableCapacity = (select AvailableCapacity from Buses where BusId = 1175) - 5 where BusId = 1175;
INSERT INTO BookingDetails (BookingId, UserId, BusId, NumberOfSeats, SeatNumbers, BookingStatus)  
   VALUES (996655, 'admin', 1175, 4, '6,7,8,9', 'Confirmed');
UPDATE Buses set AvailableCapacity = (select AvailableCapacity from Buses where BusId = 1175) - 4 where BusId = 1175;








