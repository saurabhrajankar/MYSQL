 --SQL JOINS--combining 2 or more records of different tables from the same database into one comprehensive structure known as joining tables.
--types --inner(equi or simple), left, right, full outer (not support in MySQL), self-join 
--1.joins-- join the table but those joint the table who the same attribute in another table..uses the retrive the data both the table
create table table1				--both are id is common column
(
	id int,
	firstname varchar(max)
)
drop table table1,table2
create table table2
(
	id int,
	lastname varchar(max)
)
create table table4
(
	id int,
	middlename varchar(max)
)
insert into table1 values (1,'saurabh'),(2,'pratik'),(4,'abhi')
insert into table2 values (1,'ashish'),(4,'sagar'),(6,'abhi')
insert into table4 values (1,'ashish'),(2,'sagar'),(6,'abhi')
select * from table1
select * from table2

select * from table1 
inner join table2 on table1.id=table2.id
inner join table4 on table4.id= table2.id
--Joining the one or more table
--and we can use on using the join the table
--there is not shows other id because not same on the both table 

--LEFT JOIN--Left join statement retrieve the data from left side of table then retrieve the data from right side but same id
--if not shows same id in another table then value should becoms null
select * from table1 left join table2 on table1.id=table2.id

 --RIGHT JOIN statement retrive the data from right side of table then retrieve the data from left side but same id
 --if not any same id in another table then value should be null
select * from table1 right join table2 on table1.id=table2.id

--SELF JOIN =self-join statement joins or compare a table with itself.but in selfjoin same tabel two times 
create table  table3(id int,firstname varchar(max),lastname varchar(max),depid int)
insert into table3 values (1,'saurabh','Rajnakar',1),(2,'pratik','sonone',9),(3,'abhi','parve',3) --2nd row cannot be insert beacause no depid and id not match
select * from table3 p,table3 q where p.id=q.depid  
drop table table3
--above showes only same table so we cannot join them thats why use alieas name
--base on where condition

--Practice Qution
--write a query to find personid,name,noof friends,sum of marks of person who have friends with total score greater than 100
drop table person
create table person 
(
	personID int primary key,
	Name varchar(50),
	email varchar(50),
	score int
)
insert into person values(1,'saurabh','saurabh@gmail.com',88)
insert into person values(2,'ashish','ashish@gmail.com',75)
insert into person values(3,'pratik','pratik@gmail.com',55)
insert into person values(4,'arun','arun@gmail.com',73)
select * from person
select * from friend
create table friend
(
	personID int,
	friendID int
	foreign key(personID)references person(personID)
)
insert into friend values(1,2)
insert into friend values(2,4)
insert into friend values(3,5)
insert into friend values(4,2)
select * from friend
select * from person
select f.personID,f.friendID,p.score from friend f inner join
person p on f.personID=p.personID
where score<60