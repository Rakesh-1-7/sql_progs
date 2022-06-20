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


select count(pname) from parts where pname is not null;

select sname from suppliers;
select sname from suppliers where color == (select sname from parts where color == "Red");
