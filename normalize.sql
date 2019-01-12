
create table Courses(
Id Integer PRIMARY key,
Name Text not null,
Description text not null,
RoomNumber text
)

insert into Courses (Name, Description, RoomNumber)
values ('Math','Algebra and Geometry Core Concepts','B102'),
('Health','Excercise and Nutrition Core Concepts','F203'),
('Science','Biology Essentials','B104'),
('Language Arts','18th century literature','B110'),
('Chemistry','Core concepts of Chemistry','F211'),
('Homeroom','Student Daily Prep','A100')


Create table Addresses (
Id INTEGER PRIMARY key,
Address1 text ,
 Address2 text,
 City text,
 State text, 
 PostalCode number
);

insert into Addresses (
Address1,
Address2,
City,
State,
PostalCode
) values
('5 runline rd','','Roswell','GA',	737373),
('45 trimline lane',	'apt 5508',	'Roswell',	'GA',737373),
('45 trimline lane',	'apt 8759',	'Roswell',	'GA',737373),
('4 soft lane',	'',	'mareitta',	'GA',84746),
('74 tech road',	'',	'mareitta',	'GA',84746),
('1 beltline rd',	'',	'mareitta',	'GA',56664),
('33 beltline rd',	'',	'Roswell',	'GA',43354),
('4 folk lane',	'apt. 3502',	'Roswell',	'GA',43354)


CREATE TABLE Teachers (
 Id INTEGER PRIMARY KEY,
 FirstName TEXT NOT NULL,
 LastName TEXT Not null,
 AddressId Integer Not null,
FOREIGN KEY(AddressId) REFERENCES Addresses(Id) 
);

insert into teachers (
firstname, LastName,AddressId
) values ('Ray',	'Lollito',1), 
('Tim','Meadows',2),
('Mary','Reed',3),
('Karen','Peach',4),
('Trish','Parks',5)

CREATE TABLE Students (
 Id INTEGER PRIMARY KEY,
 FirstName TEXT NOT NULL,
 LastName TEXT Not null,
 AddressId Integer Not null,
FOREIGN KEY(AddressId) REFERENCES Addresses(Id) 
);

insert into Students (
firstname, LastName, AddressId
) values ('Josh','Oppenheim', 6),
('Paul','Walker', 7),
('John','Foley', 8)

create table Student_Courses(
 Id Integer PRIMARY key,
 StudentId Integer ,
 CourseId Integer
)

insert into Student_Courses (
StudentId, CourseId
) values (1,1),
(1,3),
(1,4),
(1,5),
(1,6),
(2,1),
(2,3),
(2,4),
(2,5),
(2,6),
(3,1),
(3,2),
(3,3),
(3,4),
(3,5),
(3,6)


create table Grades (
Id Integer PRIMARY key,
Grade text not null,
NumericMin INteger not null,
NumericMax Integer not null
)

insert into Grades (
grade, NumericMin, NumericMax
) values ('A', 90, 100),
('B', 80, 89),
('C', 75, 79),
('D', 70, 74),
('F', 0, 69)

create table Student_Courses_Grades(
StudentCoursesId integer,
GradesId integer
)

insert into Student_Courses_Grades (StudentCoursesId, GradesId)
values 
(1,1),
(2,1),
(3,1),
(4,1),
(5,1),
(6,2),
(7,2),
(8,1),
(9,1),
(10,2),
(11,3),
(12,3),
(13,4),
(14,3),
(15,2),
(16,5)

create table Teacher_Courses(
 TeacherId Integer,
 CourseId Integer
)

insert into Teacher_Courses (TeacherId, CourseId)
values (1,2),
(2,3),
(3,4),
(4,1),
(4,6),
(5,5)


/* get all teachers */

select * from Teachers

/* get all teachers and addresses */

select t.firstName, t.LastName, a.Address1, a.Address2, a.City, a.State, a.PostalCode from Teachers t 
join Addresses a on t.AddressId = a.Id

/* get all teachers and courses they teach */
select t.firstName, t.lastName, c.name, c.description, c.roomnumber from Teachers t 
join Teacher_Courses tc on t.id = tc.TeacherId
join Courses c on tc.CourseId = c.Id

/*get all grades and course names for student with Id 1(Oppenheim) */
select s.LastName, c.name, g.grade from Courses c 
inner join Student_Courses sc on c.Id = sc.CourseId 
inner join Students s on s.Id = sc.StudentId
inner join Student_Courses_Grades scg on scg.StudentCoursesId = sc.Id
inner join Grades g on g.Id = scg.GradesId 
where s.id = 1

/*get all courses for the student with id of 2 */
select s.firstName, s.lastname, c.name, c.Description from Students s 
inner join Student_Courses sc on s.Id = sc.StudentId 
inner join Courses c on sc.CourseId = c.Id
where s.id = 2

/*get all courses*/
select * from Courses 


