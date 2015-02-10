
create database uni;
use uni;
create table Subj (
  id int not null auto_increment,
  name varchar(45) not null,
  description varchar(45) not null,
  free tinyint(1) not null,
  primary key (id));

create table Stud (
  id int not null auto_increment,
  name varchar(45) not null,
  course int not null,
  grupa int not null,
  primary key (id));

create table Studsubj (
  id int not null auto_increment,
  subjectId int not null,
  studentId int not null,
  primary key (id),
  constraint fk_subject
    foreign key(subjectId)
    references Subj (id),
  constraint fk_student
    foreign key (studentId)
    references Stud (id));

insert into subj(name, description, free) values('Algebra', 'alg', 0);
insert into subj(name, description, free) values('KompSeti', 'Kompiuterni Merezhi', 1);
insert into subj(name, description, free) values('OOP', 'Obiektno-orientovane programuvannya', 0);
insert into subj(name, description, free) values('ZahystInfo', 'Tehnologii zahusty informacii', 1);
insert into subj(name, description, free) values('IAD', 'Intelektualnyi analiz danyh', 0);
insert into subj(name, description, free) values('MatMetody', 'Matematuchni metody doslidzhennia operaciy', 0);
insert into subj(name, description, free) values('Commercia', 'Elektronna kommercia', 1);
insert into subj(name, description, free) values('Istoria', 'Istoria', 1);
insert into subj(name, description, free) values('ChyselniMet', 'Chyselni metody', 0);
insert into subj(name, description, free) values('Geometria', 'Geometria', 1);

insert into stud(name, course, grupa) values('Bogdanov', 1, 1);
insert into stud(name, course, grupa) values('Borisov', 1, 2);
insert into stud(name, course, grupa) values('Degtyar', 1, 3);
insert into stud(name, course, grupa) values('Ivanov', 2, 1);
insert into stud(name, course, grupa) values('Petrov', 2, 2);
insert into stud(name, course, grupa) values('Sidoriv', 2, 3);
insert into stud(name, course, grupa) values('Chernov', 3, 1);
insert into stud(name, course, grupa) values('Grachov', 3, 2);
insert into stud(name, course, grupa) values('Mironov', 3, 3);
insert into stud(name, course, grupa) values('Mihailov', 1, 1);

insert into studsubj(subjectId, studentId) values(1, 1);
insert into studsubj(subjectId, studentId) values(2, 1);
insert into studsubj(subjectId, studentId) values(3, 1);
insert into studsubj(subjectId, studentId) values(4, 2);
insert into studsubj(subjectId, studentId) values(5, 2);
insert into studsubj(subjectId, studentId) values(6, 2);
insert into studsubj(subjectId, studentId) values(7, 3);
insert into studsubj(subjectId, studentId) values(8, 3);
insert into studsubj(subjectId, studentId) values(9, 3);
insert into studsubj(subjectId, studentId) values(10, 3);


select sub.name, COUNT(s.id) as Number
from Stud s join Studsubj ss on s.id = ss.studentId join Subj sub on ss.subjectId = sub.id
where sub.free = 'true'
group by sub.name;


select *
from Stud AS s
where s.course in (
					select s.course
					from Stud AS s
					where COUNT(s.grupa) < 4 AND s.grupa in (
														select s.grupa
														from Stud AS s
														where COUNT(s.id) < 11));

delete from subj 
where sub.free = 'true' AND COUNT(s.id) = 0;