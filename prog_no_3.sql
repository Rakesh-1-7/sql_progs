use test;


create table suppliers(sid int, sname varchar(20), address varchar(20), primary key(sid));
create table parts(pid int, pname varchar(20), color varchar(20), primary key(pid));
create table catalog(sid int, pid int, cost real, primary key(sid,pid),foreign key(sid) references suppliers(sid) on delete cascade,foreign key(pid) references parts(pid) on delete cascade);

insert into suppliers values(1,"Raj","India");
insert into suppliers values(2,"Rajesh","India");
insert into suppliers values(3,"Xena","USA");
insert into suppliers values(4,"Rama","UK");

select * from suppliers;

insert into parts values(1,"Screw Driver","Black");
insert into parts values(2,"Tape","Red");
insert into parts values(3,"Pen","Red");
insert into parts values(4,"Pencil","Red");
insert into parts values(5,"Eraser","White");
select * from parts;

insert into catalog values(1,1,2500.0);
insert into catalog values(1,2,500.0);
insert into catalog values(2,2,200.0);
insert into catalog values(2,1,1000.0);
select * from catalog;


select distinct p.pname from parts p,catalog c where p.pid=c.pid;
select s.sname from supplier s where not exists((select p.pid from parts p where (select c.pid from catalog c where c.sid=s.sid)));
select p.pid,s.sname from parts p,supplier s ,catalog c where c.pid=p.pid and c.sid=s.sid and c.cost=(select max(c1.cost)from catalog c1 where(c.pid=p.pid));
select c.sid from catalog c where c.cost>(select avg(cost) from catalog );
select avg(c1.cost) from catalog c1;
select sname from supplier where sid in(select sid from catalog group by sid having count(*))>=(select count(*) from parts where color='red');
select sname from catalog c,parts p where c.pid=p.pid and color='red' group by sid having color='red';
