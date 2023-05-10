create database account
drop proc calculateinterest
--A stored procedure that calculates the interest for a given account based on the account balance, interest rate, and number of days.
create or alter proc calculateinterest @accountBalance decimal(18, 2),@interestRate decimal(5, 2),@numberOfDays int
as 
begin
	declare @interestAmount decimal(18, 2)
	set @interestAmount = @accountBalance * @interestRate / 100 * @numberOfDays / 365
	select @interestAmount 'Interest Amount'
end
calculateinterest 10000,5,90

--A stored procedure that transfers funds from one account to another, and logs the transaction details
drop table Accounts
create table Accounts
(
	Acc_id int primary key identity,
	Name varchar(50),
	account_number VARCHAR(20) NOT NULL UNIQUE,
	Balance decimal(18,2) NOT NULL
)
CREATE TABLE Transactions
(
    TransactionId int PRIMARY KEY IDENTITY(1,1),
    FromAccount int NOT NULL,
    ToAccount int NOT NULL,
    Amount decimal(18,2) NOT NULL,
    TransactionDate datetime NOT NULL
);
drop table Accounts
select * from Accounts
select * from Transactions
insert into Accounts values(12345,'Saurabh',3000)
insert into Accounts values(67891,'Ashish',5000)
insert into Accounts values(11223,'Pravin',3000)
insert into Accounts values(66778,'Yash',7000)


TransferFunds 4,3,1000

CREATE or alter PROCEDURE TransferFunds
(
    @fromAccount int,
    @toAccount int,
    @amount decimal(18,2)
)
AS
BEGIN
BEGIN TRANSACTION;
	UPDATE Accounts SET Balance = Balance - @amount WHERE Acc_id = @fromAccount;
	UPDATE Accounts SET Balance = Balance + @amount WHERE Acc_id = @toAccount;
INSERT INTO Transactions (FromAccount, ToAccount, Amount, TransactionDate) VALUES (@fromAccount, @toAccount, @amount, GETDATE());
COMMIT TRANSACTION;
end

select * from Accounts

exec UpdateAccountBalances 1,10,500

create or alter proc UpdateAccountBalances
(
     @fromAccount int,
    @toAccount int,
    @amount decimal(18,2)
)
as begin 
IF (@fromAccount is null or @toAccount is null or @amount is null)
begin
raiserror('Invalid input parameters. Please provide valid account numbers and transaction amount',16,1)

UPDATE Accounts SET Balance = Balance - @amount WHERE Acc_id = @fromAccount;
UPDATE Accounts SET Balance = Balance + @amount WHERE Acc_id = @toAccount;
select 'Transaction completed successfully' AS Result
end
end 

