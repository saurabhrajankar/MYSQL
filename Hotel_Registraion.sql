create database Hotel_Registration

CREATE TABLE Guest (
   GuestID int NOT NULL,
   FirstName varchar(255),
   LastName varchar(255),
   Email varchar(255),
   PhoneNumber varchar(20),
   PRIMARY KEY (GuestID)
);
CREATE TABLE Reservation (
   ReservationID int NOT NULL,
   GuestID int,
   CheckInDate date,
   CheckOutDate date,
   RoomID int,
   TotalPrice decimal(10,2),
   PRIMARY KEY (ReservationID),
   FOREIGN KEY (GuestID) REFERENCES Guest(GuestID),
   FOREIGN KEY (RoomID) REFERENCES Room(RoomID)
);
CREATE TABLE Room (
   RoomID int NOT NULL,
   RoomNumber varchar(20),
   RoomType varchar(255),
   BedType varchar(255),
   MaxOccupancy int,
   RoomPrice decimal(10,2),
   PRIMARY KEY (RoomID)
);
CREATE TABLE RoomAvailability (
   RoomID int,
   CheckInDate date,
   CheckOutDate date,
   PRIMARY KEY (RoomID, CheckInDate, CheckOutDate),
   FOREIGN KEY (RoomID) REFERENCES Room(RoomID)
);
CREATE TABLE RoomFeatures (
   RoomID int,
   FeatureName varchar(255),
   PRIMARY KEY (RoomID, FeatureName),
   FOREIGN KEY (RoomID) REFERENCES Room(RoomID)
);
);
CREATE TABLE Payment (
   PaymentID int NOT NULL,
   ReservationID int,
   PaymentDate date,
   Amount decimal(10,2),
   PaymentMethod varchar(255),
   PRIMARY KEY (PaymentID),
   FOREIGN KEY (ReservationID) REFERENCES Reservation(ReservationID)
);
CREATE TABLE Feedback (
   FeedbackID int NOT NULL,
   GuestID int,
   RoomID int,
   Ratinh int,
   Feedback date,
   Comment text,
   PaymentMethod varchar(255),
   PRIMARY KEY (FeedbackID),
   FOREIGN KEY (GuestID) REFERENCES Guest(GuestID)
);