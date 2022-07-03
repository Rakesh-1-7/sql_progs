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

select distinct s.sname from student s,faculty f,enrolled e,class c where s.snum=e.snum and e.cname=c.cname and c.fid=f.fid and f.fname='Nmaratha M' and s.level='junior';
select c.cname from class c where room='r1' or c.cname in(select e.cname from enrolled e group by e.cname having count(*)>=5);

select distinct f.fname from faculty f where (select count(e.snum) from class c,enrolled e where c.cname=e.cname and c.fid=f.fid)<5;
select distinct s.sname from student s where s.snum not in(select e.snum from enrolled e);
select distinct s.sname from student s where s.snum in(select e1.snum from enrolled e1,enrolled e2,class c1,class c2 where e1.snum=e2.snum and e1.cname<>e2.cname and e1.cname=c1.cname and e2.cname=c2.cname and c1.meeting=c2.meeting);


