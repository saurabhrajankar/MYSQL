create database clothstore

CREATE TABLE Users(
	Id int Identity(1,1) PRIMARY KEY,
	Fullname varchar (200),
	Email varchar (100),
	Mobile varchar(30),
	Password varchar(150)
	)
	select * from Users
	--Register
create or alter proc addreg(@Fullname varchar(50),@Email varchar(50),@Mobile varchar(50),@Password varchar(50))
as begin
insert into Users values(@Fullname,@Email,@Mobile,@Password)
end
	--Login
drop proc Logins
create proc Logins (@Email varchar(50),@Password nvarchar(50))
as begin
select * from Users where Email=@Email and Password=@Password
end 
--Forget Password
create proc Forget (@Email varchar(50))
as begin
select * from Users where Email=@Email 
end 
--Reset pass
create proc Reset (@Email varchar(50),@Password nvarchar(50))
as begin
Update Users Set Password=@Password where Email=@Email
end 

create table AddressType
(
    TypeId int IDENTITY(1,1) PRIMARY KEY,
	Type varchar(200)
);

create table Addresses
(
    AddressId int IDENTITY(1,1) PRIMARY KEY,
	Address varchar(max),
	City varchar(100),
	State varchar(100),
	Type int FOREIGN KEY (Type) REFERENCES AddressType(TypeId),
	UserId INT NOT NULL FOREIGN KEY (UserId) REFERENCES Users(Id),
	--Fullname varchar(200) foreign key (Fullname) References Users(Fullname)
);

create TABLE clothtable(
	clothId int Identity(1,1) PRIMARY KEY,
	clothName varchar(200),
	brandName varchar(200),
    rating varchar(200),   
	totalRating int,
	discountPrice int,
	originalPrice int,
	description varchar(255),
	clothImage varchar(200)
	);

CREATE TABLE CartTable
(
	CartId INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	UserId INT NOT NULL
	FOREIGN KEY (UserId) REFERENCES Users(Id),
	clothId INT NOT NULL
	FOREIGN KEY (clothId) REFERENCES clothtable(clothId),	
	Quantity INT Not Null
);
create table Feedback
(FeedbackId int identity(1,1) primary key,
UserID int foreign key (Userid) References Users(Id),
clothId int foreign key (clothId) References clothtable(clothId),
Comment varchar(500),
Ratings int);

create table OrderTable(
OrdersId int identity(1,1) not null primary key,
UserId int FOREIGN KEY (UserId) REFERENCES Users(Id),
clothId int FOREIGN KEY (clothId) REFERENCES clothtable(clothId),
AddressId int FOREIGN KEY (AddressId) REFERENCES Addresses(AddressId),
TotalPrice int,
BookQuantity int,
OrderDate Date);

Create table WishList
(
	WishListId int identity(1,1) not null primary key,
	UserId int foreign key references Users(Id) on delete no action,
	clothId int foreign key references clothtable(clothId) on delete no action
);