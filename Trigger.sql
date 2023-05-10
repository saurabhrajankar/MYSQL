--trigger=>trigger special kind of store Procedure that automatically execute when an event occurs in the database server.
--3 types trigeer
--1.DM
--2.DDL 3.LOGON trigger         DML(insert update delete) triggers are fired automatically in responce to DML events 1.after trigger 2.insted of trigger
DML--there are two magical table that inserted and deleted
create table student 
(
	id int,
	name varchar (max),
	gender char(1),
	class int,
	fees decimal	
)
insert into student values(1,'saurabh','M',10,500),(2,'ashish','M',13,1000),(3,'sagar','M',12,1500),(4,'abhi','M',9,2000),(5,'pratiksha','F',11,3000)
insert into student values(6,'viru','F',20,4000)
insert into student values(7,'vicy','M',14,5000)
insert into student values(8,'ashu','M',15,6000)


select * from student
drop trigger forinsert
--1.create trigger 
create or alter trigger forinsert  --create trigger
on student				--on which table
after insert
as 
begin
print 'Adding the person in student table please check' --whatever the event occur then print that message
end
--2.alter trigger
alter trigger forinsert  --altertrigger bur same same as create
on student				--on which table
after insert
as 
begin
select *from inserted	--whatever row inserted in student table the one copy created in inserted teble 
end
--3.Delete trigger 
create or alter trigger fordelete  --delete trigger
on student				--on which table
after delete
as 
begin
select *from deleted	--whatever row Deleted in student table the one copy created in Deleted teble 
end
delete from student where id=5;

--Audit Information Trigger
create table student_audit
(Auditid int primary key identity,Audit_info varchar(max))
select * from student_audit
 
create trigger tr_student_audit 
on student 
after insert 
as
begin
declare @id int 
select @id =id from inserted --those id are inserted who are new row			
insert into student_audit values('student with id' + @id +  'is added at'  + GETDATE() )
end

Alter trigger tr_student_audit 
on student 
after insert 
as
begin
declare @id int 
select @id =id from inserted --those id are inserted who are new row			
insert into student_audit values('student with id' + @id +  'is added at'  + GETDATE() )
end


create table employees
(
	employeeId int primary key,
	name varchar(50),
	email varchar(50),
	salary decimal(10,2)
)
insert into employees values(1,'saurbh','saurabh@gmail.com',5000.00)
insert into employees values(2,'ashish','ashish@gmail.com',6000.00)

create table employee_audit
(Auditid int primary key identity,Audit_info varchar(max))
create trigger forinsert  
on employees				
after insert
as 
begin
select *from inserted
declare @id int 
select @id =id from inserted 			
insert into employee_audit values('student with id' + @id +  'is added at'  + GETDATE() )
end

--Finding the employees who have the same job title as their manager
create table emp
(
	emp_id int primary key,
	emp_name varchar(50),
	job_title varchar(50),
	manager_id int,
	foreign key (manager_id) references manager(manager_id)
)
insert into emp values(1,'saurabh','sales',1)

create table manager
(
	manager_id int primary key,
	manager_name varchar(50),
	dep_name varchar(50)
)

insert into manager values(1,'ashish','sales')

SELECT emp_name 
FROM emp 
WHERE job_title = (
    SELECT job_title 
    FROM emp 
    WHERE emp_id = manager_id
)

