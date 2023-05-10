create database subqueries
--subquery(inner query) means return the data will used in the main query as a condtion 
--two types of subquery 1.single row subquery 2.multirows subquery
--= operater given to the only one value but in operator given to the multiple value 
drop table customers
create table customers
(
	customer_id int,
	customername varchar(10),
	city varchar(20),
	postolcode varchar(6),
	country varchar(8),
	value int
)
insert into customers (customer_id,customername,city,postolcode,country,value) values(1,'saurabh','nashik',422006,'india',5)
insert into customers values(2,'ashish','nagpur',422007,'india',10)
insert into customers values(3,'deepak','nagpur',422007,'india',15)
insert into customers values(4,'gaurang','amravati',422008,'india',50)
insert into customers values(5,'anil','nashik',422006,'india',100)

--single row subquery
where city=(select city from customers where customername='deepak')
select max(value) from customers where value < (select max(value) from customers where value < (select max(value) from customers))
select min(value) from customers where value > (select minselect * from customers (value) from customers)

--Q.compare 2 who won the mathces
--Q.create point table who won the matches

create table icc_worldcup
(
	Team_1 varchar(20),
	Team_2 varchar(20),
	winner varchar(20)
)
insert into icc_worldcup values('india','SL','india')
insert into icc_worldcup values('india','Aus','aus')
insert into icc_worldcup values('eng','sr','eng')
insert into icc_worldcup values('india','eng','india')
insert into icc_worldcup values('india','nz','india')

select * from icc_worldcup

select team_name,count(1) as no_match_played,sum(winner_flag) as no_winnermatches, count(1)-sum(winner_flag) as no_loss_match
from(select Team_1 as team_name, case when Team_1=winner then 1 else 0 end as winner_flag from icc_worldcup
union all
select Team_2 as team_name, case when Team_2=winner then 1 else 0 end as winner_flag from icc_worldcup) A
group by team_name
order by no_winnermatches desc