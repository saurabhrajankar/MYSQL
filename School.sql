----student table		
CREATE DATABASE school_management;
drop database school_management
select * from classes
select * from students
select * from teachers
select * from subjects
select * from marks
CREATE TABLE students (
  student_id INT PRIMARY KEY,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  date_of_birth DATE NOT NULL,
  gender VARCHAR(10) NOT NULL,
);
insert into students values(1,'saurabh','Rajankar','2023-04-23','M')
insert into students values(2,'Pratik','patil','2023-04-24','M')
CREATE TABLE teachers (
  teacher_id INT PRIMARY KEY,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  date_of_birth DATE NOT NULL,
  gender VARCHAR(10) NOT NULL,
);
insert into teachers values(1,'Sing','sir','2023-04-24','M')
=
CREATE TABLE classes (
  class_id INT PRIMARY KEY,
  class_name VARCHAR(20) NOT NULL,
  section VARCHAR(10) NOT NULL,
  student_id int,
  subject_id INT,
  FOREIGN KEY (student_id) REFERENCES students(student_id),
  FOREIGN KEY (subject_id) REFERENCES subjects(subject_id)
);
insert into classes values(1,'Bcom','A',1,1)

CREATE TABLE subjects (
  subject_id INT PRIMARY KEY,
  subject_name VARCHAR(50) NOT NULL,
  teacher_id INT NOT NULL,
  FOREIGN KEY (teacher_id) REFERENCES teachers(teacher_id)
);
insert into subjects values(1,'Engineering',1)


CREATE TABLE marks (
  teacher_id INT NOT NULL,
  subject_id INT NOT NULL,
  marks_obtained INT NOT NULL,
  student_id int,
  FOREIGN KEY (teacher_id) REFERENCES teachers(teacher_id),
  FOREIGN KEY (student_id) REFERENCES students(student_id),
  FOREIGN KEY (subject_id) REFERENCES subjects(subject_id)
);
insert into marks values(1,1,50,1)
drop table students
