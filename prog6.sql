create database processing;
use processing;
create table customer(custid varchar(20),cname varchar(20),city varchar(20),primary key(custid,city));
alter table customer delete primary key(city);
insert into customer values('1a','omar','bangalore');
insert into customer values('2a','rahul','mysore');
insert into customer values('3a','sam','usa');
insert into customer values('4a','prakash','canada');
insert into customer values('5a','jay','ireland');

create table orderr(orderid varchar(20),odate date,custid varchar(20),ordamt int(20),primary key(orderid),foreign key(custid)references customer(custid) on delete cascade);
desc orderr;
insert into orderr values('10','2022-08-15','1a','10000');
insert into orderr values('20','2022-09-17','1a','10000');
insert into orderr values('30','2022-06-09','1a','10000');
insert into orderr values('40','2022-04-15','1a','10000');
insert into orderr values('50','2022-08-15','1a','10000');


create table item(itemid varchar(20),unitprice int(20),primary key(itemid));
insert into item values('1b','100');
insert into item values('2b','200');
insert into item values('3b','300');
insert into item values('4b','400');
insert into item values('5b','500');

create table orderitem(orderid varchar(20),itemid varchar(20),qty int(20),foreign key(orderid)references orderr(orderid),foreign key(itemid)references item(itemid));
desc orderitem;
alter table orderitem add primary key(orderid,itemid);
insert into orderitem values('10','1b',1000);
insert into orderitem values('20','2b',2000);
insert into orderitem values('30','3b',3000);
insert into orderitem values('40','4b',4000);
insert into orderitem values('50','5b',5000);
create table warehouse(warehouseid varchar(20),city varchar(20),primary key(warehouseid));
alter table warehouse add foreign key(city)references customer(city);
insert into warehouse values('1c','bangalore');
insert into warehouse values('2c','mysore');
insert into warehouse values('3c','us');
insert into warehouse values('4c','canada');
insert into warehouse values('5c','ireland');
create table shipment (orderid varchar(20),warehouseid varchar(20),shippingdate date,primary key(orderid,warehouseid),foreign key(orderid)references orderr(orderid),foreign key(warehouseid)references warehouse(warehouseid));
insert into shipment values('10','1c','2022-08-15');
insert into shipment values('20','2c','2022-08-15');
insert into shipment values('30','3c','2022-02-19');
insert into shipment values('40','4c','2022-12-05');
insert into shipment values('50','5c','2022-07-16');
select*from shipment;
