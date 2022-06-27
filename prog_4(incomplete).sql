create database student;
use student;


create table faculty(fid int, fname varchar(20), deptid int, primary key(fid));
create table student(snum int, sname varchar(20),major varchar(20), level varchar(20), age int, primary key(snum));
create table class(name varchar(20),meets_at time,room varchar(20),fid int, primary key(name), foreign key(fid) references faculty(fid));
create table enrolled(snum int, cname varchar(20), foreign key(snum) references student(snum), foreign key(cname) references class(name));

insert into faculty values(1,"A",10);
insert into faculty values(2,"B",10);
insert into faculty values(3,"C",20);
insert into faculty values(4,"D",10);
insert into faculty values(5,"E",20);

insert into student values(1,"Z","CSE","JR",19);
insert into student values(2,"Y","CSE","JR",19);
insert into student values(3,"X","ISE","SR",21);
insert into student values(4,"W","ECE","SR",20);
insert into student values(5,"V","ISE","JR",18);
desc class;
insert into class values("AB","2:00:00","401",1);
insert into class values("AC","2:30:00","402",1);
insert into class values("BA","2:15:00","403",2);
insert into class values("CA","2:10:00","404",3);
desc enrolled;

insert into enrolled(10,);



