CREATE DATABASE INSURANCE;
USE INSURANCE;

CREATE TABLE PERSON( driver_id varchar(20), name varchar(20), address varchar(30), primary key(driver_id) );
desc person;
insert into person values('A01','Aaron','xxx');
desc person;
insert into person values('A02','Sam','xxy');
insert into person values('A03','Daksh','xyz');
insert into person values('A04','Ram','yyy');
insert into person values('A05','Tom','zzz');

select * from person;

create table car(reg_no varchar(20),model varchar(20),manufac_year int,primary key(reg_no) );

desc car;

insert into car values('KA052250','Indica','1980');
insert into car values('KA031181','Swift','1957');
insert into car values('KA095477','Ferarri','1998');
insert into car values('KA053408','Porsche','2008');
insert into car values('KA041702','Lamborgini','2005');

select * from car;


create table accident(report_num int, acc_date date, location varchar(30), primary key(report_num));

insert into accident values(11,'2008-12-10','Delhi');
insert into accident values(12,'2003-8-14','Banglore');
insert into accident values(13,'2000-6-15','Mumbai');
insert into accident values(14,'2010-1-1','Kolkata');
insert into accident values(15,'2012-9-30','Mysore');

select * from accident;

create table OWNS ( d_id varchar(20), Regno varchar(20), primary key(d_id,Regno), foreign key(d_id) references person(driver_id) );
insert into OWNS VALUES('A01','KA052250');
insert into OWNS VALUES('A02','KA053408');
insert into OWNS VALUES('A03','KA031181');
insert into OWNS VALUES('A04','KA095477');
insert into OWNS VALUES('A05','KA041702');


create table PARTICIPATED(driv_id varchar(20), Regno varchar(20), report_number int, damage_amount int, primary key(driv_id,Regno,report_number));

insert into PARTICIPATED values('A01','KA052250',11,10000);
insert into PARTICIPATED values('A02','KA053408',12,50000);
insert into PARTICIPATED values('A03','KA031181',13,25000);
insert into PARTICIPATED values('A04','KA095477',14,3000);
insert into PARTICIPATED values('A05','KA041702',15,5000);
commit;
SELECT * FROM PARTICIPATED;

select count(driv_id) from participated where driv_id="A04";
