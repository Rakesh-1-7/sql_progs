create DATABaSE bank;
use bank;

create table branch(branchname varchar(20),branchcity varchar(20),assets int,primary key(branchname));
insert into branch values('Sigo','Banglore',1000000);
insert into branch values('Hugo','Delhi',50000000);
insert into branch values('Jai','Kolkata',2500000);

select * from branch;

create table account(account_no varchar(20),branchname varchar(20),balance int,primary key(account_no,branchname),foreign key(branchname) references branch(branchname) on delete cascade);

create table customer(customername varchar(20),customer_street varchar(20),city varchar(20),primary key(customername));

create table depositor(customername varchar(20),account_no varchar(20), primary key(customername,account_no),foreign key(customername) references customer(customername) on delete cascade,foreign key(account_no) references account(account_no) on delete cascade);

desc depositor;

create table loan(loannumber varchar(20),branchname varchar(20),Amount int, primary key(loannumber,branchname), foreign key(branchname) references account(branchname) on delete cascade);

create table borrower(customername varchar(20), loannumber varchar(20), primary key(customername,loannumber), foreign key(customername) references customer(customername) on delete cascade, foreign key(loannumber) references loan(loannumber) on delete cascade);

select * from branch;
insert into branch values('Boi','Banglore',6700000);
select * from branch;

insert into account values('SBI001','Boi',10000);
insert into account values('SBI003','Boi',20000);
insert into account values('SBI002','Boi',5000);
insert into account values('SBI001','Jai',10000);

select * from account;

insert into customer values('Raj','Villa','Banglore');
insert into customer values('Rajni','Street','Banglore');
insert into customer values('Aka','White Street','Banglore');
insert into customer values('Kai','Dollar Street','Mysore');

select * from customer;

insert into depositor values('Raj','SBI001');
insert into depositor values('Rajni','SBI003');
insert into depositor values('Aka','SBI002');
insert into depositor values('Kai','SBI001');

commit;
