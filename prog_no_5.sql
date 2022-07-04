create database aeroplanes;
use aeroplanes;

create table flights(flno int, from_ varchar(20),to_ varchar(20),distance int, departs time, arrive time, price int, primary key(flno));
create table aircraft(aid int, aname varchar(20),cruisingrange int, primary key(aid));
create table employee(eid int, ename varchar(20), salary int, primary key(eid));
create table certified(eid int, aid int, primary key(eid), foreign key(eid) references employee(eid), foreign key(aid) references aircraft(aid));

insert into flights values(1,'Banglore','Manglore',300,'12:00:00','11:45:00',7500);
insert into flights values(2,'Banglore','Delhi',600,'4:30:00','4:10:00',20000);
insert into flights values(3,'Delhi','Manglore',700,'5:00:00','4:45:00',30000);
insert into flights values(4,'Delhi','Banglore',600,'17:30:00','17:00:00',25000);
insert into flights values(5,'Manglore','Banglore',300,'9:00:00','8:35:00',10000);

select * from flights;

insert into aircraft values(1,'Kingfisher',25);
insert into aircraft values(2,'Deccan',20);
insert into aircraft values(3,'Air India',30);
insert into aircraft values(4,'Foxy',40);
insert into aircraft values(5,'Winter',30);
select * from aircraft;

insert into employee values(1,'A',50000);
insert into employee values(2,'B',30000);
insert into employee values(3,'C',40000);
insert into employee values(4,'D',55000);
insert into employee values(5,'E',45000);

select * from employee;

insert into certified values(2,1);
insert into certified values(5,2);
insert into certified values(3,3);
insert into certified values(4,5);
insert into certified values(1,4);

select * from certified;

select a.aname from aircraft a,employee e,certified c where e.eid = c.eid and c.aid = a.aid and e.salary > 80000;
commit;
